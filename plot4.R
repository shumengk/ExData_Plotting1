# Read data
dat <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")

# Extract data from Feb. 1-2, 2007
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")
plot4 <- subset(dat, dat$Date==as.Date("2007-2-1")|dat$Date==as.Date("2007-2-2"))

# Combine day and time columns 
plot4$full_time <- paste(plot4$Date,plot4$Time)
plot4$full_time <- strptime(plot4$full_time, format="%Y-%m-%d %H:%M:%S")

# Plot plot4.png
png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# Topleft plot
with(plot4, plot(full_time, as.numeric(as.character(Global_active_power)), 
                 type="l", xlab="", ylab="Global Active Power (kilowatts)"))

# Topright plot
with(plot4, plot(full_time, as.numeric(as.character(Voltage)), 
                 type="l", xlab="datetime", ylab="Voltage"))

# Lower left plot
with(plot4, plot(full_time, as.numeric(as.character(Sub_metering_1)), 
                 type="l", xlab="", ylab="Energy sub metering", yaxt="n"))
with(plot4, lines(full_time, as.numeric(as.character(Sub_metering_2)), 
                  type="l", col="red"))
with(plot4, lines(full_time, as.numeric(as.character(Sub_metering_3)), 
                  type="l", col="blue"))
legend("topright", col=c("black","red","blue"), lwd=1, box.lwd=0,
       legend=colnames(plot4)[startsWith(colnames(plot4),"Sub")])
axis(side=2, at=seq(0,30,by=10))

# Lower right plot
with(plot4, plot(full_time, as.numeric(as.character(Global_reactive_power)), 
                 type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()
