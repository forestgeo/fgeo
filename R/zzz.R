.onAttach <- function(...) {
  if (all_attached(fgeo_to_attach())) {
    return()
  }

  crayon::num_colors(TRUE)
  fgeo_attach()

  x <- fgeo_conflicts()
  msg(fgeo_conflict_message(x), startup = TRUE)
}

all_attached <- function(packages) {
  needed <- packages[!is_attached(packages)]
  length(needed) == 0
}

is_attached <- function(x) {
  paste0("package:", x) %in% search()
}
