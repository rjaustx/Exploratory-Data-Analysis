datafile <- "./household_power_consumption.txt"

#Read data file, convert dates, subset with date range, convert date and time
epc <- read.table(datafile, header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = '?')
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
epc_ss <- subset(epc, Date >= "2007-02-01" & Date <= "2007-02-02")

#Convert date and time, Global_active_power
datetime <- as.POSIXct(paste(epc_ss$Date, epc_ss$Time))
epc_ss$Global_active_power <- as.numeric(as.character(epc_ss$Global_active_power))

#Create plot
png("plot1.png", width=480, height=480)
hist(epc_ss$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", breaks = 12, col='red')
dev.off()

