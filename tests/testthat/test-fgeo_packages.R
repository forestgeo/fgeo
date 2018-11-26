context("table_core")

test_that("indexing functions output a dataframe", {
  expect_type(table_core(), "list")
  expect_is(table_core(), "data.frame")
})

