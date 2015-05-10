## Exploratory Data Analyis Project 1 
## source: graph1.r 
## result: graph1.png
## file is being kept in the .\data directory
setwd("C:\Users\x\devel\DataScience\ExploratoryDataAnalysis\ExData_Plotting1")

## Read in the data from the csv file, header values are true
powdf <- read.csv("data\\household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F, na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## convert the start/end date first then compare
## in the next statement to get subset of data we are interested in.

sdate <- as.Date("01/02/2007", format="%d/%m/%Y")
edate <- as.Date("02/02/2007", format="%d/%m/%Y")
powdfsubset <- powdf[as.Date(powdf$Date, format="%d/%m/%Y") >= sdate & as.Date(powdf$Date, format="%d/%m/%Y") <= edate,]



## Initialize PNG device
png(filename="graph1.png", width=500, height=500)

## create histogram
hist(powdfsubset$Global_active_power, main="Global Active Power", xlab="Global power in KWH", col="red")
## turn off the PNG device ... 
dev.off