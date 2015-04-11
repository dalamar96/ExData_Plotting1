if (!file.exists("household_power_consumption.txt"))
{
 download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "exdata%2Fdata%2Fhousehold_power_consumption.zip")
 unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip")
} 
data <- read.table("household_power_consumption.txt", header=1, sep=";", na.strings = "?")
datatouse <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

dates <- as.POSIXlt(strptime(paste(datatouse$Date,datatouse$Time), "%d/%m/%Y %H:%M:%S"))

png("plot3.png", width=480, height=480)
plot(dates,datatouse$Sub_metering_1, type='l', ylab="Energy sub metering", xlab="")
points(dates,datatouse$Sub_metering_2, type='l', col='red')
points(dates,datatouse$Sub_metering_3, type='l', col='blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(1,1,1), col=c("black","red","blue"))
dev.off()

