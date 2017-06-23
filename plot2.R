##read and plot 2

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

#create plot2.png
#set device and parameters
png(filename = 'plot2.png', width = 480, height = 480, units='px')
#create line graph
with(hpc,plot(DateTime,GActivePower,main="Global Active Power",ylab="Global Active Power (kilowatts)",xlab="", type="l"))
#close device
dev.off()

