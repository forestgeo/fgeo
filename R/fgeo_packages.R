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
    "fgeo.tool"
  )
}

#' Create a table of __fgeo__'s package-names and titles.
#'
#' @section Acknowledgments:
#' [Jim Hester advised](https://goo.gl/Qzp5kR) and [Nathan Werth
#' advised](http://bit.ly/2H8bwaj) helped develop the implementation details of
#' this function.
#' @noRd
table_core <- function() {
  fgeo_index(.f = utils::packageDescription, nm = "Title", fields = "Title")
}

fgeo_index <- function(.f, nm, ...) {
  fgeo_pkg <- c("fgeo", fgeo_to_attach())
  fgeo_index <- fgeo_pkg %>%
    purrr::set_names() %>%
    purrr::map(.f = .f, ...) %>%
    purrr::map(data.frame, stringsAsFactors = FALSE) %>%
    # At least one column
    purrr::keep(~length(.x) > 0) %>%
    # At least one row
    purrr::keep(~nrow(.x) > 0) %>%
    purrr::map(purrr::set_names, nm) %>%
    fgeo.tool::name_dfs() %>%
    purrr::map(~purrr::modify_if(.x, is.factor, as.character)) %>%
    purrr::reduce(dplyr::bind_rows)
  names(fgeo_index)[2] <- "package"
  fgeo_index <- fgeo_index[rev(names(fgeo_index))]
  nm_var <- fgeo_index[[nm]]
  dplyr::arrange(fgeo_index, .data$package, nm_var)
}
