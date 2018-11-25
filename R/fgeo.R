#' @keywords internal
"_PACKAGE"

#' All and core __fgeo__-packages.
#'
#' @family functions for developers
#'
#' @return A string.
#'
#' @keywords internal
#' @export
#' @examples
#' fgeo()
#' fgeo_core()
fgeo <- function(matches = "fgeo", include_self = TRUE, section = "Imports") {
  fgeo_dependencies(matches, include_self, section)
}

#' @rdname fgeo
#' @export
fgeo_core <- function() {
  c(
    "fgeo.abundance",
    "fgeo.demography",
    "fgeo.habitat",
    "fgeo.map",
    "fgeo.tool",
    "fgeo.x"
  )
}

# Imports -----------------------------------------------------------------

#' @importFrom utils ls.str
#' @importFrom rlang .data
NULL

globalVariables(c("."))
