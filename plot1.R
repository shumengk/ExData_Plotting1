# Read data
dat <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")

# Extract data from Feb. 1-2, 2007
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")
plot1 <- subset(dat, dat$Date==as.Date("2007-2-1")|dat$Date==as.Date("2007-2-2"))


# Plot plot1.png
png(file="plot1.png", width=480, height=480)
with(plot1, hist(as.numeric(as.character(Global_active_power)), col="red",
                 xlab="Global Active Power (kilowatts)",
                 main="Global Active Power"))
dev.off()

