

## This part of the script is for every code ##

## download and unzip data ##

if(!file.exists("./data")){dir.create("./data")}
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
if(!file.exists("./data/EPA_data.zip")){
  download.file(fileURL,destfile="./data/EPA_data.zip",method="wget")
}
unzip("./data/EPA_data.zip",exdir="./data")
