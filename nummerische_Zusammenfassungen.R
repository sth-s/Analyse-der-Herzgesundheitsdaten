library(readr)

data <- read_csv("heart.csv")

min_max_values <- data.frame(
  Minimum = sapply(data[, c("Age", "RestingBP", "Cholesterol", "MaxHR")], min),
  Maximum = sapply(data[, c("Age", "RestingBP", "Cholesterol", "MaxHR")], max),
  Mean = sapply(data[, c("Age", "RestingBP", "Cholesterol", "MaxHR")], mean),
  Variance = sapply(data[, c("Age", "RestingBP", "Cholesterol", "MaxHR")], var)
)

print(min_max_values)

