##plot3
setwd("E:/documents/IT tutorial/data science/4. exploratory data analysis/R")
power<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,na.strings = "?")
powerdate<-subset(power,as.Date(strptime(Date,"%d/%m/%Y"))=="2007-02-01"|as.Date(strptime(Date,"%d/%m/%Y"))=="2007-02-02")

powerdate$DateTime<-paste(powerdate$Date,powerdate$Time,sep=" ")
powerdate2<-transform(powerdate,
				DateTime=strptime(DateTime,"%d/%m/%Y %H:%M:%S"),
				Global_active_power=as.numeric(Global_active_power),
				Global_reactive_power=as.numeric(Global_reactive_power),
				Voltage=as.numeric(Voltage),
				Global_intensity=as.numeric(Global_intensity),
				Sub_metering_1=as.numeric(Sub_metering_1),
				Sub_metering_2=as.numeric(Sub_metering_2),
				Sub_metering_3=as.numeric(Sub_metering_3))

png("plot3.png",width=480,height=480)
plot(powerdate2$DateTime,powerdate2$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(powerdate2$DateTime,powerdate2$Sub_metering_2,col="red")
lines(powerdate2$DateTime,powerdate2$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()