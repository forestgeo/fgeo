#' Creates a functional link when used with DT table.
#'
#' Internal function. Exported to use in vignettes.
#'
#' @param pkg,fun String; the name of a package (`pkg`) and function (`fun`).
#'
#' @keywords internal
fgeo_link <- function(pkg, fun = NULL) {
  ending <- paste0(">", pkg)
  if (!is.null(fun)) {
    ending <- paste0("/reference/", ">", fun)
  }
  paste0("<a href=", fgeosite_pkg(pkg), ending, "</a>")
}

fgeosite_pkg <- function(pkg) {
  paste0("https://forestgeo.github.io/", pkg)
}
