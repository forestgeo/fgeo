#' Build all fgeo packages.
#'
#' @param binary `TRUE` builds a binary package; `FALSE` builds a source
#'   package. Passed to [devtools::build()].
#'
#' @return
#' @export
#'
#' @examples
#' \dontrun{
#' fgeo_build()
#' fgeo_build(binary = TRUE)
#' }
fgeo_build <- function(binary = FALSE) {
  pkg <- fgeo_dependencies('fgeo')
  packages <- glue::glue("../{pkg}") %>% sub("^../fgeo$", ".", .)

  subdir <- ifelse(binary, "binary", "source")
  path <- glue::glue("../fgeo-build/{subdir}")

  purrr::walk2(
    packages, path,
    devtools::build,
    binary = binary
  )

  rename_output(pkg, path, subdir)
}

rename_output <- function(pkg, path, subdir) {
  old_nms <- fs::dir_ls(glue::glue("../fgeo-build/{subdir}"))
  new_nms <- old_nms %>%
    sub("fgeo.x",    "01-fgeo.x", .) %>%
    sub("fgeo.base", "02-fgeo.base", .) %>%
    sub("fgeo.tool", "03-fgeo.tool", .) %>%
    sub("fgeo$",     "zz-fgeo", .) %>%
    sort()

  fs::file_move(old_nms, new_nms)
}

