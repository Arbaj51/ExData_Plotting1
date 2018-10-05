house<-read.table("household_power_consumption.txt",sep = ";")
dates<-house[,1]
a<-c("1/2/2007","2/2/2007")
dates<- as.character(dates)
B <- a == dates
rh<-house[B,]
gap<-rh[,3]
gap<- as.character(gap)
gap<-as.numeric(gap)
png("plot1.png", width = 480, height = 480)
hist(gap, col = "red",xlab = "Global Active Power (kilowatts)")
dev.off()
