# Visualize Plots / Graphs from the merged Data
# Using prepared data from TS_05_Mergin.R


### USA


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

# Calculate correlation
cor(gt_us$USA_ScoreGT, gt_us$ts_count_usa)
cor(gt_us$Trump_ScoreGT, gt_us$ts_count_usa)
cor(gt_us$Biden_ScoreGT, gt_us$ts_count_usa)
cor(gt_us$Harris_ScoreGT, gt_us$ts_count_usa)






### Middle East


# # Visualize Topic "Middle_East": GT (relative % of anunal peak) + TS (absolute article count)
ggplot(gt_mideast, aes(x = week)) +
  geom_line(aes(y = ts_count_mideast, color = "Tagesschau"), size = 1.8) + 
  geom_line(aes(y = Israel_ScoreGT, color = "GT Israel"), size = 1) +
  geom_line(aes(y = Hamas_ScoreGT, color = "GT Hamas"), size = 1) +
  geom_line(aes(y = Iran_ScoreGT, color = "GT Iran"), size = 1) +
  geom_line(aes(y = Gaza_ScoreGT, color = "GT Gaza"), size = 1) +
  scale_color_manual(values = c("Tagesschau" = "red", "GT Israel" = "blue", "GT Hamas" = "green", 
                                "GT Iran" = "yellow", "GT Gaza" = "black")) + 
  labs(
    title = "Middle East - Google Trends in % of the annual peak vs. number of tagesschau articles per week",
    x = "Week",
    y = "Value",
    color = "Legend"
  ) +
  theme_minimal()

# Visualize Topic "Middle East": GT (relative % of anunal peak) + TS (relative % of anunal peak))
ggplot(gt_mideast, aes(x = week)) +
  geom_line(aes(y = ts_percentage_of_peak, color = "Tagesschau"), size = 1.8) + 
  geom_line(aes(y = Israel_ScoreGT, color = "GT Israel"), size = 1) +
  geom_line(aes(y = Hamas_ScoreGT, color = "GT Hamas"), size = 1) +
  geom_line(aes(y = Iran_ScoreGT, color = "GT Iran"), size = 1) +
  geom_line(aes(y = Gaza_ScoreGT, color = "GT Gaza"), size = 1) +
  scale_color_manual(values = c("Tagesschau" = "red", "GT Israel" = "blue", "GT Hamas" = "green", 
                                "GT Iran" = "yellow", "GT Gaza" = "black")) + 
  labs(
    title = "Middle East - Google Trends vs. Tagesschau Articles in % of annual peak",
    x = "Week",
    y = "Value",
    color = "Legend"
  ) +
  theme_minimal()

# Calculate Correlation
cor(gt_mideast$ts_count_mideast, gt_mideast$Israel_ScoreGT)
cor(gt_mideast$ts_count_mideast, gt_mideast$Hamas_ScoreGT)
cor(gt_mideast$ts_count_mideast, gt_mideast$Iran_ScoreGT)
cor(gt_mideast$ts_count_mideast, gt_mideast$Gaza_ScoreGT)







### Ukraine


# # Visualize Topic "Middle_East": GT (relative % of anunal peak) + TS (absolute article count)
ggplot(gt_ukraine, aes(x = week)) +
  geom_line(aes(y = ts_count_ukraine, color = "Tagesschau"), size = 1.8) + 
  geom_line(aes(y = Ukraine_ScoreGT, color = "GT Israel"), size = 1) +
  geom_line(aes(y = Russland_ScoreGT, color = "GT Russland"), size = 1) +
  geom_line(aes(y = Kiew_ScoreGT, color = "GT Kiew"), size = 1) +
  geom_line(aes(y = Selenskyj_ScoreGT, color = "GT Selenskyj"), size = 1) +
  scale_color_manual(values = c("Tagesschau" = "red", "GT Israel" = "blue", "GT Russland" = "green", 
                                "GT Kiew" = "yellow", "GT Selenskyj" = "black")) + 
  labs(
    title = "Middle East - Google Trends in % of the annual peak vs. number of tagesschau articles per week",
    x = "Week",
    y = "Value",
    color = "Legend"
  ) +
  theme_minimal()

# Visualize Topic "Middle East": GT (relative % of anunal peak) + TS (relative % of anunal peak))
ggplot(gt_ukraine, aes(x = week)) +
  geom_line(aes(y = ts_percentage_of_peak, color = "Tagesschau"), size = 1.8) + 
  geom_line(aes(y = Ukraine_ScoreGT, color = "GT Ukraine"), size = 1) +
  geom_line(aes(y = Russland_ScoreGT, color = "GT Russland"), size = 1) +
  geom_line(aes(y = Kiew_ScoreGT, color = "GT Kiew"), size = 1) +
  geom_line(aes(y = Selenskyj_ScoreGT, color = "GT Selenskyj"), size = 1) +
  scale_color_manual(values = c("Tagesschau" = "red", "GT Ukraine" = "blue", "GT Russland" = "green", 
                                "GT Kiew" = "yellow", "GT Selenskyj" = "black")) + 
  labs(
    title = "Middle East - Google Trends vs. Tagesschau Articles in % of annual peak",
    x = "Week",
    y = "Value",
    color = "Legend"
  ) +
  theme_minimal()

# Calculate Correlation
cor(gt_ukraine$ts_count_ukraine, gt_ukraine$Ukraine_ScoreGT)
cor(gt_ukraine$ts_count_ukraine, gt_ukraine$Russland_ScoreGT)
cor(gt_ukraine$ts_count_ukraine, gt_ukraine$Kiew_ScoreGT)
cor(gt_ukraine$ts_count_ukraine, gt_ukraine$Selenskyj_ScoreGT)




























