
#EDA 
# The dataset has 2,075,259 rows and 9 columns. A rough estimate of the memory requirements is thus 2M * 9 * 8 bytes / 1M ~ 144 MB.

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Get only those variables which dates equal the 1st or 2nd of February, 2007
newdata <- subset(data, Date=="2007-02-01" | Date=="2007-02-02") #OR
newdata <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]
rm(data)

# #convert the Date and Time variables using strptime() and as.Date() functions
datetime <- paste(as.Date(newdata$Date), newdata$Time)
newdata$Datetime <- strptime(datetime, format="%Y-%m-%d %H:%M:%S", tz="")

# Generate the histogram for plot1
hist(newdata$Global_active_power, 
     main = "Global Active Power", 
     ylab = "Frequency", 
     xlab = "Global Active Power (kilowatts)", 
     col = "red")                                                                                   1200), xlim = c(0, 6), xaxp = c(0, 6, 3))

# Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

