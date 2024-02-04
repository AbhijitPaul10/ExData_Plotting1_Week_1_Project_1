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
# Selecting the variable "subepower" and changing it's column "Gobal active power's" datatype to numeric values.
png("plot2.png", width=480, height=480)
# Dimensions for the required plot.
plot(subepower$datetime, subepower$Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)")
# Plotting between subepowerdatetime & column of "subepower" which is "Gobal active power"
dev.off()
