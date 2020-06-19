# Read data
dat <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")

# Extract data from Feb. 1-2, 2007
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")
plot3 <- subset(dat, dat$Date==as.Date("2007-2-1")|dat$Date==as.Date("2007-2-2"))

# Combine day and time columns 
plot3$full_time <- paste(plot3$Date,plot3$Time)
plot3$full_time <- strptime(plot3$full_time, format="%Y-%m-%d %H:%M:%S")

# Plot plot3.png
png(file="plot3.png", width=480, height=480)
with(plot3, plot(full_time, as.numeric(as.character(Sub_metering_1)), 
                 type="l", xlab="", ylab="Energy sub metering", yaxt="n"))
with(plot3, lines(full_time, as.numeric(as.character(Sub_metering_2)), 
                  type="l", col="red"))
with(plot3, lines(full_time, as.numeric(as.character(Sub_metering_3)), 
                  type="l", col="blue"))
legend("topright", col=c("black","red","blue"), lwd=1,
       legend=colnames(plot3)[startsWith(colnames(plot3),"Sub")])
axis(side=2, at=seq(0,30,by=10))

dev.off()
