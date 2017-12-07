# xxx checked all in this file
#' Conflicts between the fgeo and other packages
#'
#' This function lists all the conflicts between packages in fgeo
#' and other packages that you have loaded.
#'
#' @export
#' @examples
#' fgeo_conflicts()
fgeo_conflicts <- function() {
  envs <- purrr::set_names(search())
  objs <- invert(lapply(envs, ls_env))

  conflicts <- purrr::keep(objs, ~ length(.x) > 1)

  fgeo_names <- paste0("package:", fgeo_packages())
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

  pkgs <- x %>% purrr::map(~ gsub("^package:", "", .))
  others <- pkgs %>% purrr::map(`[`, -1)
  other_calls <- purrr::map2_chr(
    others, names(others),
    ~ paste0(crayon::blue(.x), "::", .y, "()", collapse = ", ")
  )

  winner <- pkgs %>% purrr::map_chr(1)
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

#' @importFrom magrittr %>%
confirm_conflict <- function(packages, name) {
  # Only look at functions
  objs <- packages %>%
    purrr::map(~ get(name, pos = .)) %>%
    purrr::keep(is.function)

  if (length(objs) <= 1)
    return()

  # Remove identical functions
  objs <- objs[!duplicated(objs)]
  packages <- packages[!duplicated(packages)]
  if (length(objs) == 1)
    return()

  packages
}

# xxx checked. Remove when done.
ls_env <- function(env) {
  x <- ls(pos = env)
#  # This is legacy code, likely irrelevant. Keeping it in case I need to
#  # understand something later.
#  # These potential conflicts apply to the tidyverse but to fgeo
#  if (identical(env, "package:dplyr")) {
#    x <- setdiff(x, c("intersect", "setdiff", "setequal", "union"))
#  }
  x
}
