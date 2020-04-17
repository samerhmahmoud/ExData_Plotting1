## for this assigment the data set :  Electric power consumption is on the 
## the linke below
## the data should be downloaded and unzipped to the working dirrectory
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip


library(lubridate)
library(readr)


## filname in the working directory 
fl<-"household_power_consumption.txt"
## read ; delimted data 

mdata<-read_delim(fl, delim=";")

## convert the Date variable into date 
mdata<-mutate(mdata,Date=parse_date(Date,"%d/%m/%Y"))

# days for whcih data is wanted
da1<-ymd("2007-02-01")
da2<- ymd("2007-02-02")

## filter the data and assign the data into sld
sld<-filter(mdata,Date >= da1 & Date <= da2) 

## construct plot 

## First plot 
png(file = "Plot1.png", bg = "transparent",
    width = 480, height = 480, units = "px", pointsize = 12)
hist(sld$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab = "Global Active Power (killowatts)" )
dev.off()
