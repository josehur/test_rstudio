context("conditions")

test_that("conditions inherit from `vctrs_error`", {
  expect_error(stop_incompatible(NULL, NULL), class = "vctrs_error")
  expect_error(stop_incompatible_type(NULL, NULL), class = "vctrs_error")
  expect_error(stop_incompatible_cast(NULL, NULL), class = "vctrs_error")
  expect_error(stop_incompatible_op("", NULL, NULL), class = "vctrs_error")
  expect_error(stop_incompatible_size(NULL, NULL, 0, 0), class = "vctrs_error")
  expect_error(maybe_lossy_cast(NULL, NULL, NULL, TRUE), class = "vctrs_error")
  expect_error(stop_unsupported("", ""), class = "vctrs_error")
  expect_error(stop_unimplemented("", ""), class = "vctrs_error")
  expect_error(stop_scalar_type(NULL), class = "vctrs_error")
  expect_error(stop_names("", NULL, 1), class = "vctrs_error")
  expect_error(stop_names_cannot_be_empty(1), class = "vctrs_error")
  expect_error(stop_names_cannot_be_dot_dot(1), class = "vctrs_error")
  expect_error(stop_names_must_be_unique(1), class = "vctrs_error")
})
