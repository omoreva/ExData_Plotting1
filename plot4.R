data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, dec=".")

data$Time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S") 
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Sub_metering_1= as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1]
data$Sub_metering_2= as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2]
data$Sub_metering_3= as.numeric(levels(data$Sub_metering_3))[data$Sub_metering_3]
data$Voltage = as.numeric(levels(data$Voltage))[data$Voltage]
data$Global_reactive_power = as.numeric(levels(data$Global_reactive_power))[data$Global_reactive_power]

par(mfrow=c(2,2), cex = 0.5)

plot(data$Time[indFirst:indLast], data$Global_active_power[indFirst:indLast], 'l', 
     ylab = "Global Active Power" , xlab =" ")


plot(data$Time[indFirst:indLast], data$Voltage[indFirst:indLast], 'l', 
     ylab = "Voltage" , xlab ="datetime")

plot(data$Time[indFirst:indLast], data$Sub_metering_1[indFirst:indLast], 'l', 
     ylab = "Energy sub metering" , xlab =" ")
lines(data$Time[indFirst:indLast], data$Sub_metering_2[indFirst:indLast], col = 'red')
lines(data$Time[indFirst:indLast], data$Sub_metering_3[indFirst:indLast], col = 'royalblue')
legend("topright", col = c("black", "red", "royalblue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), bty="n" )

plot(data$Time[indFirst:indLast], data$Global_reactive_power[indFirst:indLast], 'l', 
     ylab ="Global_reactive_power" , xlab ="datetime")
dev.copy(png,'plot4.png') 
dev.off()
