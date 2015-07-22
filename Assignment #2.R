url <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
destination <- "repdata-data-StormData.csv.bz2"
download.file(url, destination)
dataset <- read.csv("repdata-data-StormData.csv.bz2", sep = ",", header = TRUE)

## Load relavent libraries
library(plyr)
library(ggplot2)

## Cut out all useless data, we don't need observations that are entirely 0 because they have no impact on population healh and/or economy
dataset <- subset(dataset, FATALITIES != 0 | INJURIES != 0 | PROPDMG != 0 | CROPDMG != 0)
## Since we're studying "acorss the US" we're going to eliminate all location data. In addition, in order to addres the research questions in the strictest sense, all time data is removed as well. However, the frequency of certain weather events over time should be considere in following research. 
dataset <- dataset[,c("EVTYPE", "FATALITIES", "INJURIES", "PROPDMG", "PROPDMGEXP", "CROPDMG", "CROPDMGEXP")]

## Create a population health variable
dataset$POPDMG <- dataset$INJURIES + dataset$FATALITIES

## Normalize economic cost variable first by removing all observations that contain non-standard symbols. Then all observations are capitalized, this is so observations that are both lower and uppercase are treated the same. Next, observations H, K, M and B are recoded to numbers in order to standardize the economic damanage incurred by each event. 
dataset <- dataset[!(dataset$PROPDMGEXP %in% c("-", "+", "?", "0", "2", "3", "4", "5", "6", "7", "8")),]
dataset <- dataset[!(dataset$CROPDMGEXP %in% c("?", "0")),]
dataset$PROPDMGEXP <- toupper(dataset$PROPDMGEXP)
dataset$CROPDMGEXP <- toupper(dataset$CROPDMGEXP)
dataset$PROPDMGEXP[dataset$PROPDMGEXP == "H"] <- 100 
dataset$PROPDMGEXP[dataset$PROPDMGEXP == "K"] <- 1000
dataset$PROPDMGEXP[dataset$PROPDMGEXP == "M"] <- 1000000
dataset$PROPDMGEXP[dataset$PROPDMGEXP == "B"] <- 1000000000
dataset$CROPDMGEXP[dataset$CROPDMGEXP == "H"] <- 100 
dataset$CROPDMGEXP[dataset$CROPDMGEXP == "K"] <- 1000
dataset$CROPDMGEXP[dataset$CROPDMGEXP == "M"] <- 1000000
dataset$CROPDMGEXP[dataset$CROPDMGEXP == "B"] <- 1000000000
dataset$PROPDMGEXP <- sub("^$", 0, dataset$PROPDMGEXP)
dataset$CROPDMGEXP <- sub("^$", 0, dataset$CROPDMGEXP)
dataset$ECODMG <- (dataset$PROPDMG*as.numeric(dataset$PROPDMGEXP)) + (dataset$CROPDMG*as.numeric(dataset$CROPDMGEXP))

## There is considerable duplication in the EVTYPE variable, this is somewhat allivated by capitalizing all EVTYPE observations
dataset$EVTYPE <- toupper(dataset$EVTYPE)


dataset_pop <- ddply(dataset, "EVTYPE", summarize, POPDMG_sum = sum(POPDMG))
dataset_pop <- subset(dataset_pop, POPDMG_sum != 0)
qplot(x = EVTYPE, y = POPDMG_sum, data = dataset_pop, geom = 'bar', stat = "identity")


dataset_econ <- ddply(dataset, "EVTYPE", summarize, ECODMG_sum = sum(ECODMG))
dataset_econ <- subset(dataset_econ, ECODMG_sum != 0)
qplot(x = EVTYPE, y = ECODMG_sum, data = dataset_econ, geom = 'bar', stat = "identity")



dataset_test <- subset(dataset_test, FATALITIES != 0 | INJURIES != 0 | PROPDMG != 0 | CROPDMG != 0)
dataset_test <- dataset_test[grep("\\/", EVTYPE),] 
dataset_test <- dataset_test[grepl("summary", EVTYPE, ignore.case = TRUE),] 
dataset_test <- dataset_test[!grepl('[:digit:]', EVTYPE),] 
dataset_test <- dataset_test[!grepl('[:punct:]', EVTYPE),] 

## Standardize EVTYPE variable
EVTYPE <- toupper(dataset$EVTYPE) ## All to uppercase
events <- gsub("[0-9]", "", events) ## Remove numbers
events_freq <- cbind(table(as.character(events)))                         
dataset_test <-  dataset_test[-grep("/", dataset$EVTYPE, ignore.case = TRUE),]


The plan

1) Finish answering the questions
2) write and publish report
3) Read through report to ensure every decision is properly explained
4) Clean EVTYPE variable for better accuracy 



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

http://www.gnu.org/software/grep/manual/html_node/Character-Classes-and-Bracket-Expressions.html
