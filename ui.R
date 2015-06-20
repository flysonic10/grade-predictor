library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Predict your grade!"),
  sidebarPanel(
    h3('Scores'),
    numericInput('q1', 'Quiz 1 Score:', 0, min = 0, max = 100),
    numericInput('q2', 'Quiz 2 Score:', 0, min = 0, max = 100),
    numericInput('q3', 'Quiz 3 Score:', 0, min = 0, max = 100)    
  ),
  mainPanel(
    h3('Results'),
    p('Your predicted course project score is:'),
    verbatimTextOutput('predCp1'),
    
    p('Your predicted final grade is:'),
    verbatimTextOutput('courseGrade'),
    verbatimTextOutput('isPassing'),
    verbatimTextOutput('isDistinction')
  )
))
