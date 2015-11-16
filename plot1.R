# Bloc 4:
# Week 1
# course project 1
# plot1.R

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

# create png device
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")

# create plot
hist(HPC_feb$Global_active_power, main = 'Global Active Power', col = 'red', xlab = 'Global Active Power (kilowatts)')

# close
dev.off()
