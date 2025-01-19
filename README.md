The following instructions enable to follow the code along and to reuse it.
The files are supposed to be run in order from TS_01 to TS_06.
The following packages are requiered and should be loaded before: 
packages <- c("dplyr", "tidyverse", "quanteda", "httr", "jsonlite", "lubridate", 
              "rvest", "xml2", "tibble", "magrittr", "stm", "keyATM")
lapply(packages, library, character.only = TRUE)

01. Instructions for Webscraping the Tagesschau Foreign Archive
To webscrape the Tagesschau Foreign Archive within a specified time range, use the file TS_01_API.rmd.
Note that the process involves a mandatory manual adjustment depending on the execution date of the API.
Tagesschau permits webscraping of all articles published within the last year from the current date. For the purposes of this study, the applicable time range spans from January 11, 2024, to January 11, 2025. 
If the API is executed at a later date, the date parameters in the code must be updated accordingly. Be aware that modifying these parameters will alter the resulting output dataframe.
To reproduce the results presented in this study, it is essential to use the dataframe TS_ALL_Foreign_RAW_1001.csv.

02. Instructions for Acquiring Google Trends Data
The Google Trends data utilized in this study can be accessed and reproduced at any time via Google Trends.
To replicate the data used in this analysis, specify both the search term and the time range. For this study, the time range is January 11, 2024, to January 11, 2025.
The search terms applied are documented in the file TS_02_GoogleTrends.R.
