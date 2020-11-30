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

png("plot1.png")
hist(as.numeric(data$Global_active_power), 
     main = "Global Active Power", 
     col = "red", 
     xlab = "Global Active Power (kilowatts)")

dev.off()