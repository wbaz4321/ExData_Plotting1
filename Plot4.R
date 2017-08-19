
## load in dataset
df<-read.csv("./power consumption.txt",head=T,sep=";")
library(dplyr)

## process the original dataset
df$Global_active_power<-as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power<-as.numeric(as.character(df$Global_reactive_power))
df$Voltage<-as.numeric(as.character(df$Voltage))
df$Global_intensity<-as.numeric(as.character(df$Global_intensity))
df$Sub_metering_1<-as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2<-as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3<-as.numeric(as.character(df$Sub_metering_3))

df$Date<-as.character(df$Date)
df$Date<-as.Date(df$Date,"%d/%m/%Y")

## get the sub data frame
sub_df <- subset(df,Date=="2007-02-01" | Date=="2007-02-02")

sub_df$Date<-as.character(sub_df$Date)
sub_df$Time<-as.character(sub_df$Time)

new<-paste(sub_df$Date,sub_df$Time)
time_date<-strptime(new,"%Y-%m-%d %H:%M:%S")
sub_df<-cbind(sub_df,time_date)
## end of pre-processing

png("./Plot4.png",width=480,height=480)

par(mfrow=c(2,2))
with(sub_df,{
	plot(time_date,Global_active_power,type="l",xlab="")
	plot(time_date,Voltage,type="l",xlab="datetime")
	plot(sub_df$time_date,sub_df$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
	lines(time_date,Sub_metering_2, col="red")
	lines(time_date,Sub_metering_3, col="blue")
	legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=1)
	plot(time_date,Global_reactive_power,type="l",xlab="datetime")
})

dev.off()