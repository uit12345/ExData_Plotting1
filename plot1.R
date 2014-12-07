
electrical_data <- read.csv("household_power_consumption.txt",sep=';',stringsAsFactors=FALSE)
print(head(electrical_data))
electrical_data$date<-as.Date(electrical_data$Date,format="%d/%m/%Y")


data<-electrical_data[electrical_data$Date %in% c("1/2/2007","2/2/2007"),]


data$Global_active_power<-as.numeric(data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()


