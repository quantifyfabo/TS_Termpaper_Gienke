# Before running the code, load all packages from "TS_03_DataPreperation"!

# The code below uses data from Google Trends. Search Terms were selected based on resulting topics from stm in "TS_04_TopicModels"
# Search Terms: "USA" , 


# Data Preperation for the Google Trends Search Results for the Topic "USA"
gt_usa_raw <- read.csv("C:/Datasets/tagesschau_folder/GT/GT_USA_1101.csv", header = FALSE)
gt_trump_raw <- read.csv("C:/Datasets/tagesschau_folder/GT/GT_Trump_1101.csv", header = FALSE)
gt_biden_raw <- read.csv("C:/Datasets/tagesschau_folder/GT/GT_Biden_1101.csv", header = FALSE)
gt_harris_raw <- read.csv("C:/Datasets/tagesschau_folder/GT/GT_Harris_1101.csv", header = FALSE)

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
  as.numeric(gt_us$week) + 52 ,  # Kalenderwochen um 52 erhöhen für 2025
  as.numeric(gt_us$week))        # Original-Woche für andere Jahre

#make all variables excep $dateGT to numeric 
us_numvars <- c("USA_ScoreGT", "Trump_ScoreGT", "Biden_ScoreGT", "Harris_ScoreGT")
gt_us[us_numvars] <- lapply(gt_us[us_numvars], as.numeric)



