if (!file.exists("household_power_consumption.txt"))
{
 download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "exdata%2Fdata%2Fhousehold_power_consumption.zip")
 unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip")
} 
data <- read.table("household_power_consumption.txt", header=1, sep=";", na.strings = "?")
datatouse <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

dates <- as.POSIXlt(strptime(paste(datatouse$Date,datatouse$Time), "%d/%m/%Y %H:%M:%S"))

png("plot2.png", width=480, height=480)
plot(dates,datatouse$Global_active_power, type='l', ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

