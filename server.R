library(shiny)
library(markdown)
#setwd("D:/Sean Huang/My Program files/RSpace/developingDataProducts")
data <- read.csv("data/knowledge.csv")
palette(c( "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2",
          "#D55E00", "#CC79A7", "#000000"))


shinyServer(function(input, output, session) {

  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    data[, c(input$xcol, input$ycol)]
  })

  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })

  output$plot1 <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    points(clusters()$centers, pch = 13, cex = 3, lwd = 4, col = "#CC00CD")
  })

})
