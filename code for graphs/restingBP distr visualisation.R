library(ggplot2)
library(readr)
library(dplyr)

data <- read_csv("heart.csv")

# Durchschnitt und Varianz berechnen
mean_bp <- mean(data$RestingBP)
sd_bp <- sd(data$RestingBP)

# Dichte-Grafik
density_plot <- ggplot(data, aes(x = RestingBP)) +
  geom_density(fill = "blue", color = "black") +
  labs(title = "Probability Distribution of Resting Blood Pressure",
       x = "RestingBP",
       y = "Density")

# Normmalverteilung dazu
x_values <- seq(min(data$RestingBP), max(data$RestingBP), length.out = 1000)
normal_curve <- data.frame(RestingBP = x_values, Density = dnorm(x_values, mean = mean_bp, sd = sd_bp))

# Zwei Grafiken kombinieren
final_plot <- density_plot +
  geom_line(data = normal_curve, aes(x = RestingBP, y = Density), color = "red") +
  theme_minimal()

final_plot







