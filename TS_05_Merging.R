# Before running the code, load all packages from "TS_03_DataPreperation"!
# The following code uses the preprocessed data from Google Trends (File = TS_02_GoogleTrends_Setup) and merges with TS based on $week
# The same process is applied for all TS topic assignments based on STM and keyATM. USA contains a description in comments format.


# Merging based on TS Topic assignments from STM and keyATM for "USA", "Middle East", "Ukraine", "EU".


# USA

# Merge TS & GT based on STM topic aissgnments for "USA"
ts_usa_stm <- TS %>%
  filter(dominant_topic == "USA") %>%        # filter for "USA" as dominant_topic
  group_by(week) %>%                         # group by week
  summarise(ts_stm_usa = n()) %>%            # summarise by cases per week
  ungroup()                                  # delete grouping

# merging by dplyrs join, so information form TS is merged into GT for Topic USA
gt_us <- gt_us %>%
  left_join(ts_usa_stm, by = "week")         # merge based on $week (both in TS and gt)

# Normalize ts_stm_us based on 100 = annual peak, add as new variable
gt_us$ts_norm_us_stm <- (gt_us$ts_stm_usa / max(gt_us$ts_stm_usa)) * 100
# gt_us now contains two new variables $TS_usa_stm and $ts_norm_us

# Merge TS & GT based on keyATM topic aissgnments for "USA"
ts_usa_atm <- TS %>%
  filter(ATM_dominant_topic == "USA") %>%    # filter for "USA" as dominant_topic
  group_by(week) %>%                         # group by week
  summarise(ts_atm_usa = n()) %>%            # summarise by cases per week
  ungroup()                                  # delete grouping

# merging by dplyrs join, so information form TS is merged into GT for Topic USA
gt_us <- gt_us %>%
  left_join(ts_usa_atm, by = "week")         # merge based on $week (both in TS and gt)

# Normalize ts_atm_us based on 100 = annual peak, add as new variable
gt_us$ts_norm_us_atm <- (gt_us$ts_atm_usa / max(gt_us$ts_atm_usa)) * 100

# Create a combined version of GT Search Terms (Sum of All GT Terms / 4)
gt_us <- gt_us %>% 
  mutate(MeanGT = rowMeans(select(., USA_ScoreGT, Trump_ScoreGT, Biden_ScoreGT, Harris_ScoreGT)))





# Middle East

# Merge STM
ts_mideast_stm <- TS %>%
  filter(dominant_topic == "Middle_East") %>%
  group_by(week) %>%
  summarise(ts_stm_mideast = n()) %>%
  ungroup()

gt_mideast <- gt_mideast %>%
  left_join(ts_mideast_stm, by = "week")

gt_mideast$ts_norm_mideast_stm <- (gt_mideast$ts_stm_mideast / max(gt_mideast$ts_stm_mideast)) * 100

# Merge keyATM
ts_mideast_atm <- TS %>%
  filter(ATM_dominant_topic == "Middle_East") %>%
  group_by(week) %>%
  summarise(ts_atm_mideast = n()) %>%
  ungroup()

gt_mideast <- gt_mideast %>%
  left_join(ts_mideast_atm, by = "week")

gt_mideast$ts_norm_mideast_atm <- (gt_mideast$ts_atm_mideast / max(gt_mideast$ts_atm_mideast)) * 100

gt_mideast <- gt_mideast %>% 
  mutate(MeanGT = rowMeans(select(., Israel_ScoreGT, Hamas_ScoreGT, Iran_ScoreGT, Gaza_ScoreGT)))



# Ukraine

# Merge STM
ts_ukraine_stm <- TS %>% 
  filter(dominant_topic == "Ukraine") %>% 
  group_by(week) %>% 
  summarise(ts_stm_ukraine = n()) %>% 
  ungroup()

gt_ukraine <- gt_ukraine %>% 
  left_join(ts_ukraine_stm, by = "week") %>% 
  mutate(ts_stm_ukraine = replace_na(ts_stm_ukraine, 0))

gt_ukraine$ts_norm_ukraine_stm <- (gt_ukraine$ts_stm_ukraine / max(gt_ukraine$ts_stm_ukraine)) * 100

# Merge keyATM
ts_ukraine_atm <- TS %>% 
  filter(ATM_dominant_topic == "Ukraine") %>% 
  group_by(week) %>% 
  summarise(ts_atm_ukraine = n()) %>% 
  ungroup()

gt_ukraine <- gt_ukraine %>% 
  left_join(ts_ukraine_atm, by = "week")

gt_ukraine$ts_norm_ukraine_atm <- (gt_ukraine$ts_atm_ukraine / max(gt_ukraine$ts_atm_ukraine)) * 100

gt_ukraine <- gt_ukraine %>% 
  mutate(MeanGT = rowMeans(select(., Ukraine_ScoreGT, Russland_ScoreGT, Kiew_ScoreGT, Selenskyj_ScoreGT)))

# EU

# Merge STM
ts_eu_stm <- TS %>% 
  filter(dominant_topic == "EU") %>% 
  group_by(week) %>% 
  summarise(ts_stm_eu = n()) %>% 
  ungroup()

gt_eu <- gt_eu %>% 
  left_join(ts_eu_stm, by = "week") 

gt_eu$ts_norm_eu_stm <- (gt_eu$ts_stm_eu / max(gt_eu$ts_stm_eu)) * 100

# Merge keyATM
ts_eu_atm <- TS %>% 
  filter(ATM_dominant_topic == "EU") %>% 
  group_by(week) %>% 
  summarise(ts_atm_eu = n()) %>% 
  ungroup()

gt_eu <- gt_eu %>% 
  left_join(ts_eu_atm, by = "week")

gt_eu$ts_norm_eu_atm <- (gt_eu$ts_atm_eu / max(gt_eu$ts_atm_eu)) * 100

gt_eu <- gt_eu %>% 
  mutate(MeanGT = rowMeans(select(., EU_ScoreGT, Europa_ScoreGT, Union_ScoreGT, Frankreich_ScoreGT)))









