##Load the file 
qdata <- read.table("household_power_consumption.txt",sep=";", header = TRUE)

##Convert to date data type to be able to filter
qdata$Date <- as.Date(qdata$Date, format = "%d/%m/%Y")
library(dplyr)

##filter the data to only view the two required days
reqddata <- filter(qdata,qdata$Date >= "2007-02-01" & qdata$Date <= "2007-02-02" )

##Convert factor to numeric type 
reqddata$Global_active_power <- as.numeric(as.character(reqddata$Global_active_power))

##Merge date and time columns to one column
reqddata$datetime <- paste(reqddata$Date, as.character.POSIXt(reqddata$Time))
reqddata$datetime <- as.POSIXct(reqddata$datetime)

##Initiate plot2.png file
png(file = "plot2.png")

##Plot the scatter plot following the line plot
plot(reqddata$datetime,reqddata$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "",  pch =".")
lines(reqddata$datetime,reqddata$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "")

##Close the device file
dev.off()

##End