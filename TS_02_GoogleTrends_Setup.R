# Before running the code, load all packages from "TS_03_DataPreperation"!

# The code below uses data from Google Trends. Search Terms were selected based on resulting topics from stm in "TS_04_TopicModels"
# Search Terms: "USA" , 


# Loading Data
GT_USA <- read.csv("C:/Datasets/tagesschau_folder/GT/GT_USA_1101.csv", header = FALSE)
GT_USA <- GT_USA[-c(1,2), ] # Delete Row 1 and 2 !! Only run this line once!!
colnames(GT_USA) <- c("dateGT", "USA_Score")



# Format the date and create $week variable
GT_USA$dateGT <- as.Date(GT_USA$dateGT)
GT_USA$dateGT <- GT_USA$dateGT + 3  # +3 days to cover right week (important to switch year to 2025 after week 52)

GT_USA$week <- isoweek(GT_USA$dateGT)

# Make $week continue in 2025 to prevent duplicates
GT_USA$week <- ifelse(
  format(GT_USA$dateGT, "%Y") == "2025", 
  as.numeric(GT_USA$week) + 52 ,  # Kalenderwochen um 52 erhöhen für 2025
  as.numeric(GT_USA$week))        # Original-Woche für andere Jahre

GT_USA$USA_Score <- as.numeric(GT_USA$USA_Score) # make $USA_Score numeric


