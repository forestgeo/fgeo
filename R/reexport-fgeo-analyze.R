# Source: https://github.com/forestgeo/fgeo.analyze/tree/master/R

#' Abundance: Please see `?fgeo.analyze::abundance`.
#' @name abundance
NULL
# FIXME: Something is wrong with the documentation of abundance. It makes
# pkgdown::build_site() fail with 'Error in asNamespace(ns) : not a namespace'.
# Hack: Use `@name abundance` above and `@noRd` below.
#' @noRd
#' @importFrom fgeo.analyze abundance
NULL
#' @export
fgeo.analyze::abundance

#' @importFrom fgeo.analyze basal_area
NULL
#' @export
fgeo.analyze::basal_area

#' @importFrom fgeo.analyze abundance_byyr
NULL
#' @export
fgeo.analyze::abundance_byyr

#' @importFrom fgeo.analyze basal_area_byyr
NULL
#' @export
fgeo.analyze::basal_area_byyr

#' @importFrom fgeo.analyze fgeo_habitat
NULL
#' @export
fgeo.analyze::fgeo_habitat

#' @importFrom fgeo.analyze fgeo_topography
NULL
#' @export
fgeo.analyze::fgeo_topography

#' @importFrom fgeo.analyze growth_ctfs
NULL
#' @export
fgeo.analyze::growth_ctfs

#' @importFrom fgeo.analyze mortality_ctfs
NULL
#' @export
fgeo.analyze::mortality_ctfs

#' @importFrom fgeo.analyze recruitment_ctfs
NULL
#' @export
fgeo.analyze::recruitment_ctfs

#' @importFrom fgeo.analyze to_df
NULL
#' @export
fgeo.analyze::to_df

#' @importFrom fgeo.analyze tt_test
NULL
#' @export
fgeo.analyze::tt_test
