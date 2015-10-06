# Project 1
# Plot 3




#Read Data
plotData <-
  read.csv(
    file = "household_power_consumption.txt", na.strings = "?", sep = ";", stringsAsFactors = FALSE
  )


#create a date/time column
plotData$datetime <- paste(plotData$Date,plotData$Time)

#Convert date from chr to date
plotData$datetime <-
  strptime(plotData$datetime, "%d/%m/%Y %H:%M:%S")

plotData$Date <- as.Date(plotData$Date,"%d/%m/%Y")

#subset data for dates between 2007-02-01 and 2007-02-02

plotData <-
  subset(plotData,Date >= "2007-02-01" & Date <= "2007-02-02")

#plot and save file
png(file = "plot3.png",width = 480,height = 480)
plot(
  plotData$datetime,plotData$Sub_metering_1,xlab = "", ylab = "Energy sub metering",type = "l"
)
lines(plotData$datetime,plotData$Sub_metering_2,xlab = "",  col = "red")
lines(plotData$datetime,plotData$Sub_metering_3,xlab = "",  col = "blue")
legend(
  "topright",  lty = c(1,1), col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
)
dev.off()