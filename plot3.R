data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, dec=".")

data$Time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S") 
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Sub_metering_1= as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1]
data$Sub_metering_2= as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2]


indFirst = min(which(data$Date == "2007-02-01"))
indLast = max(which(data$Date == "2007-02-02"))


plot(data$Time[indFirst:indLast], data$Sub_metering_1[indFirst:indLast], 'l', 
     ylab = "Energy sub metering" , xlab =" ")
lines(data$Time[indFirst:indLast], data$Sub_metering_2[indFirst:indLast], col = 'red')
lines(data$Time[indFirst:indLast], data$Sub_metering_3[indFirst:indLast], col = 'royalblue')
legend("topright", col = c("black", "red", "royalblue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1) )

dev.copy(png,'plot3.png') 
dev.off()
