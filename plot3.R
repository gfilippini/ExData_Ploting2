
## 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
## variable, which of these four sources have seen decreases in emissions from 1999–2008 
## for Baltimore City? Which have seen increases in emissions from 1999–2008? 
## Use the ggplot2 plotting system to make a plot answer this question.


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

## substing data with Baltimore City information
BC.info <- NEI[NEI$fips==24510,]

## load ggplot2 library
library(ggplot2)

## options to take off scientifc notation for high values
options (scipen=999)

## plot 3
png("./ExData_Ploting2/figures/plot3.png",width=480, height=480)
graph <- ggplot(BC.info,aes(year,Emissions,color=type))
graph + geom_line(stat="summary", fun.y="sum") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle(expression('Emissions of PM'[2.5]*" in Baltimore City from 1999 to 2008 by type"))
dev.off()


