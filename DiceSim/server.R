library(shiny)

shinyServer(function(input, output) {
  r <- reactiveValues(results = sample(1:6,100,replace=T))
  observeEvent(input$click, {
    r$results <- sample(1:6, input$n_dice, replace=T)
  })
  
  output$rolls <- renderTable({
    
    data.frame(Number=1:6, Frequency=as.vector(table(r$results)))
    
  })
  
  output$hist <- renderPlot({
    barplot(table(r$results), xlab="Number", ylab="Frequency")
  })
  
  output$test <- renderPrint({
    cs <- chisq.test(table(r$results))
    print(cs)
  })
  
  output$explanation <- renderText({
    cs <- chisq.test(table(r$results))
    paste("The probability of getting a distribution that is at least as extreme as yours is ", round(cs$p.value*100, 5), "%.", sep="")
  })
  
})
