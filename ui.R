#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
load("wine.RData")

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    headerPanel('Wine data k-means clustering'),
    headerPanel(h4('This application allows user to explore and visualize k-means clustering using wine data.')),
    sidebarPanel(
        helpText('Please select x and y axis values using which you wish to cluster the wines:'),
        selectInput('xcol', 'X Variable', names(wine[-1])),
        selectInput('ycol', 'Y Variable', names(wine[-1]),
                    selected=names(wine[-1])[[2]]),
        helpText('Please input the number of clusters for the algorithm:'),
        sliderInput('clusters', 'Cluster count', 3,
                     min = 1, max = 9)
    ),
    mainPanel(
        h3(textOutput('selected')),
        plotOutput('plot1')
    )
))
