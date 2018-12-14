context("fgeo_packages")

expect_sorted_equal <- function(object, expected, ...) {
  testthat::expect_equal(sort(object), sort(expected))
}

test_that("is sensitive to `include_self`", {

  pkgs <- c(
      "fgeo.x",
      "fgeo.tool",
      "fgeo.analyze",
      "fgeo.map",
      "fgeo"
  )
  expect_sorted_equal(fgeo_packages(), pkgs)

  pkgs2 <- setdiff(pkgs, "fgeo")
  expect_sorted_equal(fgeo_packages(FALSE), pkgs2)

  core <- c(
    "fgeo.x",
    "fgeo.tool",
    "fgeo.analyze",
    "fgeo.map"
  )
  expect_sorted_equal(fgeo_core(), core)
})

context("table_core")

test_that("indexing functions output a dataframe", {
  expect_type(table_core(), "list")
  expect_is(table_core(), "data.frame")
})
