# The following code contains the data preperation of the websscraped TS_For Data.
# The data preperation consists of:
# renaming variables, edit text and date formats, tokenize the text variable including stopwords.


packages <- c("dplyr", "tidyverse", "quanteda", "httr", "jsonlite", "lubridate", 
              "rvest", "xml2", "tibble", "magrittr", "stm", "keyATM")

lapply(packages, library, character.only = TRUE)

# Load Data
TS_For_Raw <- read.csv("C:/Datasets/tagesschau_folder/TS_ALL_Foreign_RAW_1001.csv")
TS <- TS_For_Raw


# Preprocessing

# Adding "ID" as a column
TS <- data.frame(ID = rownames(TS), TS, row.names = NULL)
TS$ID <- as.numeric(TS$ID)

# Deletes the "mehr" and ". Von" at the end of every text + following characters
TS$text <- gsub("mehr", "", TS$text, ignore.case = TRUE)
TS$text <- gsub("\\. Von\\s+\\w+(\\s+\\w+){0,4}\\.", "", TS$text)

# Deletes double (or more) whitespaces
TS$text <- gsub("\\s+", " ", TS$text)

# Creating a date variable and week variable using lubridate
TS$date <- gsub("•.*", "", TS$date)
TS$date <- dmy(TS$date)
TS$week <- isoweek(TS$date)
TS$week <- ifelse(format(TS$date, "%Y") == "2025", # Add "_25" to indicate weeks in 2025
                  paste0(TS$week, "_25"),TS$week)

# Create $month
TS$month <- format(TS$date, "%b")  # Kurzer Monat, z.B. "Jan", "Feb", etc.
TS$month <- toupper(TS$month) # Großbuchstaben für den Monat



# Tokenize

TS_For_Corpus <- corpus(tolower(TS$text),
                        docvars = TS) 

TS_For_Tokens <- tokens(TS_For_Corpus,
                        remove_numbers = T,
                        remove_punct = T,
                        remove_separators = T,
                        remove_symbols = T,
                        remove_url = T,
                        include_docvars = T)

# Stopwords (list obtained from Github, for reference see link below)
stoptext <- read.table(url("https://raw.githubusercontent.com/stopwords-iso/stopwords-de/master/stopwords-de.txt"))
stop_list <- stoptext[[1]]
TS_For_Tokens <- tokens_remove(TS_For_Tokens, stop_list)

# DFM
TS_For_DFM <- dfm(TS_For_Tokens)
topfeatures(TS_For_DFM)

