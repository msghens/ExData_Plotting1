# Project 1
# Plot 2



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
png(file = "plot2.png",width = 480,height = 480)
plot(
  plotData$datetime,plotData$Global_active_power,xlab = "", ylab = "Global Active Power (kilowatts)",type = "l"
)
dev.off()