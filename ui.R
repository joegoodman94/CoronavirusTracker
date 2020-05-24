ui <- fluidPage(
  titlePanel("Coronavirus Tracker"),
  sidebarLayout(
    #sidebarPanel(selectInput('Continent', 'Select Continent', unique(daysSince10$`continentExp`))),
    sidebarPanel(selectInput('Country', 'Select Countries', multiple = T, unique(daysSince10$`Countries and territories`))),
    # selectInput('Country1', 'Select Country', unique(daysSince10$`Countries and territories`))),
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", plotOutput('trend')),
        tabPanel("Table", tableOutput('table'))
      )
    )
  )
)
