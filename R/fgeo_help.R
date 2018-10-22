#' Search __fgeo__ for documentation matching a given character string.
#'
#' * `fgeo_help()` finds all __fgeo__ help files. You can refine
#' your search directly on the viewer panel of RStudio or by passing a string
#' to `fgeo_help()` (e.g. `fgeo("datasets")`).
#' * `fgeo_help_adin()` runs `fgeo_help()` from the RStudio Addins menu or by
#' associating a keyboard shortcut to it (see Tools > Modify Keyboard
#' Shortcuts...), for example, Ctr/Cmd + Shift + Alt + F1.
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
  utils::help.search(pattern = pattern, package = package)
}

#' @export
#' @rdname fgeo_help
fgeo_help_addin <- function() {
  rstudioapi::sendToConsole("fgeo::fgeo_help(pattern = '')")
}
