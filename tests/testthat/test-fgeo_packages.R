context("fgeo_packages.R")

test_that("indexing functions output a dataframe", {
  expect_type(fgeo_packages(), "list")
  expect_true(has_class(fgeo_packages(), "data.frame"))
})

