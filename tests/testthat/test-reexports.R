context("reexports")

test_that("all objects are reexported", {
  library(fgeo)
  library(fgeo.analyze)
  expect_equal(
    setdiff(ls("package:fgeo.analyze"), ls("package:fgeo")),
    character(0)
  )
  library(fgeo.map)
  expect_equal(
    setdiff(ls("package:fgeo.map"), ls("package:fgeo")),
    character(0)
  )
  library(fgeo.tool)
  expect_equal(
    setdiff(ls("package:fgeo.tool"), ls("package:fgeo")),
    character(0)
  )
})
