
# Exploratory Data Analysis.
# Plotting Assignment 1 for Exploratory Data Analysis
#Plot 2

# by Pavel Medina Ruiz
# p.mr@hotmail.com | pav.medina@gmail.com


library(lubridate)
library(dplyr)


tabla <- read.csv(file = "household_power_consumption.txt", sep = ";")
tabla$Date <- dmy(as.character(tabla$Date))
tabla <-filter(.data = tabla, 
               Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

tabla$Global_active_power <- as.numeric(as.character(tabla$Global_active_power))
tabla$Date <- as.POSIXct(paste(tabla$Date, tabla$Time, sep = " "))

png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(y = tabla$Global_active_power, 
     x = tabla$Date, type = "l",
     ylab = "Global Active Power (Kilowatts)", 
     xlab = "")

dev.off()
