##Load the file 
qdata <- read.table("household_power_consumption.txt",sep=";", header = TRUE)

##Convert to date data type to be able to filter
qdata$Date <- as.Date(qdata$Date, format = "%d/%m/%Y")
library(dplyr)

##filter the data to only view the two required days
reqddata <- filter(qdata,qdata$Date >= "2007-02-01" & qdata$Date <= "2007-02-02" )

##convert Global_active_power factor to numeric type
reqddata$Global_active_power <- as.numeric(as.character(reqddata$Global_active_power))

##initiate plot1.png file
png(file = "plot1.png")

##construct the histogram with necessary parameters
hist(reqddata$Global_active_power, col = "red", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", main= "Global Active Power")

##close the device
dev.off()

##End