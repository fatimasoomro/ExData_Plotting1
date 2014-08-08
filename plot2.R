## code to plot the Global active power variable as a function of time, for the 1st and 2nd of February 2007
## assumes that the working directory contains the default file name. If different, specify as an argument to the function

plot2<- function(myfile=""){

  library(lubridate)
  filename <- "household_power_consumption.txt"
  if(myfile!="") filename<- myfile
  
  ## read data file 
  df<- read.table(filename, header= TRUE, sep=";", as.is=TRUE, na.strings= c("NA", "?"))

  ## subset it: keep only the relevant rows, i.e. corresponding to 1 and 2 Feb 2007
  df <- subset( df, year(dmy(df$Date)) == 2007 & month(dmy(df$Date)) == 02 & ( day(dmy(df$Date)) == 01 | day(dmy(df$Date)) == 02 ) )

  ## open png devide to draw the plot onto 
  png("plot2.png")
  
  plottitle<- "Global Active Power"
  #plot(df$Global_active_power, type="s", ylab=paste(plottitle, " (kilowatts)", sep=""), xlab="Thu    Fri    Sat", xaxp=c(0,2900,2))

  plot(df$Global_active_power, type="s", ylab=paste(plottitle, " (kilowatts)", sep=""), xlab="", axes=FALSE)
  axis(1, at = c(0, nrow(df)/2.0, nrow(df)), c("Thu", "Fri", "Sat"))
  axis(2, at =  seq(0,6,by=2),  seq(0,6,by=2))
  box()

  dev.off() ## turn the device off 


}



