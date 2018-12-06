context("fgeo_pkgs")

test_that("is sensitive to `include_self`", {

  pkgs <- c(
      "fgeo.x",
      "fgeo.ctfs",
      "fgeo.tool",
      "fgeo.map",
      "fgeo.abundance",
      "fgeo.habitat",
      "fgeo"
  )
  expect_equal(fgeo_pkgs(), pkgs)

  pkgs2 <- setdiff(pkgs, "fgeo")
  expect_equal(fgeo_pkgs(FALSE), pkgs2)

  core <- c(
    "fgeo.abundance",
    "fgeo.ctfs",
    "fgeo.habitat",
    "fgeo.map",
    "fgeo.tool",
    "fgeo.x"
  )
  expect_equal(fgeo_core(), core)
})
