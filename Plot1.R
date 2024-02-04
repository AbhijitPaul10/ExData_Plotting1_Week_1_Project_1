epower <- read.csv("E:/3rd Year/6th Sem/PE/PE_2/Exploraty data analysis/Week_1/household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
# The data set has been saved in the epower variable.
epower$Date <- as.Date(epower$Date, format="%d/%m/%Y")
# The Date column format has been changed to "ddmmyyyy" of the data epower
subepower <- subset(epower, Date == "2007-02-01" | Date =="2007-02-02")
# Created a variable subepower from epower using constraint for date
subepower$Global_active_power <- as.numeric(subepower$Global_active_power)
# Change the "Global active power" column of subepower to numeric values
png("plot1.png", width=480, height=480)
# Dimension of the png has been set
hist(subepower$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency")
# Using hist we plotted by using the values of subepower's column which is Global active power
dev.off()
