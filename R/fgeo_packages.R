#' Names of the core fgeo packages.
#'
#' @param include_self Logical. Should the output include fgeo?
#' @return A string.
#' @export
#' @family functions to explore fgeo
#' @examples
#' fgeo_packages()
#' fgeo_packages(include_self = FALSE)
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
  fgeo_packages(include_self = FALSE)
}



#' List package dependencies (imports and suggests) of __fgeo__.
#'
#' @param matches String to `grep()` the output.
#' @param include_self Include fgeo in the list?
#' @param section Either "Imports" or "Suggests".
#' @return A string.
#'
#' @family functions for developers
#' @noRd
fgeo_dependencies <- function(matches = NULL,
                              include_self = TRUE,
                              section = c("Imports", "Suggests")) {
  section <- section[[1]]
  raw <- utils::packageDescription("fgeo")[[section]]
  pulled <- strsplit(raw, ",")[[1]]
  parsed <- gsub("^\\s+|\\s+$", "", pulled)
  names <- vapply(strsplit(parsed, " +"), "[[", 1, FUN.VALUE = character(1))

  if (section == "Suggests") {
    if (include_self) {
      message(
        "Ignoring argument `ignore_self` (it makes no sense for 'Suggests')."
      )
    }
    return(names)
  }

  if (include_self) {
    names <- c(names, "fgeo")
  }

  if (!is.null(matches)) {
    names <- grep(matches, names, value = TRUE)
  }

  names
}
