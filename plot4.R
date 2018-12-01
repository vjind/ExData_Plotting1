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

#This is to create a combine Date-Time object and converting it into a DateTime object using as.POSIXct

AnalysisData$DateTime <- paste(AnalysisData$Date, AnalysisData$Time)
AnalysisData$DateTime <- as.POSIXct(AnalysisData$DateTime, format="%Y-%m-%d %H:%M:%S")

#Plot# 4: This is the fourth plot constructed using mfrow function to have
#four plot constructed as a single plot

par(mfrow = c(2,2))
plot(AnalysisData$DateTime, AnalysisData$Global_active_power, 
     type = "l", xlab = "Datetime", ylab = "Global Active Power")
plot(AnalysisData$DateTime, AnalysisData$Voltage, 
     type = "l", xlab = "Datetime", ylab = "Voltage")
plot(AnalysisData$DateTime, AnalysisData$Sub_metering_1, 
     type = "l", col= "black",xlab = "Datetime", ylab = "Energy Sub Metering")
lines(AnalysisData$DateTime, AnalysisData$Sub_metering_2, 
      type = "l", col = "blue")
lines(AnalysisData$DateTime, AnalysisData$Sub_metering_3, 
      type = "l", col = "red")
legend("topright",lty = 1, lwd = 0.5, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","blue","red"), cex = 0.75, box.lwd = 1, bty = "n")
plot(AnalysisData$DateTime, AnalysisData$Global_reactive_power, 
     type = "l", xlab = "Datetime", ylab = "Global Reactive Power")