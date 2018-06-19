#' Index fgeo's packages, datasets and functions.
#'
#' `fgeo_index_packages()` creates a table of all packages of the __fgeo__
#' meta-package. It is searchable by package name and by whatever keyword
#' appears in their titles, and links to th e website of each package.
#' `fgeo_index_datasets()` and `fgeo_index_functions()` create tables of all
#' datasets and functions of the __fgeo__ meta-package. It is searchable by
#' dataset and function name and includes links to the reference page of the
#' respective package-website (a link to the specific documentation of each
#' dataset and function would be better but this feature is not yet
#' available).
#'
#' @param .f A function to map to each core-package of fgeo.
#' @param nm A name for the column storing the results of `.f`.
#' @param keep_reexported Logical; `TRUE` includes reexported functions.
#' @param ... Additional arguments passed to `.f`.
#'
#' @section Acknowledgments:
#' [Jim Hester advised](https://goo.gl/Qzp5kR) on implementation details of
#' `fgeo_index_functions()`; and [Nathan Werth advised](http://bit.ly/2H8bwaj)
#' on implementation details of `fgeo_index_datasets()`.
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
    # At least one column
    purrr::keep(~length(.x) > 0) %>%
    # At least one row
    purrr::keep(~nrow(.x) > 0) %>%
    purrr::map(purrr::set_names, nm) %>%
    fgeo.base::name_df_lst() %>%
    purrr::map(~purrr::modify_if(.x, is.factor, as.character)) %>%
    purrr::reduce(dplyr::bind_rows)
  names(fgeo_index)[2] <- "package"
  fgeo_index <- fgeo_index[rev(names(fgeo_index))]
  nm_var <- fgeo_index[[nm]]
  dplyr::arrange(fgeo_index, .data$package, nm_var)
}

#' @rdname fgeo_index
#' @export
fgeo_index_functions <- function(keep_reexported = FALSE) {
  exported <- fgeo_index(.f = getNamespaceExports, nm = "fun")
  if (keep_reexported) {
    return(exported)
  }

  not_reexported <- !exported$fun %in% external_funs()
  exported[not_reexported, ]
}

external_funs <- function() {
  external_pkg <- setdiff(fgeo::fgeo_imports(), c(fgeo::fgeo_core(), "fgeo"))
  unlist(purrr::map(external_pkg, getNamespaceExports))
}

#' @rdname fgeo_index
#' @export
fgeo_index_packages <- function() {
  fgeo_index(.f = utils::packageDescription, nm = "Title", fields = "Title")
}

#' @rdname fgeo_index
#' @export
fgeo_index_datasets <- function() {
  fgeo_index(.f = fgeo.base::find_datasets, nm = "dataset")
}
