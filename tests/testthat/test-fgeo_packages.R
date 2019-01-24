context("fgeo_packages")

expect_sorted_equal <- function(object, expected, ...) {
  testthat::expect_equal(sort(object), sort(expected))
}

test_that("is sensitive to `include_self`", {
  install_these <- c(
    "fgeo.x",
    "fgeo.tool",
    "fgeo.analyze",
    "fgeo.plot",
    "fgeo"
  )
  expect_sorted_equal(fgeo_packages(), install_these)

  pkgs2 <- setdiff(install_these, "fgeo")
  expect_sorted_equal(fgeo_packages(FALSE), pkgs2)

  attach_these <- c(
    "fgeo.x",
    "fgeo.plot",
    "fgeo.analyze",
    "fgeo.tool"
  )
  expect_sorted_equal(fgeo_to_attach(), attach_these)
})



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

test_that("warns nonsenseical argument combination", {
  expect_message(
    fgeo_dependencies("fgeo", include_self = TRUE, section = "Suggests"),
    "Ignoring"
  )
})
