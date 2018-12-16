# Adapted from utils::isS3method()
strip_s3class <- function(x) {
  unlist(lapply(x, strip_s3class_impl))
}

strip_s3class_impl <- function (x) {
  if (!utils::isS3method(x)) return(x)

  f.c <- strsplit(x, ".", fixed = TRUE)[[1]]
  nfc <- length(f.c)

  if (nfc == 2) {
    return(f.c[[1L]])
  }

  ok <- logical(nfc)
  for (j in 2:nfc) {
    ok[[j]] <- utils::isS3method(
      f = paste(f.c[1:(j - 1)], collapse = "."),
      class = paste(f.c[j:nfc], collapse = ".")
    )
  }

  .f <- character(nfc)
  for (j in 2:nfc) {
    .f[[j]] <- paste(f.c[1:(j - 1)], collapse = ".")
  }

  .f[[which(ok)]]
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

