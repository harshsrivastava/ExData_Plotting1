
qdata <- read.table("household_power_consumption.txt",sep=";", header = TRUE)
qdata$Date <- as.Date(qdata$Date, format = "%d/%m/%Y")
library(dplyr)
reqddata <- filter(qdata,qdata$Date >= "2007-02-01" & qdata$Date <= "2007-02-02" )
reqddata$datetime <- paste(reqddata$Date, as.character.POSIXt(reqddata$Time))
reqddata$datetime <- as.POSIXct(reqddata$datetime)
reqddata$Sub_metering_1 <- as.numeric(as.character(reqddata$Sub_metering_1))
reqddata$Sub_metering_2 <- as.numeric(as.character(reqddata$Sub_metering_2))
reqddata$Sub_metering_3 <- as.numeric(as.character(reqddata$Sub_metering_3))
reqddata$Global_active_power <- as.numeric(as.character(reqddata$Global_active_power))
reqddata$Voltage <- as.numeric((as.character(reqddata$Voltage)))

plot (reqddata$datetime, reqddata$Sub_metering_1, pch = ".", ylim = c(0,40), xlab ="", ylab = "Energy Sub Metering")
lines(reqddata$datetime, reqddata$Sub_metering_1, col = "black")

par(new=T)

plot (reqddata$datetime, reqddata$Sub_metering_2, pch = ".", col = "red", ylim = c(0,40), xlab ="", ylab = "")
lines(reqddata$datetime, reqddata$Sub_metering_2, col = "red")

par(new=T)

plot (reqddata$datetime, reqddata$Sub_metering_3, pch = ".", col = "blue", ylim = c(0,40), xlab = "", ylab = "")
lines(reqddata$datetime, reqddata$Sub_metering_3, col = "blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black","red","blue"))
reqddata$Global_reactive_power <- as.numeric(as.character(reqddata$Global_reactive_power))

png(file = "plot4.png")
par(mfrow=c(2,2))

##Graph1
plot(reqddata$datetime,reqddata$Global_active_power, ylab = "Global Active Power", xlab ="", pch =".")
lines(reqddata$datetime,reqddata$Global_active_power, ylab = "Global Active Power")

##Graph2
plot(reqddata$datetime,reqddata$Voltage, ylab = "Voltage", xlab = "datetime", pch =".")
lines(reqddata$datetime, reqddata$Voltage,  ylab = "Voltage", xlab = "datetime")

#Graph3
plot (reqddata$datetime, reqddata$Sub_metering_1, pch = ".", ylim = c(0,40), xlab ="", ylab = "Energy Sub Metering")
lines(reqddata$datetime, reqddata$Sub_metering_1, col = "black")
par(new=T)
plot (reqddata$datetime, reqddata$Sub_metering_2, pch = ".", col = "red", ylim = c(0,40), xlab ="", ylab = "")
lines(reqddata$datetime, reqddata$Sub_metering_2, col = "red")
par(new=T)
plot (reqddata$datetime, reqddata$Sub_metering_3, pch = ".", col = "blue", ylim = c(0,40), xlab = "", ylab = "")
lines(reqddata$datetime, reqddata$Sub_metering_3, col = "blue")
legend("topright", bty = "n", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black","red","blue"))



#Graph4
plot(reqddata$datetime,reqddata$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", pch =".")
lines(reqddata$datetime, reqddata$Global_reactive_power,  ylab = "Global_reactive_power", xlab = "datetime")


dev.off()