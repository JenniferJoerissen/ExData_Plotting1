ElecPowerConsump <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
PowerConsumpSubset <- ElecPowerConsump[(as.character(ElecPowerConsump$Date) == "1/2/2007") | (as.character(ElecPowerConsump$Date) == "2/2/2007"),]

PowerConsumpSubset$Measurement_Time <- paste (PowerConsumpSubset$Date, PowerConsumpSubset$Time)
PowerConsumpSubset$Measurement_Time <- strptime(PowerConsumpSubset$Measurement_Time, format="%d/%m/%Y %H:%M:%S")

Sys.setlocale(category = "LC_TIME", locale = "C")

par(mfcol = c(1,1))

png(file = "plot3.png", width = 480, height = 480)
  plot(PowerConsumpSubset$Measurement_Time, PowerConsumpSubset$Sub_metering_1, type ="n", xlab ="", ylab ="Energy sub metering")
  lines(PowerConsumpSubset$Measurement_Time, PowerConsumpSubset$Sub_metering_1)
  lines(PowerConsumpSubset$Measurement_Time, PowerConsumpSubset$Sub_metering_2, col = "red")
  lines(PowerConsumpSubset$Measurement_Time, PowerConsumpSubset$Sub_metering_3, col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=c(1,1,1),col=c("black","blue","red"))
dev.off()
