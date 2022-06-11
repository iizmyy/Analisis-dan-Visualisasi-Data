library(shiny)

# Definisikan UI untuk aplikasi input output
ui <- fluidPage(
  
  # Application title
  titlePanel("Uji Coba Input-Output"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      textInput("text_input",
                "Kata-kata anda:")
    ),
    
    # Main input output
    mainPanel(
      textOutput("text_output")
    )
  )
)


# Define server logic required to draw a histogram
server <- function(input,output){
  
  output$text_output <- renderText({
    # Display text input
    paste("yang anda ketikkan: ", input$text_input)
  })
}

# Run the application
shinyApp(ui = ui, server = server)
