##read and plot 3

##clear env and load libraries
rm(list=ls())
library(dplyr)
library(data.table)

##set dir to downloaded files
setwd("C:/Users/aliza.shoop/Projects/DataScientistsToolbox/plot")

#read and load file
hpctxt<-file("household_power_consumption.txt")
hpc<-read.table(text = grep("^[1,2]/2/2007",readLines(hpctxt),value=TRUE), sep = ';', col.names=c("Date","Time","GActivePower","GReactivePower","Voltage","Intensity","Submetering1","Submetering2","Submetering3"))
hpc$Date <- as.Date(hpc$Date, format = '%d/%m/%Y')
hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time))

#create plot3.png
#set device and parameters
png(filename = 'plot3.png', width = 480, height = 480, units='px')
#create line graph
with(hpc,plot(DateTime,Submetering1,ylab="Energy sub metering",xlab="", type="l"))
#add 2nd line
lines(hpc$DateTime, hpc$Submetering2, col="red")
#add 3rd line
lines(hpc$DateTime, hpc$Submetering3, col="blue")
#create legend
legend("topright", legend= c("Sub metering 1", "Sub metering 2", "Sub metering 3"), col= c("black", "red", "blue"), lwd = 1)
#close device
dev.off()

