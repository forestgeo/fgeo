#' Help to reexport alias from other packages.
#'
#' @param package Lengh-1 character vector giving the package name.
#' @param alias Lengh-1 character vector giving the alias name.
#'
#' @keywords internal
#' @noRd
export_outsider <- function(package, alias) {
  glue::glue("
    #' @importFrom {package} {alias}
    #' @export
    {package}::{alias}

    ")
}

export_insider <- function(package, alias) {
  link <- link_package_alias(package, alias)
  glue::glue("
    # Source: {link}
    #' @importFrom {package} {alias}
    #' @inherit {package}::{alias}
    #' @export
    {alias} <- {package}::{alias}

    ")
}

link_package_alias <- function(package, alias) {
  glue::glue("https://forestgeo.github.io/{package}/reference/{alias}")
}

select_docs <- function(package, ...) {
  columns <- rlang::enquos(...)
  fgeo_docs(package = package) %>%
    dplyr::filter(!keyword %in% "internal") %>%
    dplyr::select(!!! columns) %>%
    unique()
}

pull_aliass <- function(package, ...) {
  select_docs(package, alias) %>%
    dplyr::pull(alias)
}

# Example
library(purrr)
library(dplyr)
library(fgeo)

# these_packages <- c("fgeo.x", "fgeo.tool")
these_packages <- c("fgeo.x")
these_packages %>%
  map(., ~pull(select_docs(.x, alias))) %>%
  set_names(these_packages) %>%
  imap(~export_insider(.y, .x))
