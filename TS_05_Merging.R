# Before running the code, load all packages from "TS_03_DataPreperation"!

# The following code uses the preprocessed data from Google Trends (File = TS_02_GoogleTrends_Setup) and merges with TS based on week in year.




#--------------------------------------------------------------------------------

# Merging for "USA"
# Filter for topic = USA
# count the topic for each week
# add result to the GT_USA Dataset

usa_counts <- TS_GT %>%
  filter(dominant_topic == "USA") %>%        # Filter auf "USA" in der Variable dominant_topic
  group_by(week) %>%                         # Gruppieren nach Woche
  summarise(count_usa = n()) %>%             # Anzahl der Fälle pro Woche zählen
  ungroup()                                  # Gruppierung entfernen

# Neue Variable zu GT_USA hinzufügen
GT_USA <- GT_USA %>%
  left_join(usa_counts, by = "week")         # Join nach Woche



# Visualize
ggplot(GT_USA, aes(x = week)) +
  geom_line(aes(y = count_usa, color = "Tagesschau"), size = 1) + # Line for count_usa
  geom_line(aes(y = USA_Score, color = "Google Trends"), size = 1) + # Line for USA_score
  scale_color_manual(values = c("Tagesschau" = "red", "Google Trends" = "blue")) + # Custom colors
  labs(
    title = "USA - Google Trends in % of the annual peak vs. number of tagesschau articles per week",
    x = "Week",
    y = "Value",
    color = "Legend"
  ) +
  theme_minimal()
