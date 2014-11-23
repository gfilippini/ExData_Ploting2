
## 5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

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

## substing NEI data for Baltimore City
NEI.BC <- NEI[NEI$fips==24510,]

## merging information
NEI.SCC.vehicBC <- merge(NEI.BC,SCC.vehic,by="SCC")


## creates emissions base for plot
vehic.emissions <-aggregate(NEI.SCC.vehicBC$Emissions,list(NEI.SCC.vehicBC$year),FUN="sum")

## options to take off scientifc notation for high values
options (scipen=999)

## original parameters
opar<-par()
par(cex.main = 0.5,cex.lab=1)
## plot 5
png("./ExData_Ploting2/figures/plot5.png",width=480, height=480,units="px")
plot(vehic.emissions,type='l',xlab="Year",ylab=expression('Total PM'[2.5]*" Emission"),
     main="Motor vehicle related sources in Baltimore City from 1999 to 2008
      \nexcluding aircrafts, marine vessels, locomotives and non-road")
dev.off()

## restore original parameters
par(opar)