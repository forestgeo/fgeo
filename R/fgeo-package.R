#' fgeo: Analyze ForestGEO data.
#'
#' fgeo: Analyze ForestGEO data.
#'
#' @examples
#' fgeo_link <- function(x) {
#'   x %>%
#'     dplyr::mutate(
#'       topic = glue::glue_data(
#'         .,
#'         "<a href=https://forestgeo.github.io/\\
#'         {package}/reference/{topic}>{topic}</a>"
#'       ),
#'       package = glue::glue_data(
#'         .,
#'         "<a href=https://forestgeo.github.io/\\
#'         {package}>{package}</a>"
#'       )
#'       ) %>%
#'     dplyr::arrange(package)
#' }
#'
#' fgeo_docs("", package, topic, alias, title, keyword) %>%
#'   dplyr::filter(!keyword %in% "internal") %>%
#'   dplyr::select(.data$alias, .data$topic, dplyr::everything()) %>%
#'   fgeo_link() %>%
#'   dplyr::select(-.data$package, -.data$keyword) %>%
#'   dplyr::rename(name = .data$alias, source = .data$topic)
"_PACKAGE"
