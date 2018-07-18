context("find_deps_locally")

test_that("returns the expected string", {
  skip_on_travis()
  root_from_testthat <- "../../../"
  # root_from_testthat <- "../"  # run this line if running manually.
  matching <- grepl(
    "fgeo.map",
    fgeo:::find_deps_locally("fgeo.tool", root = root_from_testthat)
  )
  expect_true(any(matching))
})

test_that("errs with wrong input", {
  skip_on_travis()
  root_from_testthat <- "../../../"
  # root_from_testthat <- "../"  # run this line if running manually.
  expect_error(
    find_deps_locally("fgeo.data", root = root_from_testthat, "missing_pkg")
  )
})
