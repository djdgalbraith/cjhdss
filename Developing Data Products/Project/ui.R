library(shiny)

# Define UI for application
shinyUI(fluidPage(
  titlePanel("Body Mass Calculators"),
  
  sidebarLayout(
    sidebarPanel(
      helpText(
        "Provides a number of basic body mass calculators.  Input capture is tailored to the specified calculator and the results of executing the calculation with the supplied parameters displayed."
      ),
      verticalLayout(
        fluidRow(h4("Calculation")),
        selectInput(
          "calculation",
          NULL,
          choices = c(
            "Body Mass Index",
            "Body Mass Index Prime",
            "A Body Shape Index",
            "Surface-based Body Shape Index"
          ),
          selected = "Body Mass Index"
        ),
        fluidRow(h4("Parameters")),
        
        wellPanel(uiOutput("ui"))
      )
    ),
    
    mainPanel(h3(textOutput(
      "caption", container = span
    )),
    fluidRow(
      column(6, h2(textOutput("type"))),
      column(6, h2(textOutput("result")))),
    fluidRow()))
))