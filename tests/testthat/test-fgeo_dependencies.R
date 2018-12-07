context("fgeo_dependencies")

test_that("is sensitive to `matches`", {
  expect_true(any(grepl("^cli$", fgeo_dependencies())))
  expect_false(any(grepl("^cli$", fgeo_dependencies(matches = "fgeo"))))
  expect_true(any(grepl("^fgeo$", fgeo_dependencies(matches = "fgeo"))))
})

test_that("is sensitive to `include_fgeo`", {
  expect_false(
    any(grepl("^fgeo$", fgeo_dependencies("fgeo", include_self = FALSE)))
  )
})

