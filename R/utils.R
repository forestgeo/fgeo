collapse <- function(...) {
  paste0(..., collapse = ", ")
}

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

fgeo_example <- function(path = NULL) {
  if (is.null(path)) {
    dir(system.file("extdata", package = "fgeo"))
  }
  else {
    system.file("extdata", path, package = "fgeo", mustWork = TRUE)
  }
}
