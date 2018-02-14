#' List packages that fgeo imports and suggests.
#'
#' @param include_self Include fgeo in the list?
#' @param section Either "Imports" or "Suggests".
#'
#' @export
#' @examples
#' fgeo_packages(TRUE, "Imports")
#' # Same
#' fgeo_imports()
#'
#' fgeo_suggests()
fgeo_packages <- function(include_self = TRUE,
                          section = c("Imports", "Suggests")) {
  section <- section[[1]]
  raw <- utils::packageDescription("fgeo")[[section]]
  pulled <- strsplit(raw, ",")[[1]]
  parsed <- gsub("^\\s+|\\s+$", "", pulled)
  names <- vapply(strsplit(parsed, " +"), "[[", 1, FUN.VALUE = character(1))

  if (section == "Suggests") {
    if (include_self) {
      message(
        "Ignoring argument `ignore_self` (it makes no sense for 'Suggests')."
      )
    }
    return(names)
  }

  if (include_self) {
    names <- c(names, "fgeo")
  }

  names
}

#' @rdname fgeo_packages
#' @export
fgeo_imports <- function(include_self = TRUE) {
  fgeo_packages(include_self = TRUE, "Imports")
}

#' @rdname fgeo_packages
#' @export
fgeo_suggests <- function() {
  fgeo_packages(include_self = FALSE, "Suggests")
}



# Don't export. To use locally, with all fgeo packages under the same directory.

#' Find fgeo packages that depend on a given package.
#'
#' Useful to find which packages may have broken after refactoring on package
#' (the one you would want to pass to the argument `pkg`).
#'
#' @param pkg String giving the name of one package which dependencies you want
#'   to find.
#' @param root Sting. Assumes all fgeo package have the same parent directory.
#' @param fgeo_pkgs Character string giving the names of fgeo packages.
#'
#' @family functions for developers.
#'
#' @return A character vector.
#' @keywords internal
#'
#' @examples
#' # Won't because it depends on local directories.
#' \dontrun{
#' fgeo:::fgeo_package_deps("fgeo.tool")
#' }
#' @noRd
fgeo_package_deps <- function(pkg,
                              root = "../",
                              fgeo_pkgs = fgeo_core()) {
  fgeo_deps <- list_fgeo_deps(root, fgeo_pkgs)
  deps_matching_pkg <- purrr::keep(fgeo_deps, ~any(grepl(pkg, .)))
  names(deps_matching_pkg)
}

list_fgeo_deps <- function(root, fgeo_pkgs) {
  paths <- paste0(root, fgeo_pkgs)
  check_if_pkg_can_be_found(paths = paths, fgeo_pkgs = fgeo_pkgs)

  all_deps <- purrr::map(paths, remotes::local_package_deps, TRUE)
  all_deps <- purrr::set_names(all_deps, fgeo_pkgs)
  fgeo_deps <- purrr::map(all_deps, ~intersect(., fgeo_pkgs))
  fgeo_deps
}

check_if_pkg_can_be_found <- function(paths, fgeo_pkgs) {
  read_attempt <- purrr::map(paths, file.exists)
  read_attempt <- purrr::set_names(read_attempt, fgeo_pkgs)
  missing_pkg <- names(purrr::discard(read_attempt, isTRUE))
  if (any(read_attempt == FALSE)) {
    stop("Package(s) not found in fgeo: ", collapse(missing_pkg))
  }
}
