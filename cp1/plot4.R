hhpow <- read.table("household_power_consumption.txt", header=TRUE, sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?",comment.char="",nrows=2100000)
hhpow$Date <- as.Date(hhpow$Date, "%d/%m/%Y")
hhpow2 <- hhpow[hhpow["Date"]=="2007/02/01" | hhpow["Date"]=="2007/02/02",]

hhpow2$Time <- as.POSIXct(paste(hhpow2$Date,hhpow2$Time), "Pacific")

png(filename="plot4.png", width=480, height=480, units="px", pointsize=12)
par(mfrow = c(2,2), ps=12)
plot(hhpow2$Time, hhpow2$Global_active_power, xlab = "", ylab="Global Active Power", type="l" )
plot(hhpow2$Time, hhpow2$Voltage, xlab = "datetime", ylab="Voltage", type="l" )
plot(hhpow2$Time, hhpow2$Sub_metering_1,type='l', xlab="", ylab="Energy sub metering")
lines(hhpow2$Time, hhpow2$Sub_metering_2, type = "l", col="red")
lines(hhpow2$Time, hhpow2$Sub_metering_3, type = "l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"), bty="n", seg.len=1)
plot(hhpow2$Time, hhpow2$Global_reactive_power, xlab = "datetime", ylab="Global_reactive_power", type="l")

dev.off()