# Visualize Plots / Graphs from the merged Data
# Using prepared data from TS_05_Mergin.R


## USA

# Visualize keyATM Topic results "USA" (absolute numbers) and GT Term Scores (relative % of anunal peak)
ggplot(gt_us, aes(x = week)) +
  geom_line(aes(y = ts_atm_usa, color = "Tagesschau"), size = 1.8) + 
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

# Visualize keyATM Topic results "USA" (relative % of anunal peak) and GT Term Scores (relative % of anunal peak)
ggplot(gt_us, aes(x = week)) +
  geom_line(aes(y = ts_norm_us_atm , color = "Tagesschau"), size = 1.8) + 
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

# Visualize the meanGT correlation with TS
ggplot(gt_us, aes(x = week)) +
  geom_line(aes(y = ts_atm_usa, color = "Tagesschau"), size = 1.8) + 
  geom_line(aes(y = MeanGT, color = "MeanGT"), size = 1) +
  scale_color_manual(values = c("Tagesschau" = "red", "MeanGT" = "blue")) + 
  labs(
    x = "Week",
    y = "Value",
    color = "Legend"
  ) +
  theme_minimal()


# Calculate correlation
# STM
cor(gt_us$USA_ScoreGT, gt_us$ts_stm_usa)
cor(gt_us$Trump_ScoreGT, gt_us$ts_stm_usa)
cor(gt_us$Biden_ScoreGT, gt_us$ts_stm_usa)
cor(gt_us$Harris_ScoreGT, gt_us$ts_stm_usa)
cor(gt_us$MeanGT, gt_us$ts_stm_usa)


#keyATM
cor(gt_us$USA_ScoreGT, gt_us$ts_atm_usa)
cor(gt_us$Trump_ScoreGT, gt_us$ts_atm_usa)
cor(gt_us$Biden_ScoreGT, gt_us$ts_atm_usa)
cor(gt_us$Harris_ScoreGT, gt_us$ts_atm_usa)
cor(gt_us$MeanGT, gt_us$ts_atm_usa)








### Middle East


# Visualize keyATM Topic results "Middle East" (absolute numbers) and GT Term Scores (relative % of anunal peak)
ggplot(gt_mideast, aes(x = week)) +
  geom_line(aes(y = ts_atm_mideast, color = "Tagesschau"), size = 1.8) + 
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

# Visualize keyATM Topic results "Middle East" (relative % of anunal peak) and GT Term Scores (relative % of anunal peak)
ggplot(gt_mideast, aes(x = week)) +
  geom_line(aes(y = ts_norm_mideast_atm, color = "Tagesschau"), size = 1.8) + 
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

#MeanGT
ggplot(gt_mideast, aes(x = week)) +
  geom_line(aes(y = ts_norm_mideast_atm, color = "Tagesschau"), size = 1.8) + 
  geom_line(aes(y = MeanGT, color = "MeanGT"), size = 1) +
  scale_color_manual(values = c("Tagesschau" = "red", "MeanGT" = "blue")) + 
  labs(
    title = "Middle East - Correlation TS and MeanGT",
    x = "Week",
    y = "Value",
    color = "Legend"
  ) +
  theme_minimal()

# Calculate Correlation
# STM
cor(gt_mideast$ts_stm_mideast, gt_mideast$Israel_ScoreGT)
cor(gt_mideast$ts_stm_mideast, gt_mideast$Hamas_ScoreGT)
cor(gt_mideast$ts_stm_mideast, gt_mideast$Iran_ScoreGT)
cor(gt_mideast$ts_stm_mideast, gt_mideast$Gaza_ScoreGT)
cor(gt_mideast$ts_stm_mideast, gt_mideast$MeanGT)


# keyATM
cor(gt_mideast$ts_atm_mideast, gt_mideast$Israel_ScoreGT)
cor(gt_mideast$ts_atm_mideast, gt_mideast$Hamas_ScoreGT)
cor(gt_mideast$ts_atm_mideast, gt_mideast$Iran_ScoreGT)
cor(gt_mideast$ts_atm_mideast, gt_mideast$Gaza_ScoreGT)
cor(gt_mideast$ts_atm_mideast, gt_mideast$MeanGT)






