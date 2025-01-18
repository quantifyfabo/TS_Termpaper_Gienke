# Checking Formatting and Use of Google Trends (GT)

# Loading Data
GT_USA_1101 <- read.csv("C:/Datasets/tagesschau_folder/GT/GT_USA_1101.csv", header = FALSE)
GT_USA_1101 <- GT_USA_1101[-c(1,2), ] # Delete Row 1 and 2 !! Only run this line once!!
colnames(GT_USA_1101) <- c("dateGT", "USA_GT_Topic")



# Format the date ($Woche) and create $week variable
GT_USA_1101$dateGT <- as.Date(GT_USA_1101$dateGT)
GT_USA_1101$dateGT <- GT_USA_1101$dateGT + 3  # +3 days to cover right week (important to switch year to 2025 after week 52)

GT_USA_1101$week <- isoweek(GT_USA_1101$dateGT)

GT_USA_1101$week <- ifelse(format(GT_USA_1101$dateGT, "%Y") == "2025", # Add "_25" to indicate weeks in 2025
                  paste0(GT_USA_1101$week, "_25"),GT_USA_1101$week)
