#Read in File
ElecPowerConsump <- read.csv("household_power_consumption.txt", sep = ";")
#Subset for dates of interest
PowerConsumpSubset <- ElecPowerConsump[(as.character(ElecPowerConsump$Date) == "1/2/2007") | (as.character(ElecPowerConsump$Date) == "2/2/2007"),]

#globalActivePower <- as.numeric(PowerConsumpSubset$Global_active_power)
GlobalActivePower <- as.numeric(as.character(PowerConsumpSubset$Global_active_power))
#Plot
hist(GlobalActivePower, breaks = 24, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

png(file = "plot1.png", width = 480, height = 480)
  hist(GlobalActivePower, breaks = 24, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()


