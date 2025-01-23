# Visualize Plots / Graphs from the merged Data
# Using prepared data from TS_05_Mergin.R



# Visualize Topic "USA": GT (relative % of anunal peak) + TS (absolute article count)
ggplot(gt_us, aes(x = week)) +
  geom_line(aes(y = ts_count_usa, color = "Tagesschau"), size = 1.8) + 
  geom_line(aes(y = USA_ScoreGT, color = "GT USA"), size = 1) +
  geom_line(aes(y = Trump_ScoreGT, color = "GT Trump"), size = 1) +
  geom_line(aes(y = Biden_ScoreGT, color = "GT Biden"), size = 1) +
  geom_line(aes(y = Harris_ScoreGT, color = "GT Harris"), size = 1) +
  scale_color_manual(values = c("Tagesschau" = "red", "GT USA" = "blue", "GT Trump" = "green", 
                                "GT Biden" = "yellow", "GT Harris" = "black")) + 
  labs(
    title = "USA - Google Trends in % of the annual peak vs. number of tagesschau articles per week",
    x = "Week",
    y = "Value",
    color = "Legend"
  ) +
  theme_minimal()

# Visualize Topic "USA": GT (relative % of anunal peak) + TS (relative % of anunal peak))
ggplot(gt_us, aes(x = week)) +
  geom_line(aes(y = ts_percentage_of_peak , color = "Tagesschau"), size = 1.8) + 
  geom_line(aes(y = USA_ScoreGT, color = "GT USA"), size = 1) +
  geom_line(aes(y = Trump_ScoreGT, color = "GT Trump"), size = 1) +
  geom_line(aes(y = Biden_ScoreGT, color = "GT Biden"), size = 1) +
  geom_line(aes(y = Harris_ScoreGT, color = "GT Harris"), size = 1) +
  scale_color_manual(values = c("Tagesschau" = "red", "GT USA" = "blue", "GT Trump" = "green", 
                                "GT Biden" = "yellow", "GT Harris" = "black")) + 
  labs(
    title = "USA - Google Trends vs. Tagesschau Articles in % of annual peak",
    x = "Week",
    y = "Value",
    color = "Legend"
  ) +
  theme_minimal()

cor(gt_us$Trump_ScoreGT, gt_us$ts_count_usa)
cor(gt_us$Trump_ScoreGT, gt_us$ts_percentage_of_peak)

