setwd("C:/coursera/Documents")
qdata <- read.table("household_power_consumption.txt",sep=";", header = TRUE)
qdata$Date <- as.Date(qdata$Date, format = "%d/%m/%Y")
library(dplyr)
reqddata <- filter(qdata,qdata$Date >= "2007-02-01" & qdata$Date <= "2007-02-02" )
reqddata$datetime <- paste(reqddata$Date, as.character.POSIXt(reqddata$Time))
reqddata$datetime <- as.POSIXct(reqddata$datetime)
reqddata$Sub_metering_1 <- as.numeric(as.character(reqddata$Sub_metering_1))
reqddata$Sub_metering_2 <- as.numeric(as.character(reqddata$Sub_metering_2))
reqddata$Sub_metering_3 <- as.numeric(as.character(reqddata$Sub_metering_3))

png(file = "plot3.png")

plot (reqddata$datetime, reqddata$Sub_metering_1, pch = ".", ylim = c(0,40), xlab ="", ylab = "Energy Sub Metering")
lines(reqddata$datetime, reqddata$Sub_metering_1, col = "black")

par(new=T)

plot (reqddata$datetime, reqddata$Sub_metering_2, pch = ".", col = "red", ylim = c(0,40), xlab ="", ylab = "")
lines(reqddata$datetime, reqddata$Sub_metering_2, col = "red")

par(new=T)

plot (reqddata$datetime, reqddata$Sub_metering_3, pch = ".", col = "blue", ylim = c(0,40), xlab = "", ylab = "")
lines(reqddata$datetime, reqddata$Sub_metering_3, col = "blue")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black","red","blue"))

dev.off()