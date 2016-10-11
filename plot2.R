plot2<-function(){
  ## draws Time Series of Active Power
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
  png("plot2.png", width=6, height=6, units="in", res=480)
  
  plot(dt2$Time, dt2$Active, xlab= "", ylab="Global Active Power (kilowatts)", main = " Plot2: Time - series.", type = "l")
  
  dev.off()
}