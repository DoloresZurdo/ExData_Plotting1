rm(list=ls())
setwd("~/Desktop/Courses_Online/Data_Science_Specialization/04_Exploratory Data Analysis/Homework/CourseProject")

allData <- read.table(file ="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?") 
sum( allData$Date ==  "2/2/2007" )
sum( allData$Date ==  "1/2/2007" )
myData <- allData$Date ==  "2/2/2007" | allData$Date ==  "1/2/2007"
sum(myData)
plotData <- allData[myData,]
plotData

# Plot 1
names(plotData)
class(allData[,3])
plotData[,3] <- as.numeric(plotData[,3])
png(filename="plot1.png")
hist(plotData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

