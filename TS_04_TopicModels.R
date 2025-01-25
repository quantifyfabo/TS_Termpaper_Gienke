# Before running the code, load all packages from "TS_03_DataPreperation"!

# The following code contains the application of topic models to the preprocessed textdata of TS_For Articles.
# searchK will be used to find the optimal number of topics.
# The resulting topics from stm will be labeled and linked to the corresponding Articles from the TS_For Data.
# To run code below, make sure the required data is loaded: "TS" , "TS_For_DFM"


# Using searchK to identify optimal number of topics
set.seed(2025)
STM_out <- convert(TS_For_DFM, to = "stm")

kresult <- searchK(STM_out$documents,
                   STM_out$vocab,
                   seq(4, 24, 4),
                   data = STM_out$meta,
                   verbose = TRUE)

plot(kresult)
#saveRDS(kresult, file = "C:/R/FG1/R_Projects/TS_Testing/k_results.rds") # optional safe kresult
#k_loaded <- readRDS(file = "C:/R/FG1/R_Projects/TS_Testing/k_results.rds")


# Use STM with K = 8 topics (optimal number)
start_time <- Sys.time() # track time taken to run models

set.seed(2025)
TS_For_Topics_STM <- stm(TS_For_DFM,
                         K = 8,
                         verbose = T)

end_time <- Sys.time()
time_taken <- end_time - start_time
time_taken


# Results of STM
summary(TS_For_Topics_STM)
plot(TS_For_Topics_STM)
topicQuality(model = TS_For_Topics_STM,
             documents = TS_For_DFM)


# create dataframe to show count of each documents most likely topic based on $theta from STM.
STM_topic_assignments <- apply(TS_For_Topics_STM$theta, 1, which.max)  # Most likely topic for each document
STM_topic_counts <- table(STM_topic_assignments)
STM_topic_counts_df <- as.data.frame(STM_topic_counts)            # create new checkup dataframe
colnames(STM_topic_counts_df) <- c("Topic", "Count")          # rename variables
STM_topic_counts_df$Topic <- c("Other", "Middle East", "Non-EU-States", "EU", "USA", "Election", "Climate", "Ukraine") # rename topics


# Plot how often each Topic appears in TS_For Data, based on most likely topic per document.
ggplot(STM_topic_counts_df, aes(x = reorder(Topic, -Count), y = Count)) +
  geom_bar(stat = "identity", fill = "skyblue") +  # Balkendiagramm
  labs(title = "Number of Articles per Topic", x = "Topics", y = "Number of Articles") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Beschriftung drehen


# Add new variables to TS Data: 
# Most likely topic for each document ($dominant_topic) and probability of dominant topic for each document ($dominant_prob)
TS$dominant_topic <- apply(TS_For_Topics_STM$theta, 1, which.max)
TS$dominant_prob <- apply(TS_For_Topics_STM$theta, 1, max)

# rename topics
TS <- TS %>%
  mutate(dominant_topic = recode(dominant_topic,
                                 "1" = "General", "2" = "Middle_East", "3" = "Non-EU-States", "4" = "EU",
                                 "5" = "USA", "6" = "Election", "7" = "Climate", "8" = "Ukraine"
  ))
  

