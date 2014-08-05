plot4 <- function(){
  
  #load library 
  
  power <- read.csv('household_power_consumption.txt',sep=";",header=FALSE,nrows=2880 , skip=66636)
  powerhead <-read.csv('household_power_consumption.txt',sep=';',header=TRUE,nrows=0)
  names(power) <- names(powerhead)
  
  #defining datetime variable
  datetime <- strptime(paste(as.Date(power$Date,format="%d/%m/%Y"), as.character(power$Time), sep=" "),format="%Y-%m-%d %H:%M:%S")

  
  #making plots
  png('plot4.png', width=480, height=480, units='px',pointsize=12)

  
  #defined 2x2 plot grid
  par(mfrow=c(2,2))
  
  
  # upper left plot
  ytl <- as.numeric(as.character(power$Global_active_power))
  
  plot(datetime,ytl,ylab="Global Active Power",type='l', xlab="")

  # upper right plot
  
  ytr <- power$Voltage
  
  plot(datetime,ytr, ylab="Voltage", type='l')
  
  #bottom left plot
  
  y1 <- power$Sub_metering_1
  y2 <- power$Sub_metering_2
  y3 <- power$Sub_metering_3
  
  y.txt <- names(power)[7:9]
  y.col <- c("black", 'red', 'blue')
  
  
  plot(datetime,y1,type='l',col="Black", ylim=c(0,40),ylab='Energy sub metering', xlab="")
  par(new=T)
  plot(datetime,y2,type='l',col="red", ylim=c(0,40), ylab="", xlab="")
  par(new=T)
  plot(datetime,y3,type='l',col="blue", ylim=c(0,40), ylab="", xlab="")
  legend("topright", y.txt, col=y.col, lty=1,bty='n')
  
  #bottom right plot
  

  ybr <- power$Global_reactive_power
  
  plot(datetime, ybr, type='l')
  
  #plotting complete  
  dev.off()
  
  return(print('See working directory for plot4.'))
  
  
}