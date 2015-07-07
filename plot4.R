#EDA 
# Dataset has 2,075,259 rows and 9 columns. A rough estimate of the memory requirements is 2M*9*8bytes=144MB

# Load file
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Get only Vb: 1st or 2nd February, 2007
newdata <- subset(data, Date=="2007-02-01" | Date=="2007-02-02") 
rm(data)

# Convert Date and Time Vb with strptime() and as.Date() 
datetime <- paste(as.Date(newdata$Date), newdata$Time)
newdata$Datetime <- strptime(datetime, format="%Y-%m-%d %H:%M:%S", tz="")

# Matrix 2x2 for the graphic canvas
par(mfrow=c(2,2))

# Line chart NW 
plot(newdata$Datetime, newdata$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power")

# Line chart NE 
plot(newdata$Datetime, newdata$Voltage, 
     type="l", xlab="datetime", ylab="Voltage")

# Line chart SW 
plot(newdata$Datetime, newdata$Sub_metering_1, 
     type="l", xlab="", ylab="Energy sub metering")
lines(newdata$Datetime, newdata$Sub_metering_2, col="red")
lines(newdata$Datetime, newdata$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lwd=1)

# Line chart SE 
plot(newdata$Datetime, newdata$Global_reactive_power, 
     type="l", xlab="datetime", ylab="Global_reactive_power")

# Save file .png 480x480
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
