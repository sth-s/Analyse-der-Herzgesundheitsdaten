heart_data <- read.csv("heart.csv")

boxplot(MaxHR ~ Sex, data = heart_data, 
        col = c("pink", "lightblue"),
        main = "Distribution of Max HR in Women and Men",
        xlab = "Sex", ylab = "MaxHR")