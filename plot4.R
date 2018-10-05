house<-read.table("household_power_consumption.txt",sep = ";")
dates<-house[,1]
a<-c("1/2/2007","2/2/2007")
dates<- as.character(dates)
B <- a == dates
subSetData<-house[B,]

datetime <- strptime(paste(subSetData$V1, subSetData$V2, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$V3)
subMetering1 <- as.numeric(subSetData$V4)
subMetering2 <- as.numeric(subSetData$V5)
subMetering3 <- as.numeric(subSetData$V6)
voltage<- subSetData$V5
globalReactivePower<-subSetData$V4
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()