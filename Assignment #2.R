url <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
destination <- "repdata-data-StormData.csv.bz2"
download.file(url, destination)
dataset <- read.csv("repdata-data-StormData.csv.bz2", sep = ",", header = TRUE)

The plan

1) clean EVTYPE variable
2) Create new variable to summarize EVTYPE
3) Check if othetr two variables need to be summarized
4) run analysis
5)...
6) PROFIT
