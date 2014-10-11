data <- read.table("household_power_consumption.txt", header = TRUE, sep =";", 
                   na.strings = "?", skip = 66636, nrows = 2880) #Reads in data with dates from 02/01/2007 to 02/02/2007
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
                    "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3") #Assigns column names
                                                                                              #to data

png(filename = "plot1.png", width = 480, height = 480) #Opens png file device

hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
#Creates histogram

dev.off() #Closes file device