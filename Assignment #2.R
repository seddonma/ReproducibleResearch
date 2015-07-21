url <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
destination <- "repdata-data-StormData.csv.bz2"
download.file(url, destination)
dataset <- read.csv("repdata-data-StormData.csv.bz2", sep = ",", header = TRUE)

## Since we're studying "accorss the US" we're going to eliminate all location data. In addition, in order to addres the research questions in the strictest sense, all time data is removed as well. However, the frequency of certain weather events over time should be considere in following research. 
dataset_pop <- dataset[,c("EVTYPE", "FATALITIES", "INJURIES")]
dataset_econ <- dataset[,c("EVTYPE", "PROPDMG", "PROPDMGEXP", "CROPDMG", "CROPDMGEXP")]



The plan

1) clean EVTYPE variable
  Remove everything that's not an event
2) Create new variable to summarize EVTYPE
  summarize event using coding, explain why you're summarizing.
3) summmzarize econ variable through multiplication
4) combine injury and fatality variable to new variable, chart all three though
5) run analysis
    Make some bar graphs
6) ...
7) PROFIT


http://www.nws.noaa.gov/wsom/manual/archives/NF429405.HTML 
https://rstudio-pubs-static.s3.amazonaws.com/66795_4a9bc7395ee040f5a4c17ed4a0523f42.html
http://rstudio-pubs-static.s3.amazonaws.com/13862_7c245f564aa04c438e482ab3565753be.html 
