# load libraries
library(shiny)

# Define a server for the Shiny app
shinyServer(function(input, output) {

  # Fill in the spot we created for a plot
  output$samplePlot <- renderPlot({

    # first find the mean for a set of random exponentials
    # repeat {n_simulations} times
    means <- data.frame(x=sapply(1:input$n_simulations,function(x) {mean(rexp(input$n_size,0.2))})) 
    
    # histogram
    hist(means$x, breaks=as.numeric(input$n_breaks), prob=T, main="Normal distribution of sample means", xlab="")

    # density
    lines(density(means$x))

  })
})