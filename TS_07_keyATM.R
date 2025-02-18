# Applying keyATM based on topics identified in in 04_Topic Mpodels STM.

keyATM_docs <- keyATM_read(texts = TS_For_DFM)

keywords <- list(
  usa = c("usa", "trump", "biden", "harris"),
  mideast = c("israel", "gaza", "hamas", "iran"),
  ukraine = c("ukraine", "russland", "kiew", "selenskyj"),
  eu = c("eu", "europa", "union", "frankreich")
)

key_topics <- keyATM(
  docs = keyATM_docs,
  no_keyword_topics = 4,
  keywords = keywords,
  model = "base",
  options = list(seed = 2025)
)

# result
top_words(key_topics)
plot_topicprop(key_topics, show_topic = 1:4)


# extract theta to assign keyATM dominants topic to TS$text
keyATM_topic_probs <- key_topics$theta
TS$ATM_dominant_topic <- apply(keyATM_topic_probs, 1, which.max)

# Mutate TS$ATM_dominant_topic, to transform numbers to defined topic names based on keyword list.

TS <- TS %>%
  mutate(ATM_dominant_topic = case_when(
    ATM_dominant_topic == 1 ~ "USA",
    ATM_dominant_topic == 2 ~ "Middle_East",
    ATM_dominant_topic == 3 ~ "Ukraine",
    ATM_dominant_topic == 4 ~ "EU",
    ATM_dominant_topic %in% 5:8 ~ "other",
    TRUE ~ as.character(ATM_dominant_topic)  # Falls andere Werte existieren, bleiben sie erhalten
  ))


plot(TS$ATM_dominant_topic)


TS %>%
  count(ATM_dominant_topic) %>%  # Zähle die Häufigkeiten der Kategorien
  ggplot(aes(x = reorder(ATM_dominant_topic, -n), y = n, fill = ATM_dominant_topic)) +
  geom_col() +  # Erstellt die Balken
  labs(x = "Topic",
       y = "Count") +
  theme_classic() +
  theme(legend.position = "none")  # Entfernt die Legende (optional)
