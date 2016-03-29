# ANALYSE TENDERNED DATA

library(dplyr)
library(reshape2)
library(knitr)
library(gdata)

# data-opslag
if (!file.exists("data")) { dir.create("data")}

# TenderNed data
location <- "http://www.tenderned.nl/sites/default/files//OpenData_TenderNed_2010-2015.xlsx"
fileXLSX <- "./data/OpenData_TenderNed_2010-2015.xlsx"
fileCSV  <- "./data/OpenData_TenderNed_2010-2015.csv"

if(!file.exists(fileXLSX)) {
        download.file(location, fileXLSX, mode="wb")
} 

# handmatig te converteren naar CSV
break()

# inladen
tenderned <- read.csv2(fileCSV)

View(
        tenderned %>%
                group_by(AD.officiele.benaming, Type.opdracht) %>%
                summarize(n = n()) %>%
                arrange(desc(n))
)

View(
        tenderned %>%
                group_by(Soort.aanbestedende.dienst, Type.opdracht) %>%
                summarize(n = n())
)
