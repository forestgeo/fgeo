#' All and core __fgeo__ packages.
#'
#' @family functions for developers
#'
#' @return A string.
#'
#' @keywords internal
#' @export
#' @examples
#' fgeo_pkgs()
#' fgeo_pkgs(FALSE)
#' fgeo_core()
fgeo_pkgs <- function(include_self = TRUE) {
  fgeo <- fgeo_dependencies(
    matches = "fgeo", include_self = TRUE, section = "Imports"
  )

  if (include_self) {
    return(fgeo)
  }

  grep("^fgeo$", fgeo, invert = TRUE, value = TRUE)
}

#' @rdname fgeo_pkgs
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

