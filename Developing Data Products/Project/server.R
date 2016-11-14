library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  output$ui <- renderUI({
    if (is.null(input$calculation))
      return()
    
    switch(
      input$calculation,
      "Body Mass Index" = verticalLayout(
        sliderInput(
          "height",
          "Height",
          min = 1.20,
          max = 2.20,
          value = 1.75
        ),
        
        sliderInput(
          "weight",
          "Weight",
          min = 40,
          max = 220,
          value = 65
        )
      ),
      
      "Body Mass Index Prime" = verticalLayout(
        sliderInput(
          "height",
          "Height",
          min = 1.20,
          max = 2.20,
          value = 1.75
        ),
        
        sliderInput(
          "weight",
          "Weight",
          min = 40,
          max = 220,
          value = 65
        )
      ),
      
      "A Body Shape Index" = verticalLayout(
        sliderInput(
          "height",
          "Height",
          min = 1.20,
          max = 2.20,
          value = 1.75
        ),
        
        sliderInput(
          "weight",
          "Weight",
          min = 40,
          max = 220,
          value = 65
        ),
        
        sliderInput(
          "wc",
          "Waist Circumference",
          min = 0.6,
          max = 1.4,
          value = 0.8
        )
        
      ),
      
      "Surface-based Body Shape Index" = verticalLayout(
        sliderInput(
          "bsa",
          "Body Surface Area",
          min = 20,
          max = 250,
          value = 175
        ),
        
        sliderInput(
          "vtc",
          "Vertical Trunk Circumference",
          min = 20,
          max = 300,
          value = 75
        ),
        
        sliderInput(
          "height",
          "Height",
          min = 20,
          max = 300,
          value = 75
        ),
        
        sliderInput(
          "wc",
          "Waist Circumference",
          min = 0.5,
          max = 1.5,
          value = 0.80
        )
        
      )
    )
    
  })
  
  output$type <- renderText({
    input$calculation
  })
  
  output$result <- renderText(calcresult())
  
  calcresult <- reactive({
    switch(
      input$calculation,
      # BMI = weight / height ^ 2
      "Body Mass Index" = input$weight / (input$height ^ 2),
      
      # BMI' = weight / height ^ 2 / 25
      "Body Mass Index Prime" = ((input$weight / (input$height ^ 2)) / 25),
      
      # absi = waist circumference in meters / ( BMI(2/3) * height in meters(1/2) )
      "A Body Shape Index" = input$wc / ((input$weight / (input$height ^ 2)) ^ (2 / 3) * input$height ^ (1 / 2)),
      
      # sbsi = ((H^(7/4)) * ((WC)^(5/6)) / (BSA * VTC)
      "Surface-based Body Shape Index" = ((input$height) ^ (7 / 4) * (input$wc) ^ (5 / 6)) / (input$bsa * input$vtc)
    )
  })
})