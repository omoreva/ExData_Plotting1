data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, dec=".")

#convert time and date
data$Time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S") 
data$Date <- as.Date(data$Date, "%d/%m/%Y")

data$Global_active_power = as.numeric(levels(data$Global_active_power))[data$Global_active_power]

# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
# Find the first and the last date and time
indFirst = min(which(data$Date == "2007-02-01"))
indLast = max(which(data$Date == "2007-02-02"))


hist(data$Global_active_power[indFirst:indLast], col = 'red', main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.copy(png,'plot1.png') 
dev.off()