house <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))
house$Date <- as.Date(house$Date, "%d/%m/%Y")
house <- subset(house, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
house <- house[complete.cases(house),]
dateTime <- setNames(paste(house$Date, house$Time), "DateTime")
house <- house[ ,!(names(house) %in% c("Date","Time"))]
house <- cbind(dateTime, house)
house$dateTime <- as.POSIXct(dateTime)

png("plot3.png", width = 480, height = 480)
with(house, {
  plot(Sub_metering_1~dateTime, xlab="", ylab="Energy sub metering", type="l")
  lines(Sub_metering_2~dateTime, col='Red')
  lines(Sub_metering_3~dateTime, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()