datafile <- "./household_power_consumption.txt"

#Read data file, convert dates, subset with date range, convert date and time
epc <- read.table(datafile, header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = '?')
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
epc_ss <- subset(epc, Date >= "2007-02-01" & Date <= "2007-02-02")

#Convert date and time, globalActivePower, sub metering, voltage, globalReActivePower
datetime <- as.POSIXct(paste(epc_ss$Date, epc_ss$Time))
globalActivePower <- as.numeric(epc_ss$Global_active_power)
sub_metering1 <- as.numeric(epc_ss$Sub_metering_1)
sub_metering2 <- as.numeric(epc_ss$Sub_metering_2)
sub_metering3 <- as.numeric(epc_ss$Sub_metering_3)
Voltage <- as.numeric(epc_ss$Voltage)
globalReActivePower <- as.numeric(epc_ss$Global_reactive_power)

#Create plot 4
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, sub_metering1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, sub_metering2, type="l", col = "red")
lines(datetime, sub_metering3, type="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty = "n")
plot(datetime, globalReActivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
