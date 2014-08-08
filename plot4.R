## code to plot the energy sub metering variable as a function of time, for the 1st and 2nd of February 2007
## assumes that the working directory contains the default file name. If different, specify as an argument to the function

plot4<- function(myfile=""){

  library(lubridate)
  filename <- "household_power_consumption.txt"
  if(myfile!="") filename<- myfile
  
  ## read data file 
  df<- read.table(filename, header= TRUE, sep=";", as.is=TRUE, na.strings= c("NA", "?"))

  ## subset it: keep only the relevant rows, i.e. corresponding to 1 and 2 Feb 2007
  df <- subset( df, year(dmy(df$Date)) == 2007 & month(dmy(df$Date)) == 02 & ( day(dmy(df$Date)) == 01 | day(dmy(df$Date)) == 02 ) )

  ## open png devide to draw the plot onto 
  png("plot4.png")
  par(mfrow = c(2, 2), mar = c(5, 4, 2, 1))

  ## Plot on pad 1 (top left)
  plottitle<- "Global Active Power"
  plot(df$Global_active_power, type="s", ylab=paste(plottitle, " (kilowatts)", sep=""), xlab="", axes=FALSE)
  axis(1, at = c(0, nrow(df)/2.0, nrow(df)), c("Thu", "Fri", "Sat"))
  axis(2, at =  seq(0,6,by=2),  seq(0,6,by=2))
  box()

  ## Plot on pad 2 (top right)
  plottitle<- "Voltage"
  plot(df$Voltage, type="s", ylab=plottitle, xlab="datetime", axes=FALSE)
  axis(1, at = c(0, nrow(df)/2.0, nrow(df)), c("Thu", "Fri", "Sat"))
  axis(2, at =  seq(234,246,by=4), seq(234,246,by=4))
  box()

  ## Plot on pad 3 (bottom left)
  plottitle<- "Energy sub metering"
  with(df, plot(Sub_metering_1, type="s", ylab=plottitle, xlab="", axes=FALSE))
  with(df, points(Sub_metering_2, col="red", type="s"))
  with(df, points(Sub_metering_3, col="blue", type="s"))
  axis(1, at = c(0, nrow(df)/2.0, nrow(df)), c("Thu", "Fri", "Sat"))
  axis(2, at =  seq(0,30,by=10),  seq(0,30,by=10))
  box()
  legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

  ## Plot on pad 4 (bottom right)
  plottitle<- "Global_reactive_power"
  plot(df$Global_reactive_power, type="s", ylab=plottitle, xlab="datetime", axes=FALSE)
  axis(1, at = c(0, nrow(df)/2.0, nrow(df)), c("Thu", "Fri", "Sat"))
  axis(2, at =  seq(0.0, 0.5, by=0.1), seq(0.0, 0.5, by=0.1))
  box()
  
  dev.off() ## turn the device off 


}



