library(ggplot2)
library(dplyr)

heart_data <- read.csv("heart.csv")

ggplot(heart_data, aes(x=RestingBP, fill=ChestPainType)) +
  geom_density(alpha=0.5) +
  facet_wrap(~ChestPainType) +
  stat_function(fun=dnorm, args=list(mean=mean(heart_data$RestingBP, na.rm=TRUE), 
                                     sd=sd(heart_data$RestingBP, na.rm=TRUE)), 
                color="red", linetype="dashed") +
  theme_minimal() +
  labs(title="Probability Distribution of RestingBP for ChestPainType",
       x="Resting Blood Pressure",
       y="Density")
