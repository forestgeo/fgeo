context("search_help")

test_that("with no arguments returns all columns", {
  cols <- c(
    "package", "title", "topic", "type", "alias", "keyword", "concept"
  )
  expect_named(search_help(), cols)
  expect_is(search_help(), "tbl")
})

test_that("with one column name returns only that colum", {
  cols <- c("package")
  expect_named(search_help(NULL, package), cols)
})

test_that("excludes columns", {
  cols <- c("topic", "type", "alias", "keyword", "concept")
  expect_named(search_help(NULL, -package, -title), cols)
})

test_that("with a pattern returns that pattern", {
  expect_equal(search_help("tool", package)$package, "fgeo.tool")
})

test_that("errs with infomative error messages", {
  expect_error(search_help(NULL, invalid), "object.*not found")
  expect_error(search_help(invalid), "object.*not found")
})


test_that("outputs an entry for fgeo_elevation", {
  expect_true(
    any(
      grepl(
        "fgeo_elevation",
        fgeo:::pick_concept("habitat functions")$alias
      )
    )
  )
})



context("pick_package")

test_that("doesn't include package documentation", {
  expect_false(
    any(grepl("fgeo.x", unique(search_docs("fgeo.x")$alias)))
  )
  expect_false(
    any(grepl("fgeo.x-package", unique(search_docs("fgeo.x")$alias)))
  )
})

test_that("known concept retrieves known alias", {
  retrieved_docs <- pick_concept("functions to explore fgeo")$alias
  expect_true(any(grepl("fgeo_help", unique(retrieved_docs)))
  )
})
