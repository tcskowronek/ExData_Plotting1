# Set working directory to the forked/cloned repository
setwd("./ExData_Plotting1/")

# Define the date range for subsetting the raw data
start.date <- as.Date("2007-02-01", "%Y-%m-%d")
end.date <- as.Date("2007-02-02", "%Y-%m-%d")

# Read the source household power consumption data
power.consumption <- read.table("./household_power_consumption.txt", 
                                header = TRUE, sep = ";", na.strings="?")

# Create a Date/Time variable using the Date and Time variables
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
png("./plot2.png", width = 480, height = 480, units = "px")
with(power.subset, plot(dateTime, Global_active_power, type="l", xlab="", 
                        ylab="Global Active Power (kilowatts)"))
dev.off()