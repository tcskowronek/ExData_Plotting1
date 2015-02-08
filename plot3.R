# Coursera: John Hopkins University
# Data Science Track Specialization
# Course: Exploratory Data Analysis
#
# Author: Thomas Skowronek
# Date: 02/07/2015
#
# Source data for the project:
#   https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip


# Define the date range for subsetting the raw data
start.date <- as.Date("2007-02-01", "%Y-%m-%d")
end.date <- as.Date("2007-02-02", "%Y-%m-%d")

# Read the source household power consumption data file, which was extracted to 
# the ExData_Plotting1 directory
power.consumption <- read.table("./household_power_consumption.txt", 
                                header = TRUE, sep = ";", na.strings="?")

# Add a Date/Time variable to the data.frame using the Date and Time variables
power.consumption$dateTime <- strptime(paste(power.consumption$Date, 
                                             power.consumption$Time), 
                                       "%d/%m/%Y %H:%M:%S")

# Convert the Date variable to a Date
power.consumption$Date <- as.Date(power.consumption$Date, format = "%d/%m/%Y")

# Subset the source data.frame to only include observations between 2007-02-01 
# and 2007-02-02
power.subset <- power.consumption[which(power.consumption$Date >= start.date 
                                        & power.consumption$Date <= end.date), ]

# Remove the raw data.frame to free up memory
rm(power.consumption)

# Create the plot and save it to a PNG file of size 480 x 480
png("./plot3.png", width = 480, height = 480, units = "px")
with(power.subset, plot(dateTime, Sub_metering_1, type="l", xlab="", 
                        ylab="Energy sub metering"))
with(power.subset, lines(dateTime, Sub_metering_2, type="l", col = "red"))
with(power.subset, lines(dateTime, Sub_metering_3, type="l", col = "blue"))
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd = .90, cex = .90)
dev.off()