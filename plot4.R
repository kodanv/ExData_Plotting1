plot4<-function(){
  ## draws Four Plots
  file_name<- "household_power_consumption.txt"
  dat<-read.table(file_name, sep = ";")
  colnames(dat)<-c("Date", "Time", "Active", "Reactive","Voltage", "Intensity", "Meter1", "Meter2", "Meter3")
  
  dat$Active<-as.numeric(as.character(dat$Active))
  dat$Reactive<-as.numeric(as.character(dat$Reactive))
  dat$Voltage<-as.numeric(as.character(dat$Voltage))
  dat$Intensity<-as.numeric(as.character(dat$Intensity))
  dat$Meter1<-as.numeric(as.character(dat$Meter1))
  dat$Meter2<-as.numeric(as.character(dat$Meter2))
  dat$Meter3<-as.numeric(as.character(dat$Meter3))
  
  
  dat<-dat[-1,]
  
  dat$Date<-as.Date(dat$Date, format = "%d/%m/%Y")
  
  dat3<-subset(dat, dat$Date=="2007-02-01")
  dat4<-subset(dat, dat$Date=="2007-02-02") 
  dt2<-rbind(dat3, dat4)
  
  dt2$Time<-as.POSIXct(paste(dt2$Date, dt2$Time))
  
  png("plot4.png", width=8, height=8, units="in", res=480)
  par(mfrow = c(2,2))
    
  plot(dt2$Time, dt2$Active, xlab= "", ylab="Global Active Power (kilowatts)", type = "l")
  plot(dt2$Time, dt2$Voltage, xlab= "datetime", ylab="Voltage", type = "l")
  
  plot(dt2$Time, dt2$Meter1, xlab= "", ylab="Energy sub metering", type = "l")
  lines(dt2$Time, dt2$Meter2,col="red")
  lines(dt2$Time, dt2$Meter3,col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1),lwd=c(2,2), col = c("black", "red", "blue"), bg = "grey96")
  
  plot(dt2$Time, dt2$Reactive, xlab= "datetime", ylab="Global Reactive Power", type = "l")
  
  
  dev.off()
}