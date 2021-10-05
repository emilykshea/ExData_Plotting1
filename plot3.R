#read in data and subset to data we are using (dates are in d/m/y format)
power <- read.csv("household_power_consumption.txt", sep = ";")
power_subset <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

#create new time class variable in the dataframe called Timestamp
power_subset$Timestamp <- strptime(paste(power_subset$Date, power_subset$Time), format = "%d/%m/%Y %H:%M:%S")

#plot first sub_metering line, set up axis labels
with(power_subset, plot(Timestamp, as.numeric(Sub_metering_1), type = "l", col = "black",xlab= "", ylab = "Energy sub metering"))
#add line 2 of sub metering 2
with(power_subset, lines(Timestamp, as.numeric(Sub_metering_2), col = "red"))
#add line 3 of sub metering 3
with(power_subset, lines(Timestamp, as.numeric(Sub_metering_3), col = "blue"))
#create legend in the top right
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#copy to png and close graphics device
dev.copy(png, "plot3.png")
dev.off()
