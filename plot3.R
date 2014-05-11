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

Sub_metering_1 <- plotData[,7]
Sub_metering_2 <- plotData[,8]
Sub_metering_3 <- plotData[,9]

dates <- plotData[,1]
times <- plotData[,2]
x <- paste(dates, times)
head(x)
t <- strptime(x, "%d/%m/%Y %H:%M:%S")

#Plot 3
png(filename="plot3.png")
plot(t, Sub_metering_1, type="n", xlab="", bg="transparent", ylab ="Energy Sub metering")
lines(t, Sub_metering_1, col = "black")
lines(t, Sub_metering_2, col = "red")
lines(t, Sub_metering_3, col = "blue")
legend("topright", lwd = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
