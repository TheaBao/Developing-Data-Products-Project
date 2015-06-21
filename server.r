library(shiny)
library(datasets)

Data <- airquality

shinyServer(function(input, output) {
  
  formulaText <- reactive({
    paste("Temp ~", input$variable)
  })
  
  formulaTextPoint <- reactive({
    paste("Temp ~", "as.integer(", input$variable, ")")
  })
  
  fit <- reactive({
    lm(as.formula(formulaTextPoint()), data=Data)
  })
  
  output$caption <- renderText({
    formulaText()
  })
  
  output$AirBoxPlot <- renderPlot({
    boxplot(as.formula(formulaText()), 
            data = Data,
            outline = input$outliers)
  })
  
  output$fit <- renderPrint({
    summary(fit())
  }) 
  
  output$AirPlot <- renderPlot({
    with(Data, {
      plot(as.formula(formulaTextPoint()))
      abline(fit(), col=2)
    })
  })
  
})