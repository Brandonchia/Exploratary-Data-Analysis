# read dataset
data <- read.table("household_power_consumption.txt",head=TRUE,sep=";",na.string ="?")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

# select sub dataset
start <- as.Date("2007/02/01",format="%Y/%m/%d")
end <- as.Date("2007/02/02",format="%Y/%m/%d")

data1 <- subset(data,data$Date >= start & data$Date <= end)
mergeDT <- paste(data1$Date,data1$Time)

convertDT<-strptime(mergeDT, format="%Y-%m-%d %H:%M:%S")
data1$Datime <- convertDT

# plot 3
png("plot3.png", width=480, height=480)
with(data1,{
        plot(data1$Datime,data1$Sub_metering_1,type="n",xlab="Time",ylab="Energy Sub Metering")
        # plot line related to sub metering 1
        lines(data1$Datime,data1$Sub_metering_1,col="black")
        # plot line related to sub metering 2
        lines(data1$Datime,data1$Sub_metering_2,col="green")
        # plot line related to sub metering 3
        lines(data1$Datime,data1$Sub_metering_3,col="blue")
        legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n", lty = "solid", col = c("black","green","blue"))
})
dev.off()
