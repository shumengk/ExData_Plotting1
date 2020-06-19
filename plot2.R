# Read data
dat <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")

# Extract data from Feb. 1-2, 2007
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")
plot2 <- subset(dat, dat$Date==as.Date("2007-2-1")|dat$Date==as.Date("2007-2-2"))

# Combine day and time columns 
plot2$full_time <- paste(plot2$Date,plot2$Time)
plot2$full_time <- strptime(plot2$full_time, format="%Y-%m-%d %H:%M:%S")

# Plot plot2.png
png(file="plot2.png", width=480, height=480)
with(plot2, plot(full_time, as.numeric(as.character(Global_active_power)), 
                 type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
