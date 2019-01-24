#' Conflicts between the __fgeo__ and other packages.
#'
#' This function lists all the conflicts between packages in fgeo
#' and other packages that you have loaded.
#' @noRd
fgeo_conflicts <- function() {
  envs <- purrr::set_names(search())

  objs <- invert(lapply(envs, function(env) ls(pos = env)))

  conflicts <- purrr::keep(objs, ~ length(.x) > 1)

  fgeo_imports <- fgeo_dependencies(section = "Imports", include_self = TRUE)
  fgeo_names <- paste0("package:", fgeo_imports)
  conflicts <- purrr::keep(conflicts, ~ any(.x %in% fgeo_names))

  conflict_funs <- purrr::imap(conflicts, confirm_conflict)
  conflict_funs <- purrr::compact(conflict_funs)

  structure(conflict_funs, class = "fgeo_conflicts")
}

fgeo_conflict_message <- function(x) {
  if (length(x) == 0) return("")

  header <- cli::rule(
    left = crayon::bold("Conflicts"),
    right = "fgeo_conflicts()"
  )

  pkgs <- purrr::map(x, ~ gsub("^package:", "", .))
  others <- purrr::map(pkgs, `[`, -1)
  other_calls <- purrr::map2_chr(
    others, names(others),
    ~ paste0(crayon::blue(.x), "::", .y, "()", collapse = ", ")
  )

  winner <- purrr::map_chr(pkgs, 1)
  funs <- format(paste0(crayon::blue(winner), "::", crayon::green(paste0(names(x), "()"))))
  bullets <- paste0(
    crayon::red(cli::symbol$cross), " ", funs,
    " masks ", other_calls,
    collapse = "\n"
  )

  paste0(header, "\n", bullets)
}

#' @export
print.fgeo_conflicts <- function(x, ..., startup = FALSE) {
  cli::cat_line(fgeo_conflict_message(x))
}

confirm_conflict <- function(packages, name) {
  # Only look at functions
  objs <- purrr::keep(
    purrr::map(packages, ~ get(name, pos = .)),
    is.function
  )

  if (length(objs) <= 1) {
    return()
  }

  # Remove identical functions
  objs <- objs[!duplicated(objs)]
  packages <- packages[!duplicated(packages)]
  if (length(objs) == 1) {
    return()
  }

  packages
}
