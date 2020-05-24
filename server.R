server <- function(input, output, session) {
  #daysSince10 <- read_csv("days.csv")
  daysSince10<-drop_read_csv('shinyapp/days.csv', dtoken = token)
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
