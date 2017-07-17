##reading file and fixing ? to NA
Sys.setlocale(category = "LC_ALL", locale = "english")
epc <- data.table::fread("household_power_consumption.txt", na.strings="?")


## create a subset of dates for 2007-02-01 and 2007-02-02

newepc <- subset(epc, Date=="1/2/2007"| Date=="2/2/2007")


## create plot1 - Global Active Power - Frequency
png(filename = "plot1.png",width = 480, height = 480)
hist(newepc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
