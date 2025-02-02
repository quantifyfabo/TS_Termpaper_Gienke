# Before running the code, load all packages from "TS_03_DataPreperation"!
# the code below uses data from Google Trends. Search terms were selected based on resulting topics from stm in "TS_04_TopicModels"
# Topics: "USA" , "Middle East", "Ukraine"


# US

# data preperation for the Google Trends data for the topic "USA"
# load csv files of GT search terms "USA", "Trump", "Biden", "Harris" in the time frame 11.01.2024 to 11.01.2025
gt_usa_raw <- read.csv("C:/Datasets/tagesschau_folder/GT/GT_USA_1101.csv", header = FALSE)
gt_trump_raw <- read.csv("C:/Datasets/tagesschau_folder/GT/GT_Trump_1101.csv", header = FALSE)
gt_biden_raw <- read.csv("C:/Datasets/tagesschau_folder/GT/GT_Biden_1101.csv", header = FALSE)
gt_harris_raw <- read.csv("C:/Datasets/tagesschau_folder/GT/GT_Harris_1101.csv", header = FALSE)

# Merge GT_raw csv files to one dataset based on week variable, rename variables, delete last 2 rows.
gt_us <- Reduce(function(x, y) merge(x,y, by = "V1", all = T), list(gt_usa_raw, gt_trump_raw, gt_biden_raw, gt_harris_raw))
colnames(gt_us) <- c("dateGT", "USA_ScoreGT", "Trump_ScoreGT", "Biden_ScoreGT", "Harris_ScoreGT")
gt_us <- head(gt_us, -2)

# Format the date and create $week variable
gt_us$dateGT <- as.Date(gt_us$dateGT)
gt_us$dateGT <- gt_us$dateGT + 3  # +3 days to cover right week (important to switch year to 2025 after week 52)
gt_us$week <- isoweek(gt_us$dateGT)

# Make $week continue in 2025 to prevent duplicates
gt_us$week <- ifelse(
  format(gt_us$dateGT, "%Y") == "2025", 
  as.numeric(gt_us$week) + 52 ,  # +52 weeks when year==2025
  as.numeric(gt_us$week))        

#make all variables except $dateGT to numeric 
us_numvars <- c("USA_ScoreGT", "Trump_ScoreGT", "Biden_ScoreGT", "Harris_ScoreGT")
gt_us[us_numvars] <- lapply(gt_us[us_numvars], as.numeric)





# Middle East

# data preperation for the Google Trends data for the topic "Middle East"
# load csv files of GT search terms "Israel", "Hamas", "Iran", "Gaza" in the time frame 11.01.2024 to 11.01.2025
gt_israel_raw <- read.csv("C:/Datasets/tagesschau_folder/GT/GT_Israel_1101.csv", header = FALSE)
gt_hamas_raw <- read.csv("C:/Datasets/tagesschau_folder/GT/GT_Hamas_1101.csv", header = FALSE)
gt_iran_raw <- read.csv("C:/Datasets/tagesschau_folder/GT/GT_Iran_1101.csv", header = FALSE)
gt_gaza_raw <- read.csv("C:/Datasets/tagesschau_folder/GT/GT_Gaza_1101.csv", header = FALSE)

# Merge GT_raw csv files to one dataset based on week variable, rename variables, delete last 2 rows.
gt_mideast <- Reduce(function(x, y) merge(x,y, by = "V1", all = T), list(gt_israel_raw, gt_hamas_raw, gt_iran_raw, gt_gaza_raw))
colnames(gt_mideast) <- c("dateGT", "Israel_ScoreGT", "Hamas_ScoreGT", "Iran_ScoreGT", "Gaza_ScoreGT")
gt_mideast <- head(gt_mideast, -2)

# Format the date and create $week variable
gt_mideast$dateGT <- as.Date(gt_mideast$dateGT)
gt_mideast$dateGT <- gt_mideast$dateGT + 3  # +3 days to cover right week (important to switch year to 2025 after week 52)
gt_mideast$week <- isoweek(gt_mideast$dateGT)

# Make $week continue in 2025 to prevent duplicates
gt_mideast$week <- ifelse(
  format(gt_mideast$dateGT, "%Y") == "2025", 
  as.numeric(gt_mideast$week) + 52 ,  # +52 weeks when year==2025
  as.numeric(gt_mideast$week))        

#make all variables except $dateGT to numeric 
mideast_numvars <- c("Israel_ScoreGT", "Hamas_ScoreGT", "Iran_ScoreGT", "Gaza_ScoreGT")
gt_mideast[mideast_numvars] <- lapply(gt_mideast[mideast_numvars], as.numeric)






# Ukraine
# data preperation for the Google Trends data for the topic "Ukraine"
# load csv files of GT search terms "Ukraine", "Russland", "Kiew", "Gaza" in the time frame 11.01.2024 to 11.01.2025
gt_ukraine_raw <- read.csv("C:/Datasets/tagesschau_folder/GT/GT_Ukraine_1101.csv", header = FALSE)
gt_russland_raw <- read.csv("C:/Datasets/tagesschau_folder/GT/GT_Russland_1101.csv", header = FALSE)
gt_kiew_raw <- read.csv("C:/Datasets/tagesschau_folder/GT/GT_Kiew_1101.csv", header = FALSE)
gt_selenskyj_raw <- read.csv("C:/Datasets/tagesschau_folder/GT/GT_Selenskyj_1101.csv", header = FALSE)

# Merge GT_raw csv files to one dataset based on week variable, rename variables, delete last 2 rows.
gt_ukraine <- Reduce(function(x, y) merge(x,y, by = "V1", all = T), list(gt_ukraine_raw, gt_russland_raw, gt_kiew_raw, gt_selenskyj_raw))
colnames(gt_ukraine) <- c("dateGT", "Ukraine_ScoreGT", "Russland_ScoreGT", "Kiew_ScoreGT", "Selenskyj_ScoreGT")
gt_ukraine <- head(gt_ukraine, -2)

# Format the date and create $week variable
gt_ukraine$dateGT <- as.Date(gt_ukraine$dateGT)
gt_ukraine$dateGT <- gt_ukraine$dateGT + 3  # +3 days to cover right week (important to switch year to 2025 after week 52)
gt_ukraine$week <- isoweek(gt_ukraine$dateGT)

# Make $week continue in 2025 to prevent duplicates
gt_ukraine$week <- ifelse(
  format(gt_ukraine$dateGT, "%Y") == "2025", 
  as.numeric(gt_ukraine$week) + 52 ,  # +52 weeks when year==2025
  as.numeric(gt_ukraine$week))        

#make all variables except $dateGT to numeric 
ukraine_numvars <- c("Ukraine_ScoreGT", "Russland_ScoreGT", "Kiew_ScoreGT", "Selenskyj_ScoreGT")
gt_ukraine[ukraine_numvars] <- lapply(gt_ukraine[ukraine_numvars], as.numeric)












