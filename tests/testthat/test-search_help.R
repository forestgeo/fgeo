context("search_help")

describe("search_help()", {
  it("with no arguments returns all columns", {
    cols <- c(
      "package", "title", "topic", "type", "alias", "keyword", "concept"
    )
    expect_named(search_help(), cols)
    expect_is(search_help(), "tbl")
  })

  it("with one column name returns only that colum", {
    cols <- c("package")
    expect_named(search_help(NULL, package), cols)
  })

  it("excludes columns", {
    cols <- c("topic", "type", "alias", "keyword", "concept")
    expect_named(search_help(NULL, -package, -title), cols)
  })

  it("with a pattern returns that pattern", {
    expect_equal(search_help("tool", package)$package, "fgeo.tool")
  })

  it("errs with infomative error messages", {
    expect_error(search_help(NULL, invalid), "object.*not found")
    expect_error(search_help(invalid), "object.*not found")
  })
})


