data <- read.table("household_power_consumption.txt",head=TRUE,sep=";",na.string ="?")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
start <- as.Date("2007/02/01",format="%Y/%m/%d")
end <- as.Date("2007/02/02",format="%Y/%m/%d")
data1 <- subset(data,data$Date >= start & data$Date <= end)
mergeDT <- paste(data1$Date,data1$Time)
convertDT<-strptime(mergeDT, format="%Y-%m-%d %H:%M:%S")
data1$Datime <- convertDT
## plot 2
plot(data1$Datime,data1$Global_active_power,type="n")
lines(data1$Datime,data1$Global_active_power,xlab="Time",ylab="Global Active Power(kilowatts)")
dev.copy(png,file="plot2.png")
dev.off()
