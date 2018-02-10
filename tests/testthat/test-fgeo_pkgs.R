context("fgeo_package_deps.R")

test_that("returns the expected string", {
  skip_on_travis()
  root_from_testthat <- "../../../"
  expect_true(
    any(
      grepl("fgeo", fgeo_package_deps("fgeo.map", root = root_from_testthat))
    )
  )
})

test_that("errs with wrong input", {
  skip_on_travis()
  root_from_testthat <- "../../../"
  # root_from_testthat <- "../"
  expect_error(
    fgeo_package_deps("bciex", root = root_from_testthat, "missing_pkg")
  )
})
