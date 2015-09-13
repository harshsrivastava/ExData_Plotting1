##Load the file 
qdata <- read.table("household_power_consumption.txt",sep=";", header = TRUE)

##Convert to date data type to be able to filter
qdata$Date <- as.Date(qdata$Date, format = "%d/%m/%Y")
library(dplyr)

##filter the data to only view the two required days
reqddata <- filter(qdata,qdata$Date >= "2007-02-01" & qdata$Date <= "2007-02-02" )

##Merge date and time columns into one
reqddata$datetime <- paste(reqddata$Date, as.character.POSIXt(reqddata$Time))
reqddata$datetime <- as.POSIXct(reqddata$datetime)

##Convert factor variable to numerics 
reqddata$Sub_metering_1 <- as.numeric(as.character(reqddata$Sub_metering_1))
reqddata$Sub_metering_2 <- as.numeric(as.character(reqddata$Sub_metering_2))
reqddata$Sub_metering_3 <- as.numeric(as.character(reqddata$Sub_metering_3))
reqddata$Global_active_power <- as.numeric(as.character(reqddata$Global_active_power))
reqddata$Voltage <- as.numeric((as.character(reqddata$Voltage)))
reqddata$Global_reactive_power <- as.numeric(as.character(reqddata$Global_reactive_power))

##Initiate plot4.png file
png(file = "plot4.png")

##initiate 2x2 plot canvas
par(mfrow=c(2,2))

##Graph1- plot Global_active_power vs time 
plot(reqddata$datetime,reqddata$Global_active_power, ylab = "Global Active Power", xlab ="", pch =".")
lines(reqddata$datetime,reqddata$Global_active_power, ylab = "Global Active Power")

##Graph2 - plot voltage vs time 
plot(reqddata$datetime,reqddata$Voltage, ylab = "Voltage", xlab = "datetime", pch =".")
lines(reqddata$datetime, reqddata$Voltage,  ylab = "Voltage", xlab = "datetime")

#Graph3 - plot Sub_Metering vs time 
plot (reqddata$datetime, reqddata$Sub_metering_1, pch = ".", ylim = c(0,40), xlab ="", ylab = "Energy Sub Metering")
lines(reqddata$datetime, reqddata$Sub_metering_1, col = "black")
par(new=T)
plot (reqddata$datetime, reqddata$Sub_metering_2, pch = ".", col = "red", ylim = c(0,40), xlab ="", ylab = "")
lines(reqddata$datetime, reqddata$Sub_metering_2, col = "red")
par(new=T)
plot (reqddata$datetime, reqddata$Sub_metering_3, pch = ".", col = "blue", ylim = c(0,40), xlab = "", ylab = "")
lines(reqddata$datetime, reqddata$Sub_metering_3, col = "blue")
##Legend for graph3
legend("topright", bty = "n", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black","red","blue"))

#Graph4 - plot Global_reactive_power vs time 
plot(reqddata$datetime,reqddata$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", pch =".")
lines(reqddata$datetime, reqddata$Global_reactive_power,  ylab = "Global_reactive_power", xlab = "datetime")

##Close the device file
dev.off()

##End