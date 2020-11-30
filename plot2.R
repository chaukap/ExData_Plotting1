library(lubridate)

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

png("plot2.png")
plot(data$DateTime, 
     data$Global_active_power, 
     type = "l", 
     xaxt = "n",
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")
axis(1,
     at = c(data$DateTime[1], 
            data$DateTime[nrow(data)/2], 
            data$DateTime[nrow(data)]),
     c("Thu","Fri", "Sat"))

dev.off()