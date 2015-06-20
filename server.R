library(shiny)

predCp1 <- function(q1, q2, q3){
  #Predict Course Project score as 10% higher
  #than the average of the quiz scores
  quizScores <- q1 + q2 + q3
  min(c(quizScores / 3 * 1.1, 100))
}

courseGrade <- function(q1, q2, q3){
  #Calculate final grade using specified weights
  quizScores <- q1 + q2 + q3
  cp1 <- predCp1(q1, q2, q3)
  quizScores/3 * 0.6 + cp1 * 0.4
}

isPassing <- function(courseGrade){
  if(courseGrade >= 70){
    "You will get a passing score"
  }else{
    "Oh no, you might not pass!"
  }
}

isDistinction <- function(courseGrade){
  if(courseGrade >= 90){
    "You may pass with Distinction!"
  }
}

shinyServer(
  function(input, output){
    grade <- renderPrint({courseGrade(input$q1,input$q2,input$q3)})
    output$courseGrade <- grade
    output$predCp1 <- renderPrint({predCp1(input$q1,input$q2,input$q3)})
    output$isPassing <- renderPrint({isPassing(courseGrade(input$q1,input$q2,input$q3))})
    output$isDistinction <- renderPrint({isDistinction(courseGrade(input$q1,input$q2,input$q3))})
  }
    
)