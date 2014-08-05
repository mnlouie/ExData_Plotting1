plot1 <- function(){
  
  #load library 

  power <- read.csv('household_power_consumption.txt',sep=";",header=FALSE,nrows=2880 , skip=66636)
  powerhead <-read.csv('household_power_consumption.txt',sep=';',header=TRUE,nrows=0)
  names(power) <- names(powerhead)

  #set up plotting device
  
  png('plot1.png', width=480, height=480, units='px',pointsize=12)
  hist(as.numeric(as.character(power$Global_active_power)), main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency",breaks=16,xlim=c(0,8),col="red",xaxt="n")
  axis(1, at = seq(0,6, by =2)) # add axis labels
  dev.off()

  return(print('See working directory for plot1.'))


}