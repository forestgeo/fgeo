context("fgeo_objects.R")

test_that("output a dataframe", {
  expect_type(fgeo_functions(), "list")
  expect_true(has_class(fgeo_functions(), "data.frame"))
  expect_type(fgeo_data(), "list")
  expect_true(has_class(fgeo_data(), "data.frame"))
})
