data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, dec=".")

data$Time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S") 
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#for some reason R considers this variable as a factor; convert it to numeric
data$Global_active_power = as.numeric(levels(data$Global_active_power))[data$Global_active_power]

indFirst = min(which(data$Date == "2007-02-01"))
indLast = max(which(data$Date == "2007-02-02"))

plot(data$Time[indFirst:indLast], data$Global_active_power[indFirst:indLast], 'l', 
     ylab = "Global Active Power (kilowatts)" , xlab =" ")

dev.copy(png,'plot2.png') 
dev.off()
