library(lubridate)
library(datetime)

data <- read.table("household_power_consumption.txt", 
                   sep = ";", 
                   na.strings = "?")
names(data) <- data[1,]
data <- data[-1,]
data[,1] <- as.Date(strptime(data[,1], "%d/%m/%Y"))
data <- subset(data, 
               Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
data$DateTime <- as.datetime(
  strptime(paste0(data$Date, " ", data$Time),
           "%Y-%m-%d %H:%M:%S"))

png("plot3.png")
plot(data$DateTime, 
     data$Sub_metering_1, 
     type = "l", 
     xaxt = "n",
     col = "black",
     xlab = "", 
     ylab = "Energy sub metering")
lines(data$DateTime, 
      data$Sub_metering_2,
      col = "red",)
lines(data$DateTime, 
      data$Sub_metering_3,
      col = "blue",)
axis(1,
     at = c(data$DateTime[1], 
            data$DateTime[nrow(data)/2], 
            data$DateTime[nrow(data)]),
     c("Thu","Fri", "Sat"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lwd = 1)

dev.off()