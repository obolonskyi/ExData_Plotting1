##reading file and fixing ? to NA
Sys.setlocale(category = "LC_ALL", locale = "english")
epc <- data.table::fread("household_power_consumption.txt", na.strings="?")


## create a subset of dates for 2007-02-01 and 2007-02-02

newepc <- subset(epc, Date=="1/2/2007"| Date=="2/2/2007")


##convert Date - time

Datetime <- paste(newepc$Date, newepc$Time)
Datetime1 <- as.POSIXct(Datetime, format="%d/%m/%Y %H:%M:%S", tz="")


## create plot2
png(filename = "plot2.png",width = 480, height = 480)
plot(Datetime1, newepc$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
