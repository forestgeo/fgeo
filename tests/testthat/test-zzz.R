context("all_attached")

test_that("returns TRUE if all packages are attached, else returns FALSE", {
  expect_true(all_attached(c("base", "utils")))
  expect_false(all_attached(c("base", "badpkg")))
})
