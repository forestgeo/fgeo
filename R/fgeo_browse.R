fgeo_browse_url <- function(url) {
  force(url)
  function() {
    utils::browseURL(paste0("https://forestgeo.github.io/fgeo/", url))
    invisible()
  }
}

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
#' @export
fgeo_browse <- fgeo_browse_url("index.html")

#' @rdname fgeo_browse
#' @export
fgeo_browse_reference <- fgeo_browse_url("articles/siteonly/reference.html")
