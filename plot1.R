

## 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from 
## all sources for each of the years 1999, 2002, 2005, and 2008

## creating figures directory
if(!file.exists("./ExData_Ploting2/figures")){dir.create("./ExData_Ploting2/figures")}

## reading data
## This first line will likely take a few seconds. Be patient!
if (!"NEI" %in% ls()) {
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"SCC" %in% ls()) {
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

## creates total emissions base for plot
totalemissions<-aggregate(NEI$Emissions,list(NEI$year),FUN="sum")

## options to take off scientifc notation for high values
options (scipen=999)

## plot 1
png("./ExData_Ploting2/figures/plot1.png",width=480, height=480)
plot(totalemissions,type='l',xlab="Year",ylab=expression('Total PM'[2.5]*" Emission"),
     main=expression('PM'[2.5]*" emission over the years 1999 - 2008"))
dev.off()
