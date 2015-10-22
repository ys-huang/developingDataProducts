data <- read.csv("data/knowledge.csv")
shinyUI(
    navbarPage('User Knowledge Modeling: Using K-means Clustering',
               tabPanel("Plot",
                        sidebarPanel(
                            selectInput('xcol', 'X Variable', names(data)[1:5]),
                            selectInput('ycol', 'Y Variable', names(data)[1:5],
                                        selected = names(data)[2]),
                            numericInput('clusters', 'Cluster count', 4, min = 1, max = 9),
                            h5("Hit 'documentation' button in the upper right corner for further infromation! ")
                            ),
                            
                        mainPanel(
                            h3("Attribute Information:"),
                            h5("STG: The degree of study time for goal object materails"),
                            h5("SCG: The degree of repetition number of user for goal object materails"),
                            h5("STR: The degree of study time of user for related objects with goal object"),
                            h5("LPR: The exam performance of user for related objects with goal object"),
                            h5("PEG: The exam performance of user for goal objects)"),
                            h1(" "),
                            plotOutput('plot1', width = "600px", height = "600px")
                        )
                        
                        
               ),
               
               tabPanel("Documentation",
                        mainPanel(
                            includeMarkdown("include.md")
                        )
               )
                        
        )
)

