# load libraries
library(shiny)

# Define a server for the Shiny app
shinyServer(function(input, output) {

  # Fill in the spot we created for a plot
  output$samplePlot <- renderPlot({

    # first find the mean for a set of independent and identically distributed random variables
    # repeat {n_simulations} times
    means <- data.frame(x=sapply(1:input$n_simulations,function(x) {mean(rnorm(input$n_size))})) 
    
    # histogram
    hist(means$x, breaks=as.numeric(input$n_breaks), prob=T, main="Normal distribution of sample means", xlab="")

    # density
    lines(density(means$x))

  })
})