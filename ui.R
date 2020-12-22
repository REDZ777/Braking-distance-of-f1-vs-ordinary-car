#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(shiny)
library(shinyWidgets)

shinyUI(fluidPage(
    pageWithSidebar(
        headerPanel("Braking distance of Formula 1 car vs Ordinary car"),
        sidebarPanel(
            p("Variables for Formula 1 car"),
            sliderInput("Velocityf1", "F1 car velocity in km/h", value = 150, min = 1, max = 400, step = 10),
            sliderInput("Coeff1", "Friction of coefficient", value = 0.7, min = 0, max = 1.35, step = 0.1),
            sliderInput("reaction_timef1", "reaction_time", value = 0.5, min = 0, max = 3, step = 0.2),
            sliderInput("G", "aerodynamic downforce(G's)", value = 3, min = 1, max = 6, step = 0.5),
            p("Ordinary car"),
            p("These variables are for ordinary car's"),
            sliderInput("Velocity", "Ordinary car velocity in km/h", value = 150, min = 1, max = 350, step = 10),
            sliderInput("Coeff", "Friction of coefficient", value = 0.7, min = 0, max = 1.35, step = 0.1),
            sliderInput("reaction_time", "reaction_time", value = 1.2, min = 0, max = 3, step = 0.2),
            br(),
           
        ),
        mainPanel( 
            h5("The braking distance, also called the stopping distance, is the distance a vehicle covers from the time of the full application of its brakes until it has stopped moving. This is often given as a 100-0kph distance.This application helps in calculating the stopping distance of f1 and ordinary car."),
            h2("For F1 car's:"),
            h3("Your input:"),
            textOutput("inputVelocityf1"),
            textOutput("inputCoeff1"),
            textOutput("inputreaction_timef1"),
            textOutput("inputG"),
            h5("Typically aerodynamic downforce enables tremendous deceleration: 4.5 G's to 5.0 G's (44 to 49 m/s2), and up to 5.5 G's (54 m/s2) but for ordinary cars this is mostly in single G's."),
            h3("stopping distance in meters (m):"),
            textOutput("stopping_distancef1"),
            h2("ordinary car's:"),
            h3("Your input:"),
            textOutput("inputVelocity"),
            textOutput("inputCoeff"),
            textOutput("inputreaction_time"),
            h3("stopping distance in meters (m):"),
            textOutput("stopping_distance"),
            h4("")
            
          
            
        )
    )
)
)
