context("find_deps_locally")

root_from_testthat <- "../../../"
# root_from_testthat <- "../"  # run this line if running manually.

test_that("returns the expected string", {
  skip_on_travis()

  dependencies_found <- fgeo:::find_deps_locally(
    "fgeo.tool",
    root = root_from_testthat,
    fgeo_pkgs = fgeo_core()
  )
  matching <- grepl("fgeo.map", dependencies_found)

  expect_true(any(matching))
})

test_that("errs with wrong input", {
  skip_on_travis()

  expect_error(
    fgeo:::find_deps_locally(
      "fgeo.tool",
      root = root_from_testthat,
      fgeo_pkgs = "missing_pkg"
    )
  )
})
