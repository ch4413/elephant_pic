library(shiny)

ui <- fluidPage(
  titlePanel("Simple classification script with R/Shiny"),
  sidebarLayout(
    sidebarPanel(
      downloadButton('download.Excel', 'Download')

    ),
    mainPanel(p("Description of the results")
    )
  )
)
