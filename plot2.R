house<-read.table("household_power_consumption.txt",sep = ";")
dates<-house[,1]
a<-c("1/2/2007","2/2/2007")
dates<- as.character(dates)
B <- a == dates
rh<-house[B,]
gap<-rh[,3]
gap<- as.character(gap)
gap<-as.numeric(gap)
datestime<- strptime(paste(rh$V1,rh$V2, sep = " "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width = 480, height = 480)
plot(datestime,gap, type = "l",xlab = "Global Active Power (kilowatts)")
dev.off()
