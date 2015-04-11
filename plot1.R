 if (!file.exists("household_power_consumption.txt"))
 {
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "exdata%2Fdata%2Fhousehold_power_consumption.zip")
  unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip")
 } 
 data <- read.table("household_power_consumption.txt", header=1, sep=";", na.strings = "?")
 datatouse <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
 png("plot1.png", width = 480, height = 480)
 hist(datatouse$Global_active_power,col="red",main="Global Active Power", xlab="Globa Active Power (kilowatts)") 
 dev.off()
