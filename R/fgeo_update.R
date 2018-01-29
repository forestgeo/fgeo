#' Update fgeo.
#'
#' Shortcut for `remotes::install_github("forestgeo/fgeo")`.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' fgeo_update()
#' }
fgeo_update <- function() {
  remotes::install_github("forestgeo/fgeo")
}
