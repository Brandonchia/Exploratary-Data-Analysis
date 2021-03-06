# read data in working directory
data <- read.table("household_power_consumption.txt",head=TRUE,sep=";",na.string ="?")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
# select sub dataset
start <- as.Date("2007/02/01",format="%Y/%m/%d")
end <- as.Date("2007/02/02",format="%Y/%m/%d")

data1 <- subset(data,data$Date >= start & data$Date <= end)
mergeDT <- paste(data1$Date,data1$Time)

convertDT<-strptime(mergeDT, format="%Y-%m-%d %H:%M:%S")
data1$Datime <- convertDT

# plot 4
png("plot4.png", width=480, height=480)
par(mfrow= c(2,2))

with(data1,{
        # plot on topleft 
        plot(data1$Datime,data1$Global_active_power,xlab="Time",ylab="Global Active Power(kilowatts)",type="n")
        lines(data1$Datime,data1$Global_active_power,xlab="Time",ylab="Global Active Power(kilowatts)")
        
        # plot on topright
        plot(data1$Datime,data1$Voltage,xlab="datetime",ylab="Voltage",type="n")
        lines(data1$Datime,data1$Voltage,xlab="datetime",ylab="Voltage")
        
        # plot on bottomleft 
        plot(data1$Datime,data1$Sub_metering_1,type="n",xlab="Time",ylab="Energy Sub Metering")
        lines(data1$Datime,data1$Sub_metering_1,col="black")
        lines(data1$Datime,data1$Sub_metering_2,col="green")
        lines(data1$Datime,data1$Sub_metering_3,col="blue")
        legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n", lty = "solid", col = c("black","green","blue"))
        
        # plot on bottomright
        plot(data1$Datime,data1$Global_reactive_power,xlab="date time",type="n")
        lines(data1$Datime,data1$Global_reactive_power,xlab="date time")
        })
dev.off()
