datafile <- "./household_power_consumption.txt"

#Read data file, convert dates, subset with date range, convert date and time
epc <- read.table(datafile, header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = '?')
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
epc_ss <- subset(epc, Date >= "2007-02-01" & Date <= "2007-02-02")


#Convert date and time, Global_active_power
datetime <- as.POSIXct(paste(epc_ss$Date, epc_ss$Time))
globalActivePower <- as.numeric(epc_ss$Global_active_power)

#Create plot 2
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
