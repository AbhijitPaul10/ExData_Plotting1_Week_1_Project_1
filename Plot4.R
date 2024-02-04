epower <- read.csv("E:/3rd Year/6th Sem/PE/PE_2/Exploraty data analysis/Week_1/household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
# Imports the required file and save it at a variable names "epower".
datetime <- strptime(paste(epower$Date, epower$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
# Create a variable "datetime" by using column "date" and "time" of epower's and joining them together.

epower <- cbind(epower, datetime)
# Adding the newly formed variable "datetime" to epower as a new column.

epower$Date <- as.Date(epower$Date, format="%d/%m/%Y")
# Changes the format of "Date" column to desired format "ddmmyyyy" and save it in the same column "Date" 

subepower <- subset(epower, Date == "2007-02-01" | Date =="2007-02-02")
# Creates the required subset by using date as a constraint in a new variable named "subepower"


subepower$Global_active_power <- as.numeric(subepower$Global_active_power)
subepower$Global_reactive_power <- as.numeric(subepower$Global_reactive_power)
subepower$Voltage <- as.numeric(subepower$Voltage)
subepower$Sub_metering_1 <- as.numeric(subepower$Sub_metering_1)
subepower$Sub_metering_2 <- as.numeric(subepower$Sub_metering_2)
subepower$Sub_metering_3 <- as.numeric(subepower$Sub_metering_3)
# Selecting the variable "subepower" and changing it's columns datatype to numeric values

png("plot4.png", width=480, height=480)
# Dimensions for the required plot.

par(mfrow=c(2,2))
# Plotting 4 plots in one window

plot(subepower$datetime, subepower$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(subepower$datetime, subepower$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(subepower$datetime,  subepower$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(subepower$datetime,  subepower$Sub_metering_2, type="l", col="red")
lines(subepower$datetime,  subepower$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="0.5",cex = 0.4)
plot(subepower$datetime,  subepower$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
#Plotting the required value and adding legends to it.

dev.off()