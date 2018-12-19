context("fgeo_packages")

expect_sorted_equal <- function(object, expected, ...) {
  testthat::expect_equal(sort(object), sort(expected))
}

test_that("is sensitive to `include_self`", {

  install_these <- c(
      "fgeo.x",
      "fgeo.tool",
      "fgeo.analyze",
      "fgeo.map",
      "fgeo"
  )
  expect_sorted_equal(fgeo_packages(), install_these)

  pkgs2 <- setdiff(install_these, "fgeo")
  expect_sorted_equal(fgeo_packages(FALSE), pkgs2)

  attach_these <- c(
    "fgeo.x",
    "fgeo.tool"
  )
  expect_sorted_equal(fgeo_to_attach(), attach_these)
})

context("table_core")

test_that("indexing functions output a dataframe", {
  expect_type(table_core(), "list")
  expect_is(table_core(), "data.frame")
})
