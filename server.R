library(shiny)
library(plyr)
library(ggplot2)



DataF <- read.csv("finalData.csv",header=TRUE)





shinyServer(
        function(input, output, session){
                
                passData <- reactive({
                        
                        if (input$typeDay=="All") { 
                        
                                stData_1 <- ddply(DataF, toString(input$typeDate), summarise, Mean_Comsuption=mean(Energy_Consumption) )
                                colnames(stData_1) <- c("typeDataParameter","Mean_Comsuption")
                                stData_1
                        
                        } else {
                                DataTmp <- DataF[DataF$Day_Num==input$typeDay,]
                                stData_1 <- ddply(DataTmp, toString(input$typeDate), summarise, Mean_Comsuption=mean(Energy_Consumption) )
                                colnames(stData_1) <- c("typeDataParameter","Mean_Comsuption")
                                stData_1
                        }
                })
                
                passData2 <- reactive({
                        DataTmp <- DataF[DataF$Day_Num==input$exDay,]
                        DataTmp
                        
                })
                
                
#                 outVar <- reactive({
#                         if (toString(input$AnalysisType)=="Des") {
# 
#                                 vars <- list("All"="All",
#                                              "Monday" = "1",
#                                              "Tuesday" = "2",
#                                              "Wednesday"="3",
#                                              "Thuerday"="4",
#                                              "Friday"="5",
#                                              "Saturday"="6",
#                                              "Sunday"="7")
#                                 vars <- as.list(vars)
#                                 return(vars)
#                         } else {
#                                 vars <- list("Monday" = "1",
#                                              "Tuesday" = "2",
#                                              "Wednesday"="3",
#                                              "Thuerday"="4",
#                                              "Friday"="5",
#                                              "Saturday"="6",
#                                              "Sunday"="7")
#                                 vars <- as.list(vars)
#                                 return(vars)    
#                         }
# }
                            
                        
                        
                
                
                observe({
                        
                        if(input$AnalysisType == "Des") {
                                updateTabsetPanel(session, inputId="analysisTab", selected = "panel1")
                        } else if (input$AnalysisType == "Explo") {
                                updateTabsetPanel(session, inputId="analysisTab", selected = "panel2")
                         } else {
                                updateTabsetPanel(session, inputId="analysisTab", selected = "panel0")
                        }
                        
                        
#                         updateSelectInput(session, "typeDay",
#                                           choices = outVar()
#                         )
                        
                        })
            
                
                output$mytext0 <- renderText({"     "})
                output$mytext <- renderText({"Energy Track APP is simple but fast program to analysis the energy consumption of any gadget where the data is collected. The present application is just an instant of one of the terminal which the data was collected in the month of August  2015. "})
                output$mytext1 <- renderText({"The main parameters of the Dataset is the Consumption of Energy and the Date & Time where it was capture."})
                output$mytext2 <- renderText({"The application aim to do two kind of analysis Descriptive and Exploratory. The former is basically the distribution of the energy consumption in the data plotting a histogram which can be filter by the Weekdays. The later type of analysis try to investigate which is the probability to consume a certain amount of energy o less given the day."})
                output$mytext3 <- renderText({"How to Use:"})
                output$mytext4 <- renderText({"1.- Choose the type of Analysis"})
                output$mytext5 <- renderText({"A. Document: Show the Intro & How to Use  "})
                output$mytext6 <- renderText({"B. Descriptive Analysis: Open the Exploratory Tab & Side Menu. "})
                output$mytext7 <- renderText({"C. Exploratory Analysis: Open the Exploratory Tab & Side Menu."})

                output$testPlot <- renderPlot({
                        hist(passData()$Mean_Comsuption)
                })
                
                output$testPlot2 <- renderPlot({
                        if (input$typeDay=="All") {
                                g <- ggplot(passData(), aes(x=typeDataParameter,y=Mean_Comsuption)) + geom_line()  + scale_x_continuous(breaks=seq(0,31,by=1))
                                g
                        } else {
                                g <- ggplot(passData(), aes(x=typeDataParameter,y=Mean_Comsuption)) + geom_line()  + scale_x_continuous(breaks=seq(0,31,by=1))
                                g
                        }
                })
                
                
              
                
                
                
                output$exNorm <- renderPlot({
                        Mu <- mean(passData2()$Energy_Consumption)
                        sdt <- sd(passData2()$Energy_Consumption)
                        x <- seq(0,2000, length=2000)
                        y <- dnorm(x,mean=Mu, sd=sdt)
                        plot(x,y)
                        muI <- input$exConsumption
                        lines(c(muI, muI), c(0, 2000),col="red",lwd=5)
                        
                 output$exProb <- renderText({
                         Mu <- mean(passData2()$Energy_Consumption)
                         sdt <- sd(passData2()$Energy_Consumption)
                         muI <- input$exConsumption
                         prob <- pnorm(muI, mean=Mu, sd=sdt)
                         text <- paste("The probability of consuming",round(muI,2),"or less are",prob,sep=" ")
                         text
                 })       
                        
                        
                })
                
          
              
        
})










