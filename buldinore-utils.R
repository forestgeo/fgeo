#' Build all fgeo packages.
#'
#' @param binary `TRUE` builds a binary package; `FALSE` builds a source
#'   package. Passed to [devtools::build()].
#'
#' @return
#' @export
#'
#' @examples
fgeo_build <- function(binary = FALSE) {
  glue::glue("../{fgeo_dependencies('fgeo')}") %>%
    sub("^../fgeo$", ".", .) %>%
    purrr::walk(devtools::build, binary = binary)
}
