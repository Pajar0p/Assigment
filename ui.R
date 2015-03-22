library(shiny)

shinyUI(bootstrapPage(
        headerPanel("Energy Track APP"),
        sidebarPanel(
                
                
                radioButtons(inputId = "AnalysisType",
                             label ="Choose Analysis Type",
                             choices = list("Documentation" = "Doc",
                                            "Descriptive" = "Des",
                                            "Exploratory" = "Explo"
                             )),
                
                conditionalPanel("input.AnalysisType== 'Des' ",
                                 
                                 h4('Descriptive Analysis'),
 
                                 radioButtons(inputId = "typeDate",
                                              label ="Choose Date Time Frame",
                                              choices = list("Hour" = "Hour",
                                                             "Day" = "Day_Num",
                                                             "Week" = "Week")),
                                 
                                 selectInput(inputId ="typeDay", label ='Choose Day', list("All"="All",
                                                                                        "Monday" = "1",
                                                                                        "Tuesday" = "2",
                                                                                        "Wednesday"="3",
                                                                                        "Thuerday"="4",
                                                                                        "Friday"="5",
                                                                                        "Saturday"="6",
                                                                                        "Sunday"="7"))
                                 
                                 
                                 
                                 ),
                
                conditionalPanel("input.AnalysisType== 'Explo' ",
                                h4('Exploratory Analysis'),
                                 
                                sliderInput(inputId = "exConsumption",
                                label="Choose Your Consumption",
                                min=0,
                                max=2000,
                                value=0,
                                step=50),
                                
                                
                                
#                                 sliderInput(inputId = "exHour",
#                                             label="Choose Your Time",
#                                             min=0,
#                                             max=23,
#                                             value=0,
#                                             step=1),
                                
                                selectInput(inputId ="exDay", label ='Choose Day', list("Monday" = "1",
                                                                                       "Tuesday" = "2",
                                                                                       "Wednesday"="3",
                                                                                       "Thuerday"="4",
                                                                                       "Friday"="5",
                                                                                       "Saturday"="6",
                                                                                       "Sunday"="7"))
                                
                )
                                 
               
                
                
        
                

                
                
        
                
                
                

        ),
                
           
        
            
        mainPanel(
                tabsetPanel( id="analysisTab",
                        tabPanel("Documentation", value="panel0",
                                 textOutput("mytest0"),
                                 textOutput('mytext'),
                                 textOutput('mytext1'),
                                 textOutput('mytext2'),
                                 textOutput('mytext3'),
                                 textOutput('mytext4'),
                                 textOutput('mytext5'),
                                 textOutput('mytext6'),
                                 textOutput('mytext7')
                                 
              
                                 ),
                        tabPanel("Descriptive Analysis", value="panel1",
                                 plotOutput('testPlot'),
                                 plotOutput('testPlot2')) ,             
                        tabPanel("Exploratory Analysis", value="panel2",
                                 plotOutput('exNorm'),
                                 textOutput('exProb'))
                
           
                
                )
        )
))
        