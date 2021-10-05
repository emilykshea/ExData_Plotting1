#read in data and subset to data we are using (dates are in d/m/y format)
power <- read.csv("household_power_consumption.txt", sep = ";")
power_subset <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

#create new time class variable in dataframe called Timestamp, convert Global_active_power from chr to numeric
power_subset$Timestamp <- strptime(paste(power_subset$Date, power_subset$Time), format = "%d/%m/%Y %H:%M:%S")
power_subset$Global_active_power <- as.numeric(power_subset$Global_active_power)

#make histogram
hist(power_subset$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

#copy plot to png and save
dev.copy(png, "plot1.png")
dev.off()


## earlier attempts at date/time conversion
#power_subset$Date <- as.Date(power_subset$Date, format = "%m/%d/%Y")
#power_subset$Time <- strptime(power_subset$Time, "%H:%M:%S")

##base plot
#hist(as.numeric(power_subset$Global_active_power))