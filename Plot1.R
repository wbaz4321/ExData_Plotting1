
## read the data
df<-read.csv("./power consumption.txt",head=T,sep=";")
library(dplyr)

## adjust the variable classes
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
p1<-sub_df$Global_active_power

png("Plot1.png",width=480,height=480)
hist(p1,col="red",xlab="Global Active Power(kilwatts)",ylab="Frequency", main="Global Active Power")
dev.off()