context("fgeo_dependencies")

test_that("is sensitive to `matches`", {
  expect_true(any(grepl("^cli$", fgeo_dependencies())))
  expect_false(any(grepl("^cli$", fgeo_dependencies(matches = "fgeo"))))
  expect_true(any(grepl("^fgeo$", fgeo_dependencies(matches = "fgeo"))))
  expect_true(any(grepl("^fgeo.x$", fgeo_dependencies(matches = "fgeo"))))
})

test_that("is sensitive to `include_fgeo`", {
  expect_false(
    any(grepl("^fgeo$", fgeo_dependencies("fgeo", include_self = FALSE)))
  )
  expect_true(
    any(grepl("^fgeo.x$", fgeo_dependencies("fgeo", include_self = FALSE)))
  )
})



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
