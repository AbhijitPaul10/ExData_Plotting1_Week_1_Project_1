epower <- read.csv("E:/3rd Year/6th Sem/PE/PE_2/Exploraty data analysis/Week_1/household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
# Imports the required file and save it at a variable names "epower".
datetime <- strptime(paste(epower$Date, epower$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
# Create a variable "datetime" by using column "date" and "time" of epower's and joining them together.
epower <- cbind(epower, datetime)
# Adding the newly formed variable "datetime" to epower as a new column.
epower$Date <- as.Date(epower$Date, format="%d/%m/%Y")
# Changes the format of "Date" & "Time" column to desired format "ddmmyyyy" ,"H:M:S" and save it in the same column "Date" & "Time" Respectively.
subepower <- subset(epower, Date == "2007-02-01" | Date =="2007-02-02")
# Creates the required subset by using date as a constraint in a new variable named "subepower"
subepower$Global_active_power <- as.numeric(subepower$Global_active_power)
subepower$subMetering1 <- as.numeric(subepower$Sub_metering_1)
subepower$subMetering2 <- as.numeric(subepower$Sub_metering_2)
subepower$subMetering3 <- as.numeric(subepower$Sub_metering_3)
# Selecting the variable "subepower" and changing it's columns datatype to numeric values.
png("plot3.png", width=480, height=480)
# Dimension of the plot
plot(subepower$datetime, subepower$subMetering1, type="l", ylab="Energy Submetering", xlab="")
# Plots the required graph.
lines(subepower$datetime, subepower$subMetering2, type="l", col="red")
# Include details for "subMetering2"
lines(subepower$datetime, subepower$subMetering3, type="l", col="blue")
# Include details for "subMetering3"
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
# Inputs the legend on the top right corner.
dev.off()

