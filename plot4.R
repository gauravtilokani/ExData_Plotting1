#Load dplyr library
library(dplyr)

#Load and Subset Data
myData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = c("character", "character"))
myData <- mutate(myData, Date  = as.Date(strptime(myData$Date, format = "%d/%m/%Y")), Time = as.Date(strptime(myData$Time, format = "%H:%M:%S")))
myData <- subset(myData, Date == "2007-02-01" | Date == "2007-02-02")

#Plot the Graph
png(filename = "plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))

#Plot1
plot(as.numeric(myData$Global_active_power), type = "l", xaxt = 'n', xlab = "", ylab = "Global Active Power(kilowatts)")
axis(side = 1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

#Plot2
plot(myData$Sub_metering_1, type = "l", xaxt = 'n', xlab = "", ylab = "Energy Sub Metering")
lines(myData$Sub_metering_2, type = "l", col = "red")
lines(myData$Sub_metering_3, type = "l", col = "blue")
axis(side = 1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 2, lty = 1)

#Plot3
plot(myData$Voltage, type = "l", xaxt = 'n', xlab = "datetime", ylab = "Voltage")
axis(side = 1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

#Plot4
plot(myData$Global_reactive_power, type = "l", xaxt = 'n', xlab = "datetime", ylab = "Global_reactive_power")
axis(side = 1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

dev.off()