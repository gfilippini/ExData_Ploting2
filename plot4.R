
## 4. Across the United States, how have emissions from coal combustion-related sources
## changed from 1999–2008?

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

## subseting SCC data for Coal emissions
SCC.coal <- SCC[grep("Coal",SCC$EI.Sector)]

## bringing Category information
NEI.SCC <- merge(NEI,SCC.coal,by="SCC")

## creates emissions base for plot
coal.emissions <-aggregate(NEI.SCC$Emissions,list(NEI.SCC$year),FUN="sum")

## options to take off scientifc notation for high values
options (scipen=999)

## plot 4
png("./ExData_Ploting2/figures/plot4.png",width=480, height=480)
plot(coal.emissions,type='l',xlab="Year",ylab=expression('Total PM'[2.5]*" Emission"),
     main=expression('Coal Combustion related sources PM'[2.5]*" emission - years 1999 - 2008"))
dev.off()