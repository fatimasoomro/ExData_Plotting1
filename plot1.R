## code to plot the Global active power variable for the 1st and 2nd of February 2007
## assumes that the working directory contains the default file name. If different, specify as an argument to the function

plot1<- function(myfile=""){

  filename <- "household_power_consumption.txt"
  if(myfile!="") filename<- myfile
  
  ## read data file 
  df<- read.table(filename, header= TRUE, sep=";", as.is=TRUE, na.strings= c("NA", "?"))

  ## subset it: keep only the relevant rows, i.e. corresponding to 1 and 2 Feb 2007
  df <- subset( df, year(dmy(df$Date)) == 2007 & month(dmy(df$Date)) == 02 & ( day(dmy(df$Date)) == 01 | day(dmy(df$Date)) == 02 ) )

  ## open png devide to draw the plot onto 
  png("plot1.png")
  
  plottitle<- "Global Active Power"
  hist(df$Global_active_power, xlab=paste(plottitle, " (kilowatts)", sep=""), main=plottitle, col="red")
  dev.off() ## turn the device off 


}
