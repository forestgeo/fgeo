#' Overview fgeo's data and functions.
#'
#' @return A dataframe.
#' @export
#'
#' @examples
#' head(fgeo_functions())
#'
#' head(fgeo_data())
#' @name fgeo_objects
NULL

#' @rdname fgeo_objects
#' @export
fgeo_functions <- function() {
  fgeo_objects("function")
}

#' @rdname fgeo_objects
#' @export
fgeo_data <- function() {
  data_types <- c("list", "numeric", "character", "logical")
  out <- purrr::map_df(data_types, purrr::possibly(fgeo_objects, NULL))
  dplyr::arrange(out, package, object)
}

funs_in_pkg <- function(pkg, .mode) {
  funs_str <- ls.str(paste0("package:", pkg), mode = .mode)
  unlist(strsplit(funs_str, ":"))
}

# TODO: Replace by getNamespaceExports()
fgeo_objects <- function(.mode) {
  library(fgeo)

  fgeo_pkgs <- c("fgeo", fgeo_core())
  fgeo_pkgs %>%
    purrr::set_names() %>%
    purrr::map(funs_in_pkg, .mode = .mode) %>%
    purrr::discard(function(x) length(x) == 0) %>%
    purrr::map(data.frame, stringsAsFactors = FALSE) %>%
    purrr::map(purrr::set_names, "object") %>%
    fgeo.tool::ls_name_df() %>%
    purrr::reduce(dplyr::bind_rows) %>%
    dplyr::rename(package = name, object = object) %>%
    dplyr::arrange(package, object)
}



