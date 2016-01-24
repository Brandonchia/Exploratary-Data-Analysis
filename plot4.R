data <- read.table("household_power_consumption.txt",head=TRUE,sep=";",na.string ="?")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
start <- as.Date("2007/02/01",format="%Y/%m/%d")
end <- as.Date("2007/02/02",format="%Y/%m/%d")
data1 <- subset(data,data$Date >= start & data$Date <= end)
mergeDT <- paste(data1$Date,data1$Time)
convertDT<-strptime(mergeDT, format="%Y-%m-%d %H:%M:%S")
data1$Datime <- convertDT
par(mfrow= c(2,2))
# plot 4
plot(data1$Datime,data1$Global_active_power,xlab="Time",ylab="Global Active Power(kilowatts)",type="n")
lines(data1$Datime,data1$Global_active_power,xlab="Time",ylab="Global Active Power(kilowatts)")

plot(data1$Datime,data1$Voltage,xlab="datetime",ylab="Voltage",type="n")
lines(data1$Datime,data1$Voltage,xlab="datetime",ylab="Voltage")

plot(data1$Datime,data1$Sub_metering_1,type="n",xlab="Time",ylab="Energy Sub Metering")
lines(data1$Datime,data1$Sub_metering_1,col="black")
lines(data1$Datime,data1$Sub_metering_2,col="green")
lines(data1$Datime,data1$Sub_metering_3,col="blue")

plot(data1$Datime,data1$Global_reactive_power,xlab="date time",type="n")
lines(data1$Datime,data1$Global_reactive_power,xlab="date time")

dev.copy(png,file="plot4.png")
dev.off()
