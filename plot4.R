
#read in data and subset to data we are using (dates are in d/m/y format)
power <- read.csv("household_power_consumption.txt", sep = ";")
power_subset <- subset(power, Date == "2/1/2007" | Date == "2/2/2007")

#create new time class variable in dataframe called Timestamp, convert Global_active_power from chr to numeric
power_subset$Timestamp <- strptime(paste(power_subset$Date, power_subset$Time), format = "%m/%d/%Y %H:%M:%S")
power_subset$Global_active_power <- as.numeric(power_subset$Global_active_power)

#set parameter to have 2 x 2 plots, will be filled by row
par(mfrow= c(2,2))

#topleft plot line plot with specified axis labels
with(power_subset, plot(Timestamp, Global_active_power, type = "l", xlab = '', ylab = "Global Active Power"))
#topright plot another line plot with specified axis labels
with(power_subset, plot(Timestamp, as.numeric(Voltage), type = "l", xlab = "datetime", ylab = "Voltage"))

#bottomleft plot submetering with multiple lines as in plot 3, but set box type (bty) of legend to be "n"
with(power_subset, plot(Timestamp, as.numeric(Sub_metering_1), type = "l", col = "black",xlab= "", ylab = "Energy sub metering"))
with(power_subset, lines(Timestamp, as.numeric(Sub_metering_2), col = "red"))
with(power_subset, lines(Timestamp, as.numeric(Sub_metering_3), col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

#bottomright plot line plot of global reactive power with axis labels as specified
with(power_subset, plot(Timestamp, as.numeric(Global_reactive_power), type ="l", xlab = "datetime", ylab = "Global_reactive_power"))

#copy plot to png and close device
dev.copy(png, "plot4.png")
dev.off()
