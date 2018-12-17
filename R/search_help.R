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
  if (want_specific_cols(enquos(...))) {
    result <- select_these_cols(result, enquos(...))
  }
  if (!is.null(pattern)) {
    result <- pick_this_pattern(result, pattern)
  }
  unique(result)
}

search_docs <- function(packages) {
  these_packages <- packages %||% fgeo_packages()
  # Surprisingly all packages that match are included
  docs <- utils::hsearch_db(package = these_packages)
  docs <- suppressMessages(purrr::reduce(docs, dplyr::full_join))
  docs %>%
    tibble::as.tibble() %>%
    purrr::set_names(tolower) %>%
    filter(.data$package %in% these_packages) %>%
    exclude_package_doc(packages) %>%
    select(-.data$libpath, -.data$id, -.data$encoding, -.data$name) %>%
    unique()
}

exclude_package_doc <- function(.data, package) {
  .data %>%
    filter(!.data$alias %in% c(package, glue("{package}-package")))
}

want_specific_cols <- function(elipsis) {
  any(purrr::map_lgl(elipsis, rlang::is_quosure))
}

exclude_internal_functions <- function(.data) {
  .data %>%
    filter(!.data$keyword %in% "internal")
}

select_these_cols <- function(.data, elipsis) {
  .data %>%
    select(!!! elipsis)
}

pick_this_pattern <- function(.data, pattern) {
  .data %>%
    dplyr::filter_all(dplyr::any_vars(grepl(pattern, .)))
}

pick_docs <- function(pick_these) {
  force(pick_these)
  function(.data, cols = NULL, url = "https://forestgeo.github.io/") {
    pick_these(.data) %>%
      collapse_alias() %>%
      link_topic(url) %>%
      select(cols %||% names(.)) %>%
      unique()
  }
}
pick_package <- pick_docs(search_help)
pick_concept <- pick_docs(
  function(family_string)
    search_help() %>%
    filter(.data$concept %in% family_string)
)

collapse_alias <- function(.data) {
  .data %>%
    group_by(.data$topic) %>%
    mutate(name = paste0(unique(.data$alias), collapse = ", ")) %>%
    ungroup()
}

link_topic <- function(.data, url) {
  .data %>%
    mutate(
      topic   = glue("<a href={url}{package}/reference/{topic}>?</a>"),
      package = glue("<a href={url}{package}>{package}</a>")
    ) %>%
    arrange(.data$package)
}
