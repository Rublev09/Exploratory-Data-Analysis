
# The dataset has 2,075,259 rows and 9 columns. A rough estimate of the memory requirements is 2M*9*8bytes = 144MB

# Load file
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Get only Vb: 1st or 2nd February, 2007
newdata <- subset(data, Date=="2007-02-01" | Date=="2007-02-02") 
rm(data)

# Convert Date and Time Vb with strptime() and as.Date()
datetime <- paste(as.Date(newdata$Date), newdata$Time)
newdata$Datetime <- strptime(datetime, format="%Y-%m-%d %H:%M:%S", tz="")

# Histogram
hist(newdata$Global_active_power, 
     main = "Global Active Power", 
     ylab = "Frequency", 
     xlab = "Global Active Power (kilowatts)", 
     col = "red")                                                                                  

# Save file .png 480x480
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

