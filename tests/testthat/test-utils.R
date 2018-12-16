context("strip_s3class")

test_that("outputs expected generics", {
  expect_equal(strip_s3class("print.data.frame"), "print")
  expect_equal(
    strip_s3class(
      c(
        "print.data.frame",
        "fgeo_topography.data.frame",
        "print"
      )
    ),
    c("print", "fgeo_topography", "print")
  )
})
