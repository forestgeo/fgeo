#' Get help with fgeo.
#'
#' [fgeo_help()] finds all __fgeo__ help files. You can refine
#' your search directly on the viewer panel of RStudio or via a string passed
#' as the first argument to [fgeo_help()].
#'
#' @param pattern A character string to be matched in the name, alias or title
#'   of a topic's documentation. Defaults to matching everything, which
#'   retrieves all the documentation of __fgeo__ packages.
#' @param package A character string giving the name of one or more
#'   packages to limit the search, or `NULL` to search all fgeo packages.
#' @inheritParams utils::help.search
#' @param ... Other arguments passed to [utils::help.search()].
#'
#' @seealso [utils::help.search()].
#'
#' @return The results are returned in a list object of class "hsearch", which
#'   has a print method for nicely formatting the results of the query.
#'
#' @examples
#' if (interactive()) {
#'   fgeo_help()
#' }
#' 
#' dplyr::as_tibble(fgeo_help()$matches)
#' 
#' if (interactive()) {
#'   fgeo_help("stem", package = "fgeo.x")
#' }
#' @family functions to explore fgeo
#' @export
fgeo_help <- function(pattern = "", package = NULL, rebuild = TRUE, ...) {
  utils::help.search(
    pattern = pattern,
    package = package %||% fgeo_packages(),
    rebuild = rebuild,
    ...
  )
}
