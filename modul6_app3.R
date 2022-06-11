library(shiny)

ui <- fluidPage(
  titlePanel("Plot reaktif"),
  sidebarLayout(
    sidebarPanel(
      radioButtons(inputId = "number",
                   label = "Banyaknya n :",
                   choices = c(10,100,1000,10000),
                   inline=TRUE),
      selectInput(inputId = "colour",
                  label = "Pilih warna :",
                  choices = c("red","green","blue"))
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

server <- function(input,output){
  sim_data <- reactive({
    rnorm(input$number)
  })
  output$distPlot <- renderPlot({
    # simulasi dengan acuan input$number dari ui.R
    # dan input$colour dari ui.R
    x <- sim_data()
    hist(x, col=input$colour)
  })
}

#Run the application
shinyApp(ui = ui, server=server)
