.selected <- c("alias", "concept", "title")
docs <- dplyr::select(fgeo::fgeo_docs(), .selected, dplyr::everything())

ui <- shiny::fluidPage(
  shiny::checkboxGroupInput(
    "show_vars",
    "Select:",
    names(docs),
    selected = .selected,
    inline = TRUE
  ),
  shiny::mainPanel(
    id = 'dataset', shiny::tabPanel("fgeo", DT::dataTableOutput("mytable1"))
  )
)

server <- function(input, output) {
  output$mytable1 <- DT::renderDataTable({
    DT::datatable(docs[ , input$show_vars, drop = FALSE])
  })
}

shiny::shinyApp(ui, server)

