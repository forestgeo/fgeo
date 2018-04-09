context("fgeo_index.R")

test_that("output a dataframe", {
  expect_type(fgeo_index_functions(), "list")
  expect_true(has_class(fgeo_index_functions(), "data.frame"))

  expect_type(fgeo_index_packages(), "list")
  expect_true(has_class(fgeo_index_packages(), "data.frame"))
})
