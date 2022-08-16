library(shiny)
library(ggplot2)

theme_set(theme_bw())

ui <- fluidPage(
  titlePanel("Gaussian distribution"),
  sidebarLayout(
  sidebarPanel(
  sliderInput(inputId = "number",
              label = "Number of points:",
              min = 100,
              max = 1000,
              value = 100),
  
  sliderInput(inputId = "alpha",
              label = "Transparency:", min =0, max=1, value=1)),

  mainPanel(
    plotOutput(outputId = "plot"))))

server <- function(input, output) {
  output$plot <- renderPlot({
  n <- input$number
  alpha <- input$alpha
  x <- rnorm(n)
  y <- rnorm(n)
  df<-data.frame(x,y)
  ggplot(df) + geom_point(aes(x,y),alpha = alpha, color = "orange", size=5)})
}
  
shinyApp(ui, server)