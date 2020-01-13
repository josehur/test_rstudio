SparkR::sparkR.session()
library(sparklyr)
library(dplyr)


sc <- sparklyr::spark_connect(method = "databricks")

train_df <- dplyr::tbl(sc, 'kaggle_train') %>%
  dplyr::mutate(timestamp = sql("CAST(unix_timestamp(timestamp, 'yyyy-MM-dd HH:mm:ss') AS timestamp)"))


train_df_electricity  <- train_df %>%
  dplyr::filter(meter == 0) %>%
  dplyr::rename(electricity = meter_reading) %>% 
  dplyr::arrange(building_id, timestamp) %>% 
  dplyr::select(building_id, timestamp, electricity) %>%
  dplyr::compute(name = "temp_electricity")


#write table in database
sparklyr::spark_write_table(train_df_electricity, "train_df_electricity")


#droping table from database
dplyr::db_drop_table(sc, "temp_electricity")
