library(shiny)
library(tidyverse)

source(https://raw.githubusercontent.com/joegoodman94/CoronavirusTracker/master/days.csv?token=AOLGHCQYOWWAQYGESENQABS62UMFA)

daysSince10 <- read_csv("https://raw.githubusercontent.com/joegoodman94/CoronavirusTracker/master/days.csv?token=AOLGHCQYOWWAQYGESENQABS62UMFA")

ui <- fluidPage(
  titlePanel("Coronavirus Tracker"),
  sidebarLayout(
    sidebarPanel(selectInput('Country', 'Select Countries', multiple = T, unique(daysSince10$`Countries and territories`))),
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", plotOutput('trend')),
        tabPanel("Table", tableOutput('table'))
      )
    )
  )
)

server <- function(input, output, session) {
  #daysSince10 <- read_csv("days.csv")
  #token <- readRDS("droptoken.rds")
  #daysSince10 <- drop_read_csv('shinyapp/days.csv', dtoken = token)
  observe({
    moddays <- daysSince10[daysSince10$`Countries and territories` %in% input$Country,]
    output$trend <- renderPlot({
      # CODE BELOW: Update to display a line plot of the input name
      ggplot(moddays) +
        #subset(daysSince10, `Countries and territories` == input$Country)) +
        geom_line(aes(x = `Number of days since 10th death`, y = `Total Deaths`, color = `Countries and territories`)) +
        scale_y_log10()
    })
  })
}

shinyApp(ui = ui, server = server)

