
electrical_data <- read.csv("household_power_consumption.txt",sep=';',stringsAsFactors=FALSE)
print(head(electrical_data))
electrical_data$date<-as.Date(electrical_data$Date,format="%d/%m/%Y")


data<-electrical_data[electrical_data$Date %in% c("1/2/2007","2/2/2007"),]


data$Global_active_power<-as.numeric(data$Global_active_power)



date_plus_time <- strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
data$date_plus_time<-as.POSIXct(date_plus_time)

png("plot2.png", width=480, height=480)
plot(data$Global_active_power~data$date_plus_time,type="l", ylab="Global Active Power (kilowatts)",xlab="")
dev.off()


