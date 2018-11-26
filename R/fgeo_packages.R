#' Create a table of __fgeo__'s package-names and titles.
#'
#' @section Acknowledgments:
#' [Jim Hester advised](https://goo.gl/Qzp5kR) and [Nathan Werth
#' advised](http://bit.ly/2H8bwaj) helped develop the implementation details of
#' this function.
#'
#' @keywords internal
#' @noRd
fgeo_packages <- function() {
  fgeo_index(.f = utils::packageDescription, nm = "Title", fields = "Title")
}

#' Create a table of some component of __fgeo__'s documentation.
#'
#' @param .f A function to map to each core-package of fgeo.
#' @param nm A name for the column storing the results of `.f`.
#' @param keep_reexported Logical; `TRUE` includes reexported functions.
#' @param ... Additional arguments passed to `.f`.
#'
#' @keywords internal
#' @noRd
fgeo_index <- function(.f, nm, ...) {
  fgeo_pkg <- c("fgeo", fgeo_core())
  fgeo_index <- fgeo_pkg %>%
    purrr::set_names() %>%
    purrr::map(.f = .f, ...) %>%
    purrr::map(data.frame, stringsAsFactors = FALSE) %>%
    # At least one column
    purrr::keep(~length(.x) > 0) %>%
    # At least one row
    purrr::keep(~nrow(.x) > 0) %>%
    purrr::map(purrr::set_names, nm) %>%
    fgeo.base::name_dfs() %>%
    purrr::map(~purrr::modify_if(.x, is.factor, as.character)) %>%
    purrr::reduce(dplyr::bind_rows)
  names(fgeo_index)[2] <- "package"
  fgeo_index <- fgeo_index[rev(names(fgeo_index))]
  nm_var <- fgeo_index[[nm]]
  dplyr::arrange(fgeo_index, .data$package, nm_var)
}

