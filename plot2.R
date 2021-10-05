#read in data and subset to data we are using (dates are in d/m/y format)
power <- read.csv("household_power_consumption.txt", sep = ";")
power_subset <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

#create new time class variable in dataframe called Timestamp, convert Global_active_power from chr to numeric
power_subset$Timestamp <- strptime(paste(power_subset$Date, power_subset$Time), format = "%d/%m/%Y %H:%M:%S")
power_subset$Global_active_power <- as.numeric(power_subset$Global_active_power)

#make line plot (type = "l") with axis labels as specified
with(power_subset, plot(Timestamp,Global_active_power, type = "l", xlab = "", ylab="Global Active Power (kilowatts)"))

#copy plot to png and close device
dev.copy(png, "plot2.png")
dev.off()
