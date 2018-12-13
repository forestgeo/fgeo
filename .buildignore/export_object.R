#' Help to reexport objects from other packages.
#'
#' @param package Lengh-1 character vector giving the package name.
#' @param object Lengh-1 character vector giving the object name.
#'
#' @keywords internal
#' @noRd
export_outsider <- function(package, object) {
  glue::glue("
    #' @importFrom {package} {object}
    #' @export
    {package}::{object}

    ")
}

export_insider <- function(package, object) {
  glue::glue("
    #' @importFrom {package} {object}
    #' @inherit {package}::{object}
    #' @export
    {object} <- {package}::{object}

    ")
}

pull_topics <- function(package) {
  fgeo_docs(package = package) %>%
    dplyr::filter(!keyword %in% "internal") %>%
    dplyr::pull(topic) %>%
    unique()
}

# Example
library(purrr)
these_packages <- c("fgeo.x", "fgeo.tool")
these_packages %>%
  map(pull_topics) %>%
  set_names(these_packages) %>%
  imap(~export_insider(.y, .x))
