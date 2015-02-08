hhpow <- read.table("household_power_consumption.txt", header=TRUE, sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")
hhpow$Date <- as.Date(hhpow$Date, "%d/%m/%Y")
hhpow2 <- hhpow[hhpow["Date"]=="2007/02/01" | hhpow["Date"]=="2007/02/02",]

hhpow2$Time <- as.POSIXct(paste(hhpow2$Date,hhpow2$Time), "Pacific")
png(filename="plot2.png", width=480, height=480, units="px", pointsize=12)
plot(hhpow2$Time,hhpow2$Global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)")
dev.off()