
electrical_data <- read.csv("household_power_consumption.txt",sep=';',stringsAsFactors=FALSE)
print(head(electrical_data))
electrical_data$date<-as.Date(electrical_data$Date,format="%d/%m/%Y")


data<-electrical_data[electrical_data$Date %in% c("1/2/2007","2/2/2007"),]
data$Global_active_power<-as.numeric(data$Global_active_power)



date_plus_time <- strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
data$date_plus_time<-as.POSIXct(date_plus_time)

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(data$Global_active_power~data$date_plus_time,type="l", ylab="Global Active Power (kilowatts)",xlab="")
plot(data$Voltage~data$date_plus_time,type="l", ylab="Voltage",xlab="datetime")
plot(data$Sub_metering_1~data$date_plus_time,type="l", ylab="Energy sub metering",xlab="")
lines(data$Sub_metering_2~data$date_plus_time,col='Red')
lines(data$Sub_metering_3~data$date_plus_time,col='Blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"),lty=1,lwd=2)
plot(data$Global_reactive_power~data$date_plus_time,type="l", ylab="Global reactive power",xlab="datetime")
dev.off()

