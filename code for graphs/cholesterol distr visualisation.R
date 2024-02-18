library(ggplot2)
library(readr)
library(dplyr)

data <- read_csv("heart.csv")

# Durchschnitt und Varianz berechnen
mean_bp <- mean(data$Cholesterol)
sd_bp <- sd(data$Cholesterol)

# Dichte-Grafik
density_plot <- ggplot(data, aes(x = Cholesterol)) +
  geom_density(fill = "blue", color = "black") +
  labs(title = "Probability Distribution of Cholesterol",
       x = "Cholesterol",
       y = "Density")

# Normalverteilung
x_values <- seq(min(data$Cholesterol), max(data$Cholesterol), length.out = 1000)
normal_curve <- data.frame(Cholesterol = x_values, Density = dnorm(x_values, mean = mean_bp, sd = sd_bp))

# Zwei Grafiken kombinieren
final_plot <- density_plot +
  geom_line(data = normal_curve, aes(x = Cholesterol, y = Density), color = "red") +
  theme_minimal()

final_plot