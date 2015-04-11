plot3 <- function() {
  ## Reads household_power_consumption data file
  ## Plots appropriate plot to a png file in the same directory

  ## Read file and subset by days required
  file <- read.csv2("household_power_consumption.txt",as.is = TRUE,na.strings = "?")
  df <- subset(file, file$Date == "1/2/2007" | file$Date == "2/2/2007")
  
  ## convert date and time into the Date and Time class so that it can be plotted
  ## Concatenate date and time together into the Date column for plotting
  df$Date <- paste(df$Date,df$Time)
  df$Date <- strptime(df$Date, format="%d/%m/%Y %H:%M:%S")
  
  ## Convert dataframe fiels into the correct data types for plotting
  df$Global_active_power <- as.numeric(df$Global_active_power)
  df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
  df$Voltage <- as.numeric(df$Voltage)
  df$Global_intensity <- as.numeric(df$Global_intensity)
  df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
  df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
  df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)
  

  # Print to the Png file
  png(file="plot3.png")
  
  #plot graph #3
  plot(df$Date,m$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  points(df$Date,m$Sub_metering_1, type = "l")
  points(df$Date,m$Sub_metering_2, type = "l", col = "red")
  points(df$Date,m$Sub_metering_3, type = "l", col = "blue")
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black","red","blue"))
  
  # close the graphics device
  dev.off()
  
}