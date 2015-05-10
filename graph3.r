## Exploratory Data Analyis Project 1 
## source: graph3.r 
## result: graph3.png
## file is being kept in the .\data directory
setwd("C:\Users\x\devel\DataScience\ExploratoryDataAnalysis\ExData_Plotting1")

## Read in the data from the csv file, header values are true
powdf <- read.csv("data\\household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F, na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

## convert the start/end date first then compare
## in the next statement to get subset of data we are interested in.


sdttm <- strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
edttm <- strptime("03/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
powdfsubset <- powdf[strptime(paste(powdf$Date, powdf$Time),format="%d/%m/%Y %H:%M:%S", tz="UTC") >= sdttm & strptime(paste(powdf$Date, powdf$Time),format="%d/%m/%Y %H:%M:%S", tz="UTC") <= edttm,]
powdfsubset$dttm <- strptime(paste(powdfsubset$Date, powdfsubset$Time),format="%d/%m/%Y %H:%M:%S", tz="UTC")


## Initialize PNG device
png(filename="graph3.png", width=500, height=500)

## create plot
plot(powdfsubset$dttm,powdfsubset$Sub_metering_1, xlab="", ylab="Energy sub Mertering")
lines(powdfsubset$dttm,powdfsubset$Sub_metering_2, col="red")
lines(powdfsubset$dttm,powdfsubset$Sub_metering_3, col="blue")

## turn off the PNG device ...
dev.off
