#!/usr/bin/env Rscript

# titanic_analysis.R
# Reads Titanic data and produces several ggplot2 visualizations,
# saving all plots into an 'images/' folder.

# Load required libraries
if (!require("tidyverse")) {
  install.packages("tidyverse", repos = "https://cloud.r-project.org")
  library(tidyverse)
}

# Read the data
if (!file.exists("data/titanic.csv")) {
  stop("data/titanic.csv not found. Please ensure the file exists.")
}
titanic <- read.csv("data/titanic.csv", stringsAsFactors = FALSE)

# Convert relevant columns to factors
titanic$Survived <- factor(titanic$Survived, levels = c(0,1), labels = c("No", "Yes"))
titanic$Pclass   <- factor(titanic$Pclass, levels = c(1,2,3), labels = c("1st", "2nd", "3rd"))
titanic$Sex      <- factor(titanic$Sex)

# Create images directory if it doesn't exist
dir.create("images", showWarnings = FALSE)

# 1. Bar plot: Survival count by passenger class
p1 <- ggplot(titanic, aes(x = Pclass, fill = Survived)) +
  geom_bar(position = "dodge") +
  labs(title = "Survival by Passenger Class",
       x = "Passenger Class",
       y = "Count",
       fill = "Survived") +
  theme_minimal()
# Save plot
ggsave(filename = "images/survival_by_class.png", plot = p1, width = 6, height = 4)

# 2. Age distribution histogram colored by survival
p2 <- ggplot(titanic, aes(x = Age, fill = Survived)) +
  geom_histogram(binwidth = 5, position = "identity", alpha = 0.6) +
  labs(title = "Age Distribution by Survival",
       x = "Age",
       y = "Count") +
  theme_minimal()
# Save plot
ggsave(filename = "images/age_distribution_by_survival.png", plot = p2, width = 6, height = 4)

# 3. Boxplot of Fare by Survival
p3 <- ggplot(titanic, aes(x = Survived, y = Fare, fill = Survived)) +
  geom_boxplot() +
  labs(title = "Fare Distribution by Survival",
       x = "Survived",
       y = "Fare (USD)") +
  theme_minimal()
# Save plot
ggsave(filename = "images/fare_distribution_by_survival.png", plot = p3, width = 6, height = 4)

# 4. Proportion bar: Sex vs. Survival
p4 <- ggplot(titanic, aes(x = Sex, fill = Survived)) +
  geom_bar(position = "fill") +
  labs(title = "Proportion of Survival by Sex",
       x = "Sex",
       y = "Proportion") +
  theme_minimal()
# Save plot
ggsave(filename = "images/proportion_survival_by_sex.png", plot = p4, width = 6, height = 4)

message("All plots saved to 'images/' folder.")

