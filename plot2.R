ElecPowerConsump <- read.csv("household_power_consumption.txt", sep = ";")
PowerConsumpSubset <- ElecPowerConsump[(as.character(ElecPowerConsump$Date) == "1/2/2007") | (as.character(ElecPowerConsump$Date) == "2/2/2007"),]

PowerConsumpSubset$Measurement_Time <- paste (PowerConsumpSubset$Date, PowerConsumpSubset$Time)
PowerConsumpSubset$Measurement_Time<- strptime(PowerConsumpSubset$Measurement_Time, format="%d/%m/%Y %H:%M:%S")

GlobalActivePower <- as.numeric(as.character(PowerConsumpSubset$Global_active_power))
#Define Langue
Sys.setlocale(category = "LC_TIME", locale = "C")
#Plot
png(file = "plot2.png", width = 480, height = 480)
  plot(PowerConsumpSubset$Measurement_Time, GlobalActivePower, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)")
dev.off()
