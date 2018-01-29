msg <- function(..., startup = FALSE) {
  if (startup) {
    if (!isTRUE(getOption("fgeo.quiet"))) {
      packageStartupMessage(text_col(...))
    }
  } else {
    message(text_col(...))
  }
}

text_col <- function(x) {
  # If RStudio not available, messages already printed in black
  if (!rstudioapi::isAvailable()) {
    return(x)
  }

  if (!rstudioapi::hasFun("getThemeInfo")) {
    return(x)
  }

  theme <- rstudioapi::getThemeInfo()

  if (isTRUE(theme$dark)) crayon::white(x) else crayon::black(x)

}

#' List packages that fgeo imports and suggests.
#'
#' @param include_self Include fgeo in the list?
#' @param section Either "Imports" or "Suggests".
#'
#' @export
#' @examples
#' fgeo_packages(TRUE, "Imports")
#' # Same
#' fgeo_imports()
#'
#' fgeo_suggests()
fgeo_packages <- function(include_self = TRUE,
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

  names
}

#' @rdname fgeo_packages
#' @export
fgeo_imports <- function(include_self = TRUE) {
  fgeo_packages(include_self = TRUE, "Imports")
}

#' @rdname fgeo_packages
#' @export
fgeo_suggests <- function() {
  fgeo_packages(include_self = FALSE, "Suggests")
}

invert <- function(x) {
  if (length(x) == 0) return()
  stacked <- utils::stack(x)
  tapply(as.character(stacked$ind), stacked$values, list)
}

style_grey <- function(level, ...) {
  crayon::style(
    paste0(...),
    crayon::make_style(grDevices::grey(level), grey = TRUE)
  )
}
