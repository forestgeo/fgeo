
# Interface ---------------------------------------------------------------

#' Export objects from packages.
#'
#' Use `export_native()` to reexport objects as if they were native.
#' Use `export_foreign()` to export objects as if they were foreign.
#'
#' @param packages Character vector giving name of packages.
#'
#' @return Output of `glue::glue()`.
#' @examples
#' packages <- c("fgeo.x", "fgeo.tool")
#' export_native(packages)
#' export_foreign(packages)
#' @noRd
NULL
export <- function(template){
  force(template)
  function(packages) {
    packages %>%
      purrr::map(., ~dplyr::pull(select_docs(.x, alias))) %>%
      purrr::set_names(packages) %>%
      purrr::imap(~export_package(.y, .x, template))
  }
}
export_native <- export("template-native.txt")
export_foreign <- export("template-foreign.txt")

export_package <- function(package, alias, template) {
  link <- link_package_topic(package, alias)
  # Hide roxygen2 comments in templates. They conflict with devtools::document()
  result <- readLines(fgeo_example(template))
  glue(glue_collapse(result, sep = "\n"))
}


# Implementation ----------------------------------------------------------

select_docs <- function(package, ...) {
  columns <- rlang::enquos(...)
  search_help(package = package) %>%
    dplyr::filter(!keyword %in% "internal") %>%
    dplyr::select(!!! columns) %>%
    unique()
}

link_package_topic <- function(package, alias) {
  pull_topic <- function(package, alias) {
    .alias <- rlang::enquo(alias)
    alias_topic <- select_docs(package, alias, topic)
    dplyr::filter(alias_topic, .data$alias %in% !!.alias)$topic
  }
  topic <- pull_topic(package, alias)
  glue::glue("https://forestgeo.github.io/{package}/reference/{topic}")
}

pull_aliass <- function(package, ...) {
  select_docs(.data$package, .data$alias) %>%
    dplyr::pull(.data$alias)
}

