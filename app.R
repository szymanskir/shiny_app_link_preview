library(ggplot2)
library(shiny)

ui <- fluidPage(
  tags$head(
    tags$meta(name = "twitter:card", content = "summary"),
    tags$meta(name = "twitter:image", content = "https://ryszard-szymaski.shinyapps.io/shiny_app_link_preview/link_preview.png"),
    tags$meta(name = "twitter:description", content = "This is an example shiny app with a link preview configured using the Open Graph protocol"),
    tags$meta(property = "og:title", content = "My Shiny App"),
    tags$meta(property = "og:image", content = "https://ryszard-szymaski.shinyapps.io/shiny_app_link_preview/link_preview.png"),
    tags$meta(property = "og:description", content = "This is an example shiny app with a link preview configured using the Open Graph protocol")
  ),
  titlePanel(title = "Shiny App with a Link Preview"),
  div(
    plotOutput("plot", width = "800px"),
    style = "display: flex; justify-content: center; align-items: center"
  )
)

server <- function(input, output, session) {
  
  output$plot <- renderPlot({
    ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
      geom_point()
  })
  
}

shinyApp(ui, server)