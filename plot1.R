# Project 1
# Plot 1


#Read Data
plotData <- read.csv(file = "household_power_consumption.txt", na.strings = "?", sep = ";", stringsAsFactors = FALSE)


#Convert date from chr to date

plotData$Date <- as.Date(plotData$Date,"%d/%m/%Y")

#subset data for dates between 2007-02-01 and 2007-02-02

plotData <- subset(plotData,Date >= "2007-02-01" & Date <= "2007-02-02")

hist(plotData$Global_active_power,col='red',xlab = "Global Active Power (kilowatts)",main = "Global Active Power")

# Save it to file

dev.copy(png,file = "plot1.png")
dev.off()
