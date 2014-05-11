rm(list=ls())
setwd("~/Desktop/Courses_Online/Data_Science_Specialization/04_Exploratory Data Analysis/Homework/CourseProject")

#Read all data, and only create plots with 01/02/2007 and 02/02/2007
allData <- read.table(file ="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?") 
sum( allData$Date ==  "2/2/2007" )
sum( allData$Date ==  "1/2/2007" )
myData <- allData$Date ==  "2/2/2007" | allData$Date ==  "1/2/2007"
sum(myData)
plotData <- allData[myData,]
plotData

# Plot 4
names(plotData)
Voltage <- plotData[,5]
plot(t, Voltage, type="n", xlab="datetime", bg="transparent", ylab ="Voltage")
lines(t, Voltage, col = "black")

Global_reactive_power <- plotData[,4]
plot(t, Global_reactive_power, type="n", xlab="datetime", bg="transparent", ylab ="Global_reactive_power")
lines(t, Global_reactive_power, col = "black")

par (mfrow = c(2, 2), mar = c(4, 4, 2, 1) )

plot(t, GlobalActivePower, type="n", xlab="datetime", bg="transparent", ylab ="Global Active Power")
lines(t, GlobalActivePower, col = "black")
plot(t, Voltage, type="n", xlab="datetime", bg="transparent", ylab ="Voltage")
lines(t, Voltage, col = "black")
plot(t, Sub_metering_1, type="n", xlab="", bg="transparent", ylab ="Energy Sub metering")
lines(t, Sub_metering_1, col = "black")
lines(t, Sub_metering_2, col = "red")
lines(t, Sub_metering_3, col = "blue")
legend("topright", lwd = 1, cex=0.6, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(t, Global_reactive_power, type="n", xlab="datetime", bg="transparent", ylab ="Global_reactive_power")
lines(t, Global_reactive_power, col = "black")

dev.copy(png, "plot4.png")
dev.off()