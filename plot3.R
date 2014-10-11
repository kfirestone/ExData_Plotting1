data <- read.table("household_power_consumption.txt", header = TRUE, sep =";", 
                   na.strings = "?", skip = 66636, nrows = 2880) #Reads in data with dates from 02/01/2007 to 02/02/2007
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
                    "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3") #Assigns column names
                                                                                              #to data

data$Time_Date <- strptime(paste(data$Date, data$Time, sep = ","), format = "%d/%m/%Y,%H:%M:%S") #Creates new column
                                                                                                 #to combine "Date" and
                                                                                                 #"Time" columns.

png(filename = "plot3.png", height = 480, width = 480) #Open png file device

plot(data$Time_Date, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering") #Creates plot
lines(data$Time_Date, data$Sub_metering_2, type = "l", col = "red") #Adds Sub_metering_2 data to plot in a red line
lines(data$Time_Date, data$Sub_metering_3, type = "l", col = "blue") #Adds Sub_metering_3 data to plot in a blue line

legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) #Creates legend in top right corner

dev.off() #Closes file device