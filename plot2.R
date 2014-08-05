plot2 <- function(){

  #load library 
  
  power <- read.csv('household_power_consumption.txt',sep=";",header=FALSE,nrows=2880 , skip=66636)
  powerhead <-read.csv('household_power_consumption.txt',sep=';',header=TRUE,nrows=0)
  names(power) <- names(powerhead)

  # define ploting variables  
  x <- strptime(paste(as.Date(power$Date,format="%d/%m/%Y"), as.character(power$Time), sep=" "),format="%Y-%m-%d %H:%M:%S")
  #reads in the date in to a more common format then concatinates with Time
  y <- as.numeric(as.character(power$Global_active_power))
  
  
  png('plot2.png', width=480, height=480, units='px',pointsize=12)
  plot(x,ysmo,ylab="Global Active Power (kilowatts)",type='l', xlab="")
  dev.off()
  
  
  return(print('See working directory for plot2.'))
  

}