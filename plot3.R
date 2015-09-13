##Load the file 
qdata <- read.table("household_power_consumption.txt",sep=";", header = TRUE)

##Convert to date data type to be able to filter
qdata$Date <- as.Date(qdata$Date, format = "%d/%m/%Y")
library(dplyr)

##filter the data to only view the two required days
reqddata <- filter(qdata,qdata$Date >= "2007-02-01" & qdata$Date <= "2007-02-02" )

##Merge date and time columns to one column
reqddata$datetime <- paste(reqddata$Date, as.character.POSIXt(reqddata$Time))
reqddata$datetime <- as.POSIXct(reqddata$datetime)

##Convert factor variable to numeric variable
reqddata$Sub_metering_1 <- as.numeric(as.character(reqddata$Sub_metering_1))
reqddata$Sub_metering_2 <- as.numeric(as.character(reqddata$Sub_metering_2))
reqddata$Sub_metering_3 <- as.numeric(as.character(reqddata$Sub_metering_3))

##initiate plot3.png file
png(file = "plot3.png")

##Plot for Sub_metering_1
plot (reqddata$datetime, reqddata$Sub_metering_1, pch = ".", ylim = c(0,40), xlab ="", ylab = "Energy Sub Metering")
lines(reqddata$datetime, reqddata$Sub_metering_1, col = "black")

##Command to continue plotting the next commands on the same plot 
par(new=T)

##Plot for Sub_metering_2
plot (reqddata$datetime, reqddata$Sub_metering_2, pch = ".", col = "red", ylim = c(0,40), xlab ="", ylab = "")
lines(reqddata$datetime, reqddata$Sub_metering_2, col = "red")

##Command to continue plotting the next commands on the same plot 
par(new=T)

##Plot for Sub_metering_3
plot (reqddata$datetime, reqddata$Sub_metering_3, pch = ".", col = "blue", ylim = c(0,40), xlab = "", ylab = "")
lines(reqddata$datetime, reqddata$Sub_metering_3, col = "blue")

##Create the legend for the plots
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black","red","blue"))

##Close the device file
dev.off()

##End