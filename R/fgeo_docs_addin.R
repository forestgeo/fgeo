#' Search the documentation of __fgeo__.
#'
#' `fgeo_docs_addin()` opens an [RStudio
#'   gadget](https://shiny.rstudio.com/articles/gadgets.html) and
#'   [addin](http://rstudio.github.io/rstudioaddins/) that allows you to search
#'   __fgeo__'s documentation. Appears as "fgeo_docs" in the RStudio Addins menu.
#'
#' @export
fgeo_docs_addin <- function() {

  dep_ok <- vapply(
    c("rstudioapi", "shiny"),
    requireNamespace, logical(1), quietly = TRUE
  )
  if (any(!dep_ok)) {
    stop(
      "Install these packages in order to use the reprex addin:\n",
      paste(names(dep_ok[!dep_ok]), collapse = "\n"), call. = FALSE
    )
  }

  .selected <- c("alias", "concept", "title")
  docs <- dplyr::select(fgeo::fgeo_docs(), .selected, dplyr::everything())
  ui <- shiny::fluidPage(
    shiny::checkboxGroupInput(
      "show_vars",
      "Select:",
      names(docs),
      selected = c("name", "title", "concept"),
      inline = TRUE
    ),
    shiny::mainPanel(
      id = 'dataset', shiny::tabPanel("fgeo", DT::dataTableOutput("mytable1"))
    )
  )

  server <- function(input, output) {
    output$mytable1 <- DT::renderDataTable({
      DT::datatable(docs[, input$show_vars, drop = FALSE])
    })
  }

  shiny::shinyApp(ui, server)
}
