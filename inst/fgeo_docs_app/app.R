ui <- shiny::fluidPage(
  shiny::checkboxGroupInput(
    "show_vars",
    "Select:",
    names(fgeo::fgeo_docs()),
    selected = c("name", "title", "concept"),
    inline = TRUE
  ),
  shiny::mainPanel(
    id = 'dataset', shiny::tabPanel("fgeo", DT::dataTableOutput("mytable1"))
  )
)

server <- function(input, output) {
  output$mytable1 <- DT::renderDataTable({
    DT::datatable(fgeo::fgeo_docs()[, input$show_vars, drop = FALSE])
  })
}

shiny::shinyApp(ui, server)

