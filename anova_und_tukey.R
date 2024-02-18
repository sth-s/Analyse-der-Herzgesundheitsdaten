data <- read.csv("heart.csv")

data$ChestPainType <- as.factor(data$ChestPainType)

anova_result <- aov(RestingBP ~ ChestPainType, data = data)

anova_summary <- summary(anova_result)
print(anova_summary)

# Post-Hoc-Test durchführen, falls ANOVA signifikant ist
if (anova_summary[[1]]$'Pr(>F)'[1] < 0.05) {
  posthoc_result <- TukeyHSD(anova_result)
  print(posthoc_result)
} else {
  print("Keine signifikanten Unterschiede gefunden")
}
