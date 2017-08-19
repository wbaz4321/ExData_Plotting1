
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
## end of processing the dataset

## print the plot and explor it into the working directory
png("Plot2.png",width=480,height=480)
with(sub_df,plot(time_date,Global_active_power,type="l",xlab=""))
dev.off()