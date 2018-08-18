#Load dplyr library
library(dplyr)

#Load and Subset Data
myData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = c("character", "character"))
myData <- mutate(myData, Date  = as.Date(strptime(myData$Date, format = "%d/%m/%Y")), Time = as.Date(strptime(myData$Time, format = "%H:%M:%S")))
myData <- subset(myData, Date == "2007-02-01" | Date == "2007-02-02")

#Plot the Graph
png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(myData$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()