### Ukraine


# Visualize keyATM Topic results "Ukraine" (absolute numbers) and GT Term Scores (relative % of anunal peak)
ggplot(gt_ukraine, aes(x = week)) +
  geom_line(aes(y = ts_atm_ukraine, color = "Tagesschau"), size = 1.8) + 
  geom_line(aes(y = Ukraine_ScoreGT, color = "GT Ukraine"), size = 1) +
  geom_line(aes(y = Russland_ScoreGT, color = "GT Russland"), size = 1) +
  geom_line(aes(y = Kiew_ScoreGT, color = "GT Kiew"), size = 1) +
  geom_line(aes(y = Selenskyj_ScoreGT, color = "GT Selenskyj"), size = 1) +
  scale_color_manual(values = c("Tagesschau" = "red", "GT Ukraine" = "blue", "GT Russland" = "green", 
                                "GT Kiew" = "yellow", "GT Selenskyj" = "black")) + 
  labs(
    x = "Week",
    y = "Value",
    color = "Legend"
  ) +
  theme_minimal()

# Visualize keyATM Topic results "Ukraine" (relative % of anunal peak) and GT Term Scores (relative % of anunal peak)
ggplot(gt_ukraine, aes(x = week)) +
  geom_line(aes(y = ts_norm_ukraine_atm, color = "Tagesschau"), size = 1.8) + 
  geom_line(aes(y = Ukraine_ScoreGT, color = "GT Ukraine"), size = 1) +
  geom_line(aes(y = Russland_ScoreGT, color = "GT Russland"), size = 1) +
  geom_line(aes(y = Kiew_ScoreGT, color = "GT Kiew"), size = 1) +
  geom_line(aes(y = Selenskyj_ScoreGT, color = "GT Selenskyj"), size = 1) +
  scale_color_manual(values = c("Tagesschau" = "red", "GT Ukraine" = "blue", "GT Russland" = "green", 
                                "GT Kiew" = "yellow", "GT Selenskyj" = "black")) + 
  labs(
    title = "Ukraine - GT vs. TS normalized, based on keyATM",
    x = "Week",
    y = "Value",
    color = "Legend"
  ) +
  theme_minimal()

#MeanGT
ggplot(gt_ukraine, aes(x = week)) +
  geom_line(aes(y = ts_norm_ukraine_atm, color = "Tagesschau"), size = 1.8) + 
  geom_line(aes(y = MeanGT, color = "MeanGT"), size = 1) +
  scale_color_manual(values = c("Tagesschau" = "red", "MeanGT" = "blue")) + 
  labs(
    title = "Ukraine - Correlation TS normalized and MeanGT",
    x = "Week",
    y = "Value",
    color = "Legend"
  ) +
  theme_minimal()

# Calculate Correlation
# STM
cor(gt_ukraine$ts_stm_ukraine, gt_ukraine$Ukraine_ScoreGT)
cor(gt_ukraine$ts_stm_ukraine, gt_ukraine$Russland_ScoreGT)
cor(gt_ukraine$ts_stm_ukraine, gt_ukraine$Kiew_ScoreGT)
cor(gt_ukraine$ts_stm_ukraine, gt_ukraine$Selenskyj_ScoreGT)
cor(gt_ukraine$ts_stm_ukraine, gt_ukraine$MeanGT)


# keyATM
cor(gt_ukraine$ts_atm_ukraine, gt_ukraine$Ukraine_ScoreGT)
cor(gt_ukraine$ts_atm_ukraine, gt_ukraine$Russland_ScoreGT)
cor(gt_ukraine$ts_atm_ukraine, gt_ukraine$Kiew_ScoreGT)
cor(gt_ukraine$ts_atm_ukraine, gt_ukraine$Selenskyj_ScoreGT)
cor(gt_ukraine$ts_atm_ukraine, gt_ukraine$MeanGT)






## EU

