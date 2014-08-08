## code to plot the energy sub metering variable as a function of time, for the 1st and 2nd of February 2007
## assumes that the working directory contains the default file name. If different, specify as an argument to the function

plot3<- function(myfile=""){

  filename <- "household_power_consumption.txt"
  if(myfile!="") filename<- myfile
  
  ## read data file 
  df<- read.table(filename, header= TRUE, sep=";", as.is=TRUE, na.strings= c("NA", "?"))

  ## subset it: keep only the relevant rows, i.e. corresponding to 1 and 2 Feb 2007
  df <- subset( df, year(dmy(df$Date)) == 2007 & month(dmy(df$Date)) == 02 & ( day(dmy(df$Date)) == 01 | day(dmy(df$Date)) == 02 ) )

  ## open png devide to draw the plot onto 
  png("plot3.png")
  
  plottitle<- "Energy sub metering"
  
  with(df, plot(Sub_metering_1, type="s", ylab=plottitle, xlab="", axes=FALSE))
  with(df, points(Sub_metering_2, col="red", type="s"))
  with(df, points(Sub_metering_3, col="blue", type="s"))
  axis(1, at = c(0, nrow(df)/2.0, nrow(df)), c("Thu", "Fri", "Sat"))
  axis(2, at =  seq(0,30,by=10),  seq(0,30,by=10))
  box()
  legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  
  dev.off() ## turn the device off 


}



