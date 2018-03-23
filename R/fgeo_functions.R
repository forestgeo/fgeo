#' Overview fgeo's functions.
#'
#' @section Acknowledgements:
#' Thanks to Jim Hester for [advice](https://goo.gl/Qzp5kR) on an implementation
#' detail.
#'
#' @return A dataframe.
#' @export
#'
#' @examples
#' head(fgeo_functions())
fgeo_functions <- function() {
  fgeo_pkgs <- c("fgeo", fgeo_core())
  fgeo_funs <- fgeo_pkgs %>%
    purrr::set_names() %>%
    purrr::map(getNamespaceExports) %>%
    purrr::discard(function(x) length(x) == 0) %>%
    purrr::map(data.frame, stringsAsFactors = FALSE) %>%
    purrr::map(purrr::set_names, "fun") %>%
    fgeo.tool::ls_name_df() %>%
    purrr::reduce(dplyr::bind_rows)

  names(fgeo_funs)[2] <- "package"
  fgeo_funs <- fgeo_funs[rev(names(fgeo_funs))]
  dplyr::arrange(fgeo_funs, .data$package, .data$fun)
}



