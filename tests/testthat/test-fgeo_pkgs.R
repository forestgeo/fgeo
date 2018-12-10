context("fgeo_pkgs")

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
  expect_sorted_equal(fgeo_pkgs(), pkgs)

  pkgs2 <- setdiff(pkgs, "fgeo")
  expect_sorted_equal(fgeo_pkgs(FALSE), pkgs2)

  core <- c(
    "fgeo.x",
    "fgeo.tool",
    "fgeo.analyze",
    "fgeo.map"
  )
  expect_sorted_equal(fgeo_core(), core)
})
