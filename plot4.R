ElecPowerConsump <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
PowerConsumpSubset <- ElecPowerConsump[(as.character(ElecPowerConsump$Date) == "1/2/2007") | (as.character(ElecPowerConsump$Date) == "2/2/2007"),]

PowerConsumpSubset$Measurement_Time <- paste (PowerConsumpSubset$Date, PowerConsumpSubset$Time)
PowerConsumpSubset$Measurement_Time <- strptime(PowerConsumpSubset$Measurement_Time, format="%d/%m/%Y %H:%M:%S")

GlobalActivePower <- as.numeric(as.character(PowerConsumpSubset$Global_active_power))

Sys.setlocale(category = "LC_TIME", locale = "C")



png(file = "plot4.png", width = 480, height = 480)
  par(mfcol = c(2,2))
  plot(PowerConsumpSubset$Measurement_Time, GlobalActivePower, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)")
  plot(PowerConsumpSubset$Measurement_Time, PowerConsumpSubset$Sub_metering_1, type ="n", xlab ="", ylab ="Energy sub metering")
    lines(PowerConsumpSubset$Measurement_Time, PowerConsumpSubset$Sub_metering_1)
    lines(PowerConsumpSubset$Measurement_Time, PowerConsumpSubset$Sub_metering_2, col = "red")
    lines(PowerConsumpSubset$Measurement_Time, PowerConsumpSubset$Sub_metering_3, col = "blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(1,1,1),col=c("black","blue","red"), bty = "n")
  plot(PowerConsumpSubset$Measurement_Time, PowerConsumpSubset$Voltage, type = "l", xlab ="datetime", ylab = "Voltage")
  plot(PowerConsumpSubset$Measurement_Time, PowerConsumpSubset$Global_reactive_power, type = "l", xlab ="datetime", ylab = "Global_reactive_power")
dev.off()
