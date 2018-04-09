#' Index fgeo's elements.
#'
#' `fgeo_index()` created a table of some component of fgeo for each core
#' package of fgeo. The other functions are convenient wrappers.
#'
#' @param .f A function to map to each core package of fgeo.
#' @param nm A name for the column storing the results of `.f`.
#' @param ... Additional arguments passed to `.f`.
#'
#' @section Acknowledgements:
#' Thanks to Jim Hester for [advice](https://goo.gl/Qzp5kR) on an implementation
#' detail.
#'
#' @return A dataframe.
#'
#' @export
#'
#' @examples
#' head(fgeo_index_functions())
#' head(fgeo_index_packages())
fgeo_index <- function(.f, nm, ...) {
  fgeo_pkg <- c("fgeo", fgeo_core())
  fgeo_index <- fgeo_pkg %>%
    purrr::set_names() %>%
    purrr::map(.f = .f, ...) %>%
    purrr::map(data.frame, stringsAsFactors = FALSE) %>%
    purrr::map(purrr::set_names, nm) %>%
    fgeo.tool::ls_name_df() %>%
    purrr::reduce(dplyr::bind_rows)
  names(fgeo_index)[2] <- "package"
  fgeo_index <- fgeo_index[rev(names(fgeo_index))]
  nm_var <- fgeo_index[[nm]]
  dplyr::arrange(fgeo_index, .data$package, nm_var)
}

#' @export
#' @rdname fgeo_index
fgeo_index_functions <- function() {
  fgeo_index(.f = getNamespaceExports, nm = "fun")
}
#' @export
#' @rdname fgeo_index
fgeo_index_packages <- function() {
  fgeo_index(.f = utils::packageDescription, nm = "Title", fields = "Title")
}



# Internal ----------------------------------------------------------------

# Make packages and functions clickable, so they point to webpages.
#
# fgeo::fgeo_index_packages() %>%
#   dplyr::mutate(package = fgeo::fgeo_link(package)) %>%
#   DT::datatable(escape = FALSE)
#
#' @export
#' @noRd
fgeo_link <- function(pkg, fun = NULL) {
  ending <- paste0(">", pkg)
  if (!is.null(fun)) {
    ending <- paste0("/reference/", ">", fun)
  }
  paste0("<a href=", fgeosite_pkg(pkg), ending, "</a>")
}

fgeosite_pkg <- function(pkg) {
  paste0("https://forestgeo.github.io/", pkg)
}
