#' Overview fgeo's functions.
#'
#' @section Acknowledgements:
#' Thanks to Jim Hester for advice on an implementation detail
#' (https://goo.gl/Qzp5kR).
#'
#' @return A dataframe.
#' @export
#'
#' @examples
#' head(fgeo_functions())
fgeo_functions <- function() {
  fgeo_objects("function")
}

fgeo_objects <- function(.mode) {
  fgeo_pkgs <- c("fgeo", fgeo_core())
  fgeo_pkgs %>%
    purrr::set_names() %>%
    purrr::map(getNamespaceExports) %>%
    purrr::discard(function(x) length(x) == 0) %>%
    purrr::map(data.frame, stringsAsFactors = FALSE) %>%
    purrr::map(purrr::set_names, "object") %>%
    fgeo.tool::ls_name_df() %>%
    purrr::reduce(dplyr::bind_rows) %>%
    dplyr::rename(package = name, object = object) %>%
    dplyr::arrange(package, object)
}



