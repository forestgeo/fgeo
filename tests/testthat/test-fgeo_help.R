context("fgeo_help")

test_that("outputs the expected class", {
  help_results <- fgeo_help("fgeo", package = "fgeo.tool")
  expect_is(help_results, "hsearch")
})

test_that("oututs the same result", {
  expect_equal(
    help.search("abundance", package = "fgeo.analyze"),
    fgeo_help("abundance", package = "fgeo.analyze")
  )
  expect_equal(
    fgeo_help("abundance", package = fgeo_packages()),
    fgeo_help("abundance")
  )
})
