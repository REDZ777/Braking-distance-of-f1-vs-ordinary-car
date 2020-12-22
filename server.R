#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

ord_stopping_distance <- function(Velocity, Coeff, reaction_time) ((Velocity*(1000/3600))^2 / (2*Coeff*9.81) + (Velocity*reaction_time))
f1_stopping_distance <-  function(Velocityf1, Coeff1, reaction_timef1, G) ((Velocityf1*(1000/3600))^2 / (2*Coeff1*9.8*G) + (Velocityf1*reaction_timef1))

shinyServer(
    function(input, output) {
        output$inputVelocity <- renderText({paste("Velocity:", input$Velocity)})
        output$inputCoeff <- renderText({paste("Coefficient of friction:", input$Coeff)})
        output$inputreaction_time <- renderText({paste("reaction_time:", input$reaction_time)})
        stopping_distance <- reactive({ord_stopping_distance(input$Velocity, input$Coeff,input$reaction_time)})
        output$stopping_distance <- renderText({stopping_distance()})
        
        output$inputVelocityf1 <- renderText({paste("Velocityf1:", input$Velocityf1)})
        output$inputCoeff1 <- renderText({paste("Coefficient of friction:", input$Coeff1)})
        output$inputreaction_timef1 <- renderText({paste("reaction_time:", input$reaction_timef1)})
        output$inputG <- renderText({paste("aerodynamic downforce:", input$G)})
        stopping_distancef1 <- reactive({f1_stopping_distance(input$Velocityf1, input$Coeff1,input$reaction_timef1, input$G)})
        output$stopping_distancef1 <- renderText({stopping_distancef1()})
        
    }
    
    
)