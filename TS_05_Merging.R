# Before running the code, load all packages from "TS_03_DataPreperation"!

# The following code uses the preprocessed data from Google Trends (File = TS_02_GoogleTrends_Setup) and merges with TS based on week in year.




#--------------------------------------------------------------------------------

# Merging for "USA"
# Filter for topic = USA
# count the topic for each week
# add result to the GT_USA Dataset

TS_usa_counts <- TS_GT %>%
  filter(dominant_topic == "USA") %>%        # Filter auf "USA" in der Variable dominant_topic
  group_by(week) %>%                         # Gruppieren nach Woche
  summarise(ts_count_usa = n()) %>%             # Anzahl der Fälle pro Woche zählen
  ungroup()                                  # Gruppierung entfernen

# Neue Variable zu GT_USA hinzufügen
gt_us <- gt_us %>%
  left_join(TS_usa_counts, by = "week")         # Join nach Woche



# Visualize
ggplot(gt_us, aes(x = week)) +
  geom_line(aes(y = ts_count_usa, color = "Tagesschau"), size = 1.8) + 
  geom_line(aes(y = USA_ScoreGT, color = "GT USA"), size = 0.6) +
  geom_line(aes(y = Trump_ScoreGT, color = "GT Trump"), size = 0.6) +
  geom_line(aes(y = Biden_ScoreGT, color = "GT Biden"), size = 0.6) +
  geom_line(aes(y = Harris_ScoreGT, color = "GT Harris"), size = 0.6) +
  scale_color_manual(values = c("Tagesschau" = "red", "GT USA" = "blue", "GT Trump" = "green", 
                                "GT Biden" = "yellow", "GT Harris" = "black")) + 
  labs(
    title = "USA - Google Trends in % of the annual peak vs. number of tagesschau articles per week",
    x = "Week",
    y = "Value",
    color = "Legend"
  ) +
  theme_minimal()
