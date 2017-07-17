##reading file and fixing ? to NA
Sys.setlocale(category = "LC_ALL", locale = "english")
epc <- data.table::fread("household_power_consumption.txt", na.strings="?")


## create a subset of dates for 2007-02-01 and 2007-02-02

newepc <- subset(epc, Date=="1/2/2007"| Date=="2/2/2007")


##convert Date - time

Datetime <- paste(newepc$Date, newepc$Time)
Datetime1 <- as.POSIXct(Datetime, format="%d/%m/%Y %H:%M:%S", tz="")


## create plot3
png(filename = "plot3.png",width = 480, height = 480)

plot(Datetime1, newepc$Sub_metering_1,  type="l", col="black", xlab="", ylab="Energy sub metering")
  lines(Datetime1, newepc$Sub_metering_2, type="l", col="red")
  lines(Datetime1, newepc$Sub_metering_3, type="l", col="blue")
  
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)

dev.off()
