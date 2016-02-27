# load libraries
library(shiny)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("Random generation for the normal distribution"),
    h4("This example highlights the capibilities of Histograms and Density Plots"),
   
    # Generate a row with a sidebar
    sidebarLayout(      
      # Define the sidebar with two inputs
      sidebarPanel(
        helpText("Choose the number of random exponentials per set, and the number of simulations to run."),
        hr(),

        selectInput("n_breaks", "Breaks:", 
                    choices = c(20, 40, 60),
                    selected = 40),
        
        br(),
        
        sliderInput("n_simulations", 
                    "Number of observations:", 
                    value = 500,
                    min = 10, 
                    max = 1000)

        
      ),

      # Create a spot for the histogram 
      mainPanel(
        plotOutput("samplePlot", height = "600px")  
      )
      
    )
  )
)