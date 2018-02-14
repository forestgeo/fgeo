context("fgeo_package_deps.R")

test_that("returns the expected string", {
  skip_on_travis()
  root_from_testthat <- "../../../"
  # root_from_testthat <- "../"  # run this line if running manually.
  matching <- grepl(
    "fgeo.map",
    fgeo:::fgeo_package_deps("fgeo.tool", root = root_from_testthat)
  )
  expect_true(any(matching))
})

test_that("errs with wrong input", {
  skip_on_travis()
  root_from_testthat <- "../../../"
  # root_from_testthat <- "../"  # run this line if running manually.
  expect_error(
    fgeo_package_deps("bciex", root = root_from_testthat, "missing_pkg")
  )
})
