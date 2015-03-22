---
title       : Energy Track APP
subtitle    : DataApps  
author      : Christan
job         : Business
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Energy Track APP

Energy Track APP is simple but fast program to analysis the energy consumption of any gadget where the data is collected. The present application is just an instant of one of the terminal which the data was collected in the month of August 2015. 

--- .class #id 

## Simple & Easy App

* Reactive menu which help your to have a clean interface only with the command  applied to the desire Analysis

* Intereactive analysis where you choose your filter and which kind of analysis you want (Descriptive or Exploratory)

* App On the go, you can connect whereever you are. Just open this link https://pajar0p.shinyapps.io/shinyapps/ in your favorite OS, also complatible will cellphone and Tabs screen.



--- .class #id

## Dataset Reproducible N1

```r
DataF <- read.csv("Energy.csv", header=FALSE)[,1:2]
colnames(DataF) <- c("String_Date", "Energy_Consumption")
Fecha <- format(strptime(as.character(DataF$String_Date),"%m/%d/%Y"), "%d-%b-%Y")
DataF <- cbind(DataF,Fecha)
fxUSD <- read.csv("fxUSD.csv", header=TRUE)
fxCLP <- read.csv("fxCLP.csv", header=TRUE)
Rates <- read.csv("Rates.csv", header=TRUE)
FechaUSD <- format(strptime(as.character(fxUSD$X),"%Y-%m-%d"), "%d-%b-%Y")
fxUSD <- cbind(fxUSD, FechaUSD)
FechaCLP <- format(strptime(as.character(fxCLP$X),"%Y-%m-%d"), "%d-%b-%Y")
fxCLP <- cbind(fxCLP, FechaCLP)
FechaRates <- format(strptime(as.character(Rates$Date),"%Y-%m-%d"), "%d-%b-%Y")
Rates <- cbind(Rates, FechaRates)
DataF <-merge(DataF, fxUSD[,2:3], by.x="Fecha", by.y="FechaUSD",all.x=TRUE)
DataF <-merge(DataF, fxCLP[,2:3], by.x="Fecha", by.y="FechaCLP",all.x=TRUE)
DataF <-merge(DataF, Rates[,3:4], by.x="Fecha", by.y="FechaRates",all.x=TRUE)
DateF <- as.POSIXlt(DataF$String_Date, format="%m/%d/%Y %H:%M")
DataF <- cbind(DataF,DateF)
DataF <- cbind(DataF, Hour = DateX$hour)
```

```
## Error in cbind(DataF, Hour = DateX$hour): object 'DateX' not found
```

```r
DataF <- cbind(DataF, Day_Num=DateX$mday)
```

```
## Error in cbind(DataF, Day_Num = DateX$mday): object 'DateX' not found
```

```r
DataF <- cbind(DataF, Week = DateX$wday)
```

```
## Error in cbind(DataF, Week = DateX$wday): object 'DateX' not found
```



--- 

## Dataset Reproducible  N2 

```r
head(DataF)
```

```
##         Fecha   String_Date Energy_Consumption USD.AUD CLP.AUD      Rate
## 1 01-Aug-2014 8/1/2014 0:00                123  1.0744  0.0019 0.4806371
## 2 01-Aug-2014 8/1/2014 0:01                 80  1.0744  0.0019 0.4806371
## 3 01-Aug-2014 8/1/2014 0:02                155  1.0744  0.0019 0.4806371
## 4 01-Aug-2014 8/1/2014 0:03                173  1.0744  0.0019 0.4806371
## 5 01-Aug-2014 8/1/2014 0:04                123  1.0744  0.0019 0.4806371
## 6 01-Aug-2014 8/1/2014 0:05                160  1.0744  0.0019 0.4806371
##                 DateF
## 1 2014-08-01 00:00:00
## 2 2014-08-01 00:01:00
## 3 2014-08-01 00:02:00
## 4 2014-08-01 00:03:00
## 5 2014-08-01 00:04:00
## 6 2014-08-01 00:05:00
```
