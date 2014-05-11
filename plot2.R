rm(list=ls())
setwd("~/Desktop/Courses_Online/Data_Science_Specialization/04_Exploratory Data Analysis/Homework/CourseProject")

allData <- read.table(file ="household_power_consumption.txt", header=TRUE, sep=";", na.strings="?") 
sum( allData$Date ==  "2/2/2007" )
sum( allData$Date ==  "1/2/2007" )
myData <- allData$Date ==  "2/2/2007" | allData$Date ==  "1/2/2007"
sum(myData)
plotData <- allData[myData,]
plotData

#Plot 2
GlobalActivePower <- plotData[,3]
dates <- plotData[,1]
times <- plotData[,2]
x <- paste(dates, times)
head(x)
t <- strptime(x, "%d/%m/%Y %H:%M:%S")
plot(t, GlobalActivePower, type="n", xlab="", bg="transparent", ylab ="Global Active Power (kilowatts)")
lines(t, GlobalActivePower )
dev.copy(png, "plot2.png")
dev.off()