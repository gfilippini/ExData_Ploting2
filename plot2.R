
## 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.

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



## creates total emissions base for plot - includes the Baltimore City (fips == "24510") filter
totalemissions<-aggregate(NEI[NEI$fips=="24510",]$Emissions,list(NEI[NEI$fips=="24510",]$year),FUN="sum")

## options to take off scientifc notation for high values
options (scipen=999)

## plot 2
png("./ExData_Ploting2/figures/plot2.png",width=480, height=480)
plot(totalemissions,type='l',xlab="Year",ylab=expression('Total PM'[2.5]*" Emission"),
     main=expression('PM'[2.5]*" emission on Baltimore - years 1999 - 2008"))
dev.off()