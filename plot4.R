
# Exploratory Data Analysis.
# Plotting Assignment 1 for Exploratory Data Analysis
#Plot 4

# by Pavel Medina Ruiz
# p.mr@hotmail.com | pav.medina@gmail.com


library(lubridate)
library(dplyr)

tabla <- read.csv(file = "household_power_consumption.txt", sep = ";")
tabla$Date <- dmy(as.character(tabla$Date))
tabla <-filter(.data = tabla, 
               Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

tabla$Global_active_power <- as.numeric(as.character(tabla$Global_active_power))
tabla$Sub_metering_1 <- as.numeric(as.character(tabla$Sub_metering_1))
tabla$Sub_metering_2 <- as.numeric(as.character(tabla$Sub_metering_2))
tabla$Sub_metering_3 <- as.numeric(as.character(tabla$Sub_metering_3))
tabla$Voltage <- as.numeric(as.character(tabla$Voltage))
tabla$Global_reactive_power <- as.numeric(as.character(tabla$Global_reactive_power))
tabla$Date <- as.POSIXct(paste(tabla$Date, tabla$Time, sep = " "))


png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
# plot1
plot(y = tabla$Global_active_power, 
     x = tabla$Date, type = "l",
     ylab = "Global Active Power", 
     xlab = "")

# plot2
plot(x = tabla$Date, 
     y = tabla$Voltage, 
     type = "l", 
     ylab = "Voltage", 
     xlab = "datetime")

# plot 3
plot(y = tabla$Sub_metering_1, 
     x = tabla$Date, type = "l",
     ylab = "Energy sub metering", 
     xlab = "black")

lines(y = tabla$Sub_metering_2, 
      x = tabla$Date,
      type = "l",
      col = "red")

lines(y = tabla$Sub_metering_3, 
      x = tabla$Date,
      type = "l",
      col = "blue")
legend("topright",
       legend = c("Sub_metering_1", 
                  "Sub_metering_2",
                  "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = 1, xjust = 1, bty = "n")

# plot4
plot(x = tabla$Date, 
     y = tabla$Global_reactive_power, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()



