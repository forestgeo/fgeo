#' Open a web browser on fgeo's website.
#'
#' Load fgeo's URLs into an HTML browser.
#'
#' @examples
#' if (interactive()) {
#'   fgeo_browse()
#'   fgeo_browse_reference()
#' }
#' @family functions to explore fgeo
#' @name fgeo_browse
NULL
fgeo_browse_url <- function(url) {
  force(url)
  function() {
    utils::browseURL(paste0("https://forestgeo.github.io/fgeo/", url))
    invisible()
  }
}

#' @rdname fgeo_browse
#' @export
fgeo_browse <- fgeo_browse_url("index.html")

#' @rdname fgeo_browse
#' @export
fgeo_browse_reference <- fgeo_browse_url("articles/siteonly/reference.html")

#' @family functions for developers
#' @noRd
fgeo_browse_reexports <- fgeo_browse_url("reference/reexports.html")
