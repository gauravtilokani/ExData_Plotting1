#Load dplyr library
library(dplyr)

#Load and Subset Data
myData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = c("character", "character"))
myData <- mutate(myData, Date  = as.Date(strptime(myData$Date, format = "%d/%m/%Y")), Time = as.Date(strptime(myData$Time, format = "%H:%M:%S")))
myData <- subset(myData, Date == "2007-02-01" | Date == "2007-02-02")

#Plot the Graph
png(filename = "plot2.png", width = 480, height = 480)
plot(as.numeric(myData$Global_active_power), type = "l", xaxt = 'n', xlab = "", ylab = "Global Active Power(kilowatts)")
axis(side = 1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
dev.off()