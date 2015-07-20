---
title: 'Reproducible Research - Assignment #2'
author: "seddonma"
date: "July 20, 2015"
output: html_document
---

# Title 

Your document should have a title that briefly summarizes your data analysis

## Synopsis 

Immediately after the title, there should be a synopsis which describes and summarizes your analysis in at most 10 complete sentences.

## Data Processing    
    
Describes (in words and code) how the data were loaded into R and processed for analysis. In particular, your analysis must start from the raw CSV file containing the data. You cannot do any preprocessing outside the document. If preprocessing is time-consuming you may consider using the cache = TRUE option for certain code chunks.

## Results

There should be a section titled Results in which your results are presented.


The analysis document must have at least one figure containing a plot.Your analyis must have no more than three figures. Figures may have multiple plots in them (i.e. panel plots), but there cannot be more than three figures total.

You must show all your code for the work in your analysis document. This may make the document a bit verbose, but that is okay. In general, you should ensure that echo = TRUE for every code chunk (this is the default setting in knitr).


```{r}
summary(cars)
```

