# load libraries
library(shiny)

# Define a server for the Shiny app
shinyServer(function(input, output) {

  # Fill in the spot we created for a plot
  output$samplePlot <- renderPlot({

    rdata <- rnorm(input$n_simulations)
    n_size <- 40
    n_simulations = 1:1000
    
    # first find the mean for a set of 40 random exponentials, 
    # repeat 1000 times
    means <- data.frame(x=sapply(n_simulations,function(x) {mean(rexp(n_size,0.2))})) 
    
        
    # histogram
    hist(means$x, breaks=as.numeric(input$n_breaks), prob=T, main="Normal distribution of sample means", xlab="")

    # density
    #lines(density(rdata))

  })
})