# Visualize keyATM Topic results "EU" (absolute numbers) and GT Term Scores (relative % of anunal peak)
ggplot(gt_eu, aes(x = week)) +
  geom_line(aes(y = ts_atm_eu, color = "Tagesschau"), size = 1.8) + 
  geom_line(aes(y = EU_ScoreGT, color = "GT EU"), size = 1) +
  geom_line(aes(y = Europa_ScoreGT, color = "GT Europa"), size = 1) +
  geom_line(aes(y = Union_ScoreGT, color = "GT Union"), size = 1) +
  geom_line(aes(y = Frankreich_ScoreGT, color = "GT Frankreich"), size = 1) +
  scale_color_manual(values = c("Tagesschau" = "red", "GT EU" = "blue", "GT Europa" = "green", 
                                "GT Union" = "yellow", "GT Frankreich" = "black")) + 
  labs(
    title = "EU - Google Trends in % of the annual peak vs. number of tagesschau articles per week",
    x = "Week",
    y = "Value",
    color = "Legend"
  ) +
  theme_minimal()

# Visualize keyATM Topic results "eu" (relative % of anunal peak) and GT Term Scores (relative % of anunal peak)
ggplot(gt_eu, aes(x = week)) +
  geom_line(aes(y = ts_norm_eu_atm, color = "Tagesschau"), size = 1.8) + 
  geom_line(aes(y = EU_ScoreGT, color = "GT EU"), size = 1) +
  geom_line(aes(y = Europa_ScoreGT, color = "GT Europa"), size = 1) +
  geom_line(aes(y = Union_ScoreGT, color = "GT Union"), size = 1) +
  geom_line(aes(y = Frankreich_ScoreGT, color = "GT Frankreich"), size = 1) +
  scale_color_manual(values = c("Tagesschau" = "red", "GT EU" = "blue", "GT Europa" = "green", 
                                "GT Union" = "yellow", "GT Frankreich" = "black")) + 
  labs(
    title = "EU - GT vs. TS normalized, based on keyATM",
    x = "Week",
    y = "Value",
    color = "Legend"
  ) +
  theme_minimal()

#MeanGT
ggplot(gt_eu, aes(x = week)) +
  geom_line(aes(y = ts_norm_eu_atm, color = "Tagesschau"), size = 1.8) + 
  geom_line(aes(y = MeanGT, color = "MeanGT"), size = 1) +
  scale_color_manual(values = c("Tagesschau" = "red", "MeanGT" = "blue")) + 
  labs(
    title = "EU - Correlation TS normalized and MeanGT",
    x = "Week",
    y = "Value",
    color = "Legend"
  ) +
  theme_minimal()

# Calculate Correlation
# STM
cor(gt_eu$ts_stm_eu, gt_eu$EU_ScoreGT)
cor(gt_eu$ts_stm_eu, gt_eu$Europa_ScoreGT)
cor(gt_eu$ts_stm_eu, gt_eu$Union_ScoreGT)
cor(gt_eu$ts_stm_eu, gt_eu$Frankreich_ScoreGT)
cor(gt_eu$ts_stm_eu, gt_eu$MeanGT)


# keyATM
cor(gt_eu$ts_atm_eu, gt_eu$EU_ScoreGT)
cor(gt_eu$ts_atm_eu, gt_eu$Europa_ScoreGT)
cor(gt_eu$ts_atm_eu, gt_eu$Union_ScoreGT)
cor(gt_eu$ts_atm_eu, gt_eu$Frankreich_ScoreGT)
cor(gt_eu$ts_atm_eu, gt_eu$MeanGT)


# Additional Plots

# visualize articles per week
case_counts <- as.data.frame(table(TS$week))
colnames(case_counts) <- c("week", "count")
case_counts$week <- as.numeric(case_counts$week)


# Plot published aticles per week
ggplot(case_counts, aes(x = week, y = count)) +
  geom_bar(stat = "identity", fill = "#4A6572") +
  labs(title = "",
       x = "Week",
       y = "Published Articles") +
  scale_x_continuous(breaks = seq(min(case_counts$week), max(case_counts$week), by = 5)) +
  theme_classic()

summary(case_counts$count)






















