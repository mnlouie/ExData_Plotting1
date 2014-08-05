plot3 <- function(){
  
  #load library 
  power <- read.csv('household_power_consumption.txt',sep=";",header=FALSE,nrows=2880 , skip=66636)
  powerhead <-read.csv('household_power_consumption.txt',sep=';',header=TRUE,nrows=0)
  names(power) <- names(powerhead)

  # defined the plotting variables  
  x <- strptime(paste(as.Date(power$Date,format="%d/%m/%Y"), as.character(power$Time), sep=" "),format="%Y-%m-%d %H:%M:%S")
  y1 <- power$Sub_metering_1
  y2 <- power$Sub_metering_2
  y3 <- power$Sub_metering_3
  
  y.txt <- names(power)[7:9]
  y.col <- c("black", 'red', 'blue')
  

  
  
  #plotting 
  png('plot3.png', width=480, height=480, units='px',pointsize=12)

  plot(x,y1,type='l',col="Black", ylim=c(0,40),ylab='Energy sub metering', xlab="")
  par(new=T)
  plot(x,y2,type='l',col="red", ylim=c(0,40), ylab="", xlab="")
  par(new=T)
  plot(x,y3,type='l',col="blue", ylim=c(0,40), ylab="", xlab="")
  legend("topright", y.txt, col=y.col, lty=1)
  
  dev.off()
  
  
  return(print('See working directory for plot3.'))
  
  
}