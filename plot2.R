#Setting Working Directory

setwd("C:\\Users\\vijay.ragunathan\\Downloads\\R-Practise\\ElectricPowerConsumption")

#Reading the File data that is separated by Semi-colon

ElectricPowerConsumption <- read.csv("household_power_consumption.txt", sep = ";")

#Formatting the Date column which was of type Factor and converting it into a Date field

ElectricPowerConsumption$Date <- as.Date(ElectricPowerConsumption$Date, "%d/%m/%Y")

#Subsetting the Dataset. 

AnalysisData <- ElectricPowerConsumption[ElectricPowerConsumption$Date == "2007-02-01" 
                                         | ElectricPowerConsumption$Date == "2007-02-02", ]

#Converting the Factor column into Decimal type (Retains the Decimal)

AnalysisData$Global_active_power <- as.numeric(as.character(AnalysisData$Global_active_power))

#Plot# 2: This is the second plot of the assignment to show the minute-by-minute power consumption
#for the select 2 days of Analysis 

#This is to create a combine Date-Time object and converting it into a DateTime object using as.POSIXct

AnalysisData$DateTime <- paste(AnalysisData$Date, AnalysisData$Time)
AnalysisData$DateTime <- as.POSIXct(AnalysisData$DateTime, format="%Y-%m-%d %H:%M:%S")

plot(AnalysisData$DateTime, AnalysisData$Global_active_power, 
     type = "l", 
     xlab = "Time Stamp",
     ylab = "Global Active Power (kilowatts)",
     main = "Global Active Power Against Time")
box(lty = 'solid', col = "black")
