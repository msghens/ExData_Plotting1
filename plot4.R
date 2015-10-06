# Project 1
# Plot 4





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
png(file = "plot4.png",width = 480,height = 480)
par(mfrow = c(2,2),mar = c(2,2,1,1))
with(plotData,{
  plot(
    datetime,Global_active_power,xlab = "", ylab = "Global Active Power (kilowatts)",type = "l"
  )
  plot(datetime,Voltage,xlab = "", ylab = "Global Active Power (kilowatts)",type = "l")
  plot(
    datetime,Sub_metering_1,xlab = "", ylab = "Energy sub metering",type = "l"
  )
  lines(datetime,Sub_metering_2,xlab = "",  col = "red")
  lines(datetime,plotData$Sub_metering_3,xlab = "",  col = "blue")
  legend(
    "topright",  lty = c(1,1,1),bty = "n", col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
  )
  plot(datetime,Global_reactive_power,type = "l")
})
dev.off()