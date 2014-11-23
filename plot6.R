
## 6. Compare emissions from motor vehicle sources in Baltimore City with emissions
## from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?


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


## subseting SCC data for vehicles emissions - aircrafts, Marine Vessels, Locomotives and
## non-road equipment were not considered
SCC.vehic <- SCC[grep("Vehicles",SCC$EI.Sector), ]

## substing NEI data for Baltimore City and Los Angeles
NEI.BCLA <- NEI[NEI$fips == "24510" | NEI$fips == "06037",]

## merging information
NEI.SCC <- merge(NEI.BCLA,SCC.vehic,by="SCC")

## options to take off scientifc notation for high values
options (scipen=999)

## plot 6
png("./ExData_Ploting2/figures/plot6.png",width=480, height=480,units="px")
graph <- ggplot(NEI.SCC,aes(year,Emissions,color=fips))
graph + geom_line(stat="summary", fun.y="sum") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Comparison of vehicle emissions in Baltimore City and  \nLos Angeles from 1999 to 2008") +
  scale_colour_discrete(name="Group",label=c("Los Angeles","Baltimore"))      
dev.off()
          


