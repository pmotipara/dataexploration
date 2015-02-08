hhpow <- read.table("household_power_consumption.txt", header=TRUE, sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")
hhpow$Date <- as.Date(hhpow$Date, "%d/%m/%Y")
hhpow2 <- hhpow[hhpow["Date"]=="2007/02/01" | hhpow["Date"]=="2007/02/02",]
hhpow2 <- hhpow[hhpow["Date"]=="2007-01-02" | hhpow["Date"]=="2007-02-02",]

png(filename="plot1.png", width=480, height=480, units="px", pointsize=12)
hist(hhpow2$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="#FF0000")
dev.off()