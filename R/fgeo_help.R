#' Search __fgeo__ for documentation matching a given character string.
#'
#' Use this function with a string to match the _name_ of a topic (generally the
#' name of a function or dataset), or text from the _title_ or _alias_ sections
#' of the topic's documentation.
#'
#' @param pattern A character string to be matched in the name, alias or title
#'   of a topic's documentation. Defaults to matching anything, which retrieves
#'   all the documentation of __fgeo__ packages.
#' @param package A character string giving the name or one or more
#'   core-packages of __fgeo__.
#'
#' @seealso [utils::help.search()], [fgeo::fgeo_core()].
#'
#' @return The results are returned in a list object of class "hsearch", which
#'   has a print method for nicely formatting the results of the query.
#'
#' @export
#'
#' @examples
#' if (interactive()) fgeo_help()
#' if (interactive()) fgeo_help("fgeo", package = "fgeo")
#'
#' results <- fgeo_help("fgeo", package = "fgeo.tool")
#' if (interactive()) results
#' str(results)
fgeo_help <- function(pattern = "", package = fgeo::fgeo_core()) {
  help.search(pattern = pattern, package = package)
}
