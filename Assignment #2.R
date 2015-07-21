url <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
destination <- "repdata-data-StormData.csv.bz2"
download.file(url, destination)
dataset <- read.csv("repdata-data-StormData.csv.bz2", sep = ",", header = TRUE)

## Since we're studying "accorss the US" we're going to eliminate all location data. In addition, in order to addres the research questions in the strictest sense, all time data is removed as well. However, the frequency of certain weather events over time should be considere in following research. 
dataset_pop <- dataset[,c("EVTYPE", "FATALITIES", "INJURIES")]
dataset_econ <- dataset[,c("EVTYPE", "PROPDMG", "PROPDMGEXP", "CROPDMG", "CROPDMGEXP")]

url <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
destination <- "repdata-data-StormData.csv.bz2"
download.file(url, destination)
dataset <- read.csv("repdata-data-StormData.csv.bz2", sep = ",", header = TRUE)

## Cut out all useless data, we don't need observations that are entirely 0 because they have no impact on population healh and/or economy
dataset <- subset(dataset, FATALITIES != 0 | INJURIES != 0 | PROPDMG != 0 | CROPDMG != 0)
## Since we're studying "acorss the US" we're going to eliminate all location data. In addition, in order to addres the research questions in the strictest sense, all time data is removed as well. However, the frequency of certain weather events over time should be considere in following research. 
dataset <- dataset[,c("EVTYPE", "FATALITIES", "INJURIES", "PROPDMG", "PROPDMGEXP", "CROPDMG", "CROPDMGEXP")]

dataset_test <- dataset_test[grep("/", EVTYPE, ignore.case = TRUE, invert = TRUE),] 
dataset_test <- dataset_test[grep("summary", EVTYPE, ignore.case = TRUE, invert = TRUE),] 
dataset_test <- dataset_test[grep("[0-9]", EVTYPE, ignore.case = TRUE, invert = TRUE),] 


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

http://www.gnu.org/software/grep/manual/html_node/Character-Classes-and-Bracket-Expressions.html
