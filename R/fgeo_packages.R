#' All and core __fgeo__ packages.
#'
#' @param include_self Logical. Should the output include fgeo?
#' @return A string.
#' @noRd
fgeo_packages <- function(include_self = TRUE) {
  fgeo <- fgeo_dependencies(
    matches = "fgeo", include_self = TRUE, section = "Imports"
  )

  if (include_self) {
    return(fgeo)
  }

  grep("^fgeo$", fgeo, invert = TRUE, value = TRUE)
}

fgeo_to_attach <- function() {
  c(
    "fgeo.x",
    "fgeo.plot",
    "fgeo.analyze",
    "fgeo.tool"
  )
}
