library(shiny)

shinyUI(fluidPage(
  titlePanel("DiceSim"),
  
  p("This is DiceSim - the silly game where you try to beat statistics."),
  p("Choose a number of dice and then roll. You will see a histogram of the output, and
     we expect to get the same frequency for each number. So, for example, rolling 100 6's is higly unlikely!"),
  p("With a chi-squared test you will get to know exactly how (in)probable your result was."),
  p("Good luck!"),
  
  fluidRow(
    column(3,
           sliderInput("n_dice", "Number of dice:", min = 100, max = 1000, value = 100),
           actionButton("click", "Roll the dice")
    ),
    column(4,
           tableOutput("rolls"),
           verbatimTextOutput("test"),
           textOutput("explanation")
    ),
    column(5,
           plotOutput("hist")
    )
  )
))
