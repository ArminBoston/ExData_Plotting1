hh<-read.table("household_power_consumption.txt", sep=";", header=T)
hh$DateTime<-paste(as.character(hh$Date), as.character(hh$Time))
hh$DateTime<-strptime(hh$DateTime, "%d/%m/%Y %H:%M:%S")
hh$Date<-as.Date(as.character(hh$Date), "%d/%m/%Y")
hh$Global_active_power<-as.numeric(as.character(hh$Global_active_power))
hh$Sub_metering_1<-as.numeric(as.character(hh$Sub_metering_1))
hh$Sub_metering_2<-as.numeric(as.character(hh$Sub_metering_2))
hh$Sub_metering_3<-as.numeric(as.character(hh$Sub_metering_3))
hh$Global_reactive_power<-as.numeric(as.character(hh$Global_reactive_power))
hh$Voltage<-as.numeric(as.character(hh$Voltage))

hh2007feb<-subset(hh, Date %in% as.Date(c("2007-02-01", "2007-02-02")))

png("plot4.png")
par(mfcol=c(2,2), cex=0.7)
with(hh2007feb, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

with(hh2007feb, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(hh2007feb, lines(DateTime, Sub_metering_2, col="red"))
with(hh2007feb, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), bty="n", cex=1)

with(hh2007feb, plot(DateTime, Voltage, type="l", xlab="datatime", ylab="Voltage"))
with(hh2007feb, plot(DateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()

