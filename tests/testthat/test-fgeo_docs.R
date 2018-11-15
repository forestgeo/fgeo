context("fgeo_docs")

describe("fgeo_docs()", {
  it("with no arguments returns all columns", {
    cols <- c(
      "package", "title", "topic", "type", "alias", "keyword", "concept"
    )
    expect_named(fgeo_docs(), cols)
    expect_is(fgeo_docs(), "tbl")
  })

  it("with one column name returns only that colum", {
    cols <- c("package")
    expect_named(fgeo_docs(NULL, package), cols)
  })

  it("excludes columns", {
    cols <- c("topic", "type", "alias", "keyword", "concept")
    expect_named(fgeo_docs(NULL, -package, -title), cols)
  })

  it("with a pattern returns that pattern", {
    expect_equal(fgeo_docs("abundance", package)$package, "fgeo.abundance")
  })

  it("errs with infomative error messages", {
    expect_error(fgeo_docs(NULL, invalid), "object.*not found")
    expect_error(fgeo_docs(invalid), "object.*not found")
  })
})


