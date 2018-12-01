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

#Plot# 1: Histogram constructed to show the frequency of Power Consumed 

hist(AnalysisData$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency",
     col = "red",
     main = "Global Active Power",
     xlim = )
axis(side = 1,at=seq(0,60,10))
box(lty = 'solid', col = "black")