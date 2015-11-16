# Bloc 4:
# Week 1
# course project 1
# plot3.R

# Download zip file if not in directory
if (!file.exists("household_power_consumption.txt")){
    urldata <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(url = urldata, destfile = "household_power_consumption.zip", method = "curl")
    unzip("household_power_consumption.zip")
}

# Read data for 1/2/2007 and 2/2/2007
HPC <- read.csv("household_power_consumption.txt", sep = ";", na.strings = '?')
dataselect <- (HPC$Date == '1/2/2007' | HPC$Date == '2/2/2007')
HPC_feb <- HPC[dataselect,]

# transform data
HPC_feb$DateTime = paste(HPC_feb$Date, HPC_feb$Time, sep="-")
HPC_feb$DateTime <- strptime(HPC_feb$DateTime, "%d/%m/%Y-%H:%M:%S")

# create png device
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")

# create plot
plot(HPC_feb$DateTime, HPC_feb$Sub_metering_1, type = "l", col = 'black', ylab = "Energy sub metering", xlab = '')
lines(HPC_feb$DateTime, HPC_feb$Sub_metering_2, type = "l", col = 'red')
lines(HPC_feb$DateTime, HPC_feb$Sub_metering_3, type = "l", col = 'blue')
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1) , lwd = c(1, 1, 1), col = c('black','red','blue'))

# close
dev.off()

