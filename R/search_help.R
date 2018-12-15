#' Explore the documentation of __fgeo__.
#'
#' @param pattern Character string of length one to match an entry in packages
#'   documentation.
#' @param ... Bare names of the columns to select. Valid names are `package`,
#'   `name`, `title`, `topic`, `type`, `alias`, `keyword`, `concept`. If no name
#'   is given, then all names are returned.
#' @param package A character vector with the names of packages to search
#'   through, or NULL in which case all available packages in the library trees
#'   specified by lib.loc are searched. Defaults to search only the core
#'   packages of __fgeo__.
#'
#' @family functions for developers
#' @return A dataframe.
#' @examples
#' # Filter rows with a matching pattern.
#' search_help("abundance")
#'
#' # Select specific columns
#' search_help("abundance", concept, topic, title)
#'
#' # Exclude specific columns
#' search_help("abundance", -package)
#' @noRd
search_help <- function(pattern = NULL,
                        ...,
                        package = NULL,
                        include_internal = FALSE) {
  vars <- rlang::enquos(...)

  search_docs <- function(package) {
    docs <- utils::hsearch_db(package = package %||% fgeo_packages())
    docs <- suppressMessages(purrr::reduce(docs, dplyr::full_join))
    docs %>%
      tibble::as.tibble() %>%
      purrr::set_names(tolower) %>%
      dplyr::select(-.data$libpath, -.data$id, -.data$encoding, -.data$name) %>%
      dplyr::distinct()
  }
  docs <- search_docs(package)

  if (!include_internal) {
    docs <- dplyr::filter(docs, !.data$keyword %in% "internal")
  }

  user_selects_specific_vars <- any(purrr::map_lgl(vars, rlang::is_quosure))
  if (user_selects_specific_vars) {
    docs <- dplyr::select(docs, !!! vars)
  }

  if (!is.null(pattern)) {
    docs <- dplyr::filter_all(docs, dplyr::any_vars(grepl(pattern, .)))
  }

  unique(docs)
}

