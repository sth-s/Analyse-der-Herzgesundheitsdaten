library(ggplot2)
library(dplyr)

heart_data <- read.csv("heart.csv")

heart_data$ChestPainTypeOverall <- 'All'

# Durchschnitt und Varianz berechnen
stats <- heart_data %>%
  group_by(ChestPainType) %>%
  summarise(
    Mean = mean(RestingBP, na.rm = TRUE),
    SD = sd(RestingBP, na.rm = TRUE)
  ) %>%
  ungroup() 

overall_stats <- data.frame(
  ChestPainType = "All",
  Mean = mean(heart_data$RestingBP, na.rm = TRUE),
  SD = sd(heart_data$RestingBP, na.rm = TRUE)
)

stats <- rbind(stats, overall_stats)

# Violin-Grafik
p <- ggplot() +
  geom_violin(data = heart_data, aes(x=ChestPainTypeOverall, y=RestingBP), trim=FALSE, fill="lightblue", color="blue", scale="width") +
  geom_violin(data = heart_data, aes(x=ChestPainType, y=RestingBP), trim=FALSE, fill="lightblue", color="blue", scale="width") +
  geom_point(data = stats, aes(x=ChestPainType, y=Mean), color="red", size=3) +
  geom_errorbar(data = stats, aes(x=ChestPainType, ymin=Mean-SD, ymax=Mean+SD), width=0.2, color="darkred") +
  labs(title="RestingBP Distributions for ChestPainType Categories and Overall",
       x="Category",
       y="RestingBP") +
  theme_minimal() +
  scale_x_discrete(limits=c(unique(heart_data$ChestPainType), "All"))

print(p)