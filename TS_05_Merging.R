# Before running the code, load all packages from "TS_03_DataPreperation"!

# The following code uses the preprocessed data from Google Trends (File = TS_02_GoogleTrends_Setup) and merges with TS based on week in year.




#--------------------------------------------------------------------------------

# Merging for "USA"
# Filter for topic = USA
# count the topic for each week
# add result to the GT_[Topic] Dataset


# Merge TS and gt_us
TS_usa_counts <- TS_GT %>%
  filter(dominant_topic == "USA") %>%        # filter for "USA" as dominant_topic
  group_by(week) %>%                         # goup by week
  summarise(ts_count_usa = n()) %>%          # summarise by cases per week
  ungroup()                                  # delete grouping

# merging by dplyrs join
gt_us <- gt_us %>%
  left_join(TS_usa_counts, by = "week")         # merge based on $week (both in TS and gt)

# Normalize ts_count_us based on 100% annual peak, add as new variable
gt_us$ts_percentage_of_peak <- (gt_us$ts_count_usa / max(gt_us$ts_count_usa)) * 100



# --

# Merging the Mideast Topic from TS into gt_mideast
TS_mideast_counts <- TS_GT %>%
  filter(dominant_topic == "Middle_East") %>%        # filter for "USA" as dominant_topic
  group_by(week) %>%                         # goup by week
  summarise(ts_count_mideast = n()) %>%          # summarise by cases per week
  ungroup()                                  # delete grouping

# Neue Variable zu GT_USA hinzufügen
gt_mideast <- gt_mideast %>%
  left_join(TS_mideast_counts, by = "week")         # merge based on $week (both in TS and gt)

# Normalize ts_count_us based on 100% annual peak, add as new variable
gt_mideast$ts_percentage_of_peak <- (gt_mideast$ts_count_mideast / max(gt_mideast$ts_count_mideast)) * 100

