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
                        exclude_internal = TRUE) {
  result <- search_docs(package)
  if (exclude_internal) {
    result <- exclude_internal_functions(result)
  }
  if (using_dots(enquos(...))) {
    result <- select_these_cols(result, enquos(...))
  }
  if (!is.null(pattern)) {
    result <- filter_this_pattern(result, pattern)
  }
  unique(result)
}

search_docs <- function(package) {
    docs <- utils::hsearch_db(package = package %||% fgeo_packages())
    docs <- suppressMessages(purrr::reduce(docs, dplyr::full_join))


    docs %>%
      tibble::as.tibble() %>%
      purrr::set_names(tolower) %>%
      exclude_package_doc(package) %>%
      dplyr::select(-.data$libpath, -.data$id, -.data$encoding, -.data$name) %>%
      dplyr::distinct()
  }

exclude_package_doc <- function(.data, package) {
  package_doc <- c(package, glue::glue("{package}-package"))
  dplyr::filter(.data, !.data$alias %in% package_doc)
}

using_dots <- function(dots) {
  any(purrr::map_lgl(dots, rlang::is_quosure))
}

exclude_internal_functions <- function(x) {
  dplyr::filter(x, !.data$keyword %in% "internal")
}

select_these_cols <- function(x, dots) {
  dplyr::select(x, !!! dots)
}

filter_this_pattern <- function(result, pattern) {
  dplyr::filter_all(result, dplyr::any_vars(grepl(pattern, .)))
}

pick_docs <- function(.f) {
  force(.f)
  function(entry, cols = NULL, url = "https://forestgeo.github.io/") {
    .f(entry) %>%
      collapse_alias() %>%
      link_topic(url) %>%
      select(cols %||% names(.)) %>%
      unique()
  }
}
pick_package <- pick_docs(search_help)
pick_concept <- pick_docs(
  function(string)
    search_help() %>%
    filter(.data$concept %in% string)
)

collapse_alias <- function(x) {
  x %>%
    group_by(topic) %>%
    mutate(name = paste0(unique(alias), collapse = ", ")) %>%
    ungroup()
}

link_topic <- function(x, url) {
  x %>%
    mutate(
      topic = glue::glue_data(
        ., "<a href={url}{package}/reference/{topic}>{topic}</a>"
      ),
      package = glue::glue_data(
        ., "<a href={url}{package}>{package}</a>"
      )
    ) %>%
    dplyr::arrange(package)
}
