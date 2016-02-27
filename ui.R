# load libraries
library(shiny)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("Random generation for the normal distribution"),
    h4("This example highlights the capabilities of Histograms and Density Plots, by repeatedly taking the mean of a set of random normals and plotting the results."),
   
    # Generate a row with a sidebar
    sidebarLayout(      
      # Define the sidebar with two inputs
      sidebarPanel(
        helpText("Choose the number of random normals per set, the number of simulations to run, and the histogram bin size."),
        hr(),
        selectInput("n_size", "Set size:", 
                    choices = c(10, 20, 30, 40),
                    selected = 20),
        sliderInput("n_simulations", 
                    "Number of observations:", 
                    value = 500,
                    min = 10, 
                    max = 1000),
        br(),
        selectInput("n_breaks", "Size of bins:", 
                    choices = c(20, 40, 60),
                    selected = 40)
      ),

      # Create a spot for the histogram 
      mainPanel(
        plotOutput("samplePlot", height = "600px")  
      )
      
    )
  )
)