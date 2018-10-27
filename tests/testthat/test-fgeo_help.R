context("fgeo_help")

test_that("outputs the expected class", {
  help_results <- fgeo_help("fgeo", package = "fgeo.tool")
  expect_is(help_results, "hsearch")
})
