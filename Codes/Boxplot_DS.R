# Load necessary library
library(dplyr)
library(ggplot2)
library(gridExtra)

# Set the figure size
options(repr.plot.width=12, repr.plot.height=8)

# Assuming your dataset is named 'Denguefever'
df <- Denguefever

# Subplot 1
p1 <- ggplot(df, aes(y = `Duration of fever`, fill = "Duration of Fever")) +
  geom_boxplot(color = 'darkblue') +
  labs(title = "Duration of Fever", y = "Duration of Fever") +
  theme_minimal()

# Subplot 2
p2 <- ggplot(df, aes(y = `Haemoglobin Level`, fill = "Haemoglobin Level")) +
  geom_boxplot(color = 'black') +
  labs(title = "Haemoglobin Level", y = "Haemoglobin Level") +
  theme_minimal()

# Subplot 3
p3 <- ggplot(df, aes(y = `PCV count`, fill = "PCV Count")) +
  geom_boxplot(color = 'grey') +
  labs(title = "PCV Count", y = "PCV Count") +
  theme_minimal()

# Subplot 4
p4 <- ggplot(df, aes(y = `Platelets Count`, fill = "Platelets Count")) +
  geom_boxplot(color = 'lightgreen') +
  labs(title = "Platelets Count", y = "Platelets Count") +
  theme_minimal()

# Subplot 5
p5 <- ggplot(df, aes(y = `Leukocytes Count`, fill = "Leukocytes Count")) +
  geom_boxplot(color = 'orange') +
  labs(title = "Leukocytes Count", y = "Leukocytes Count") +
  theme_minimal()

# Subplot 6
p6 <- ggplot(df, aes(y = `RBC Count`, fill = "RBC Count")) +
  geom_boxplot(color = 'darkgreen') +
  labs(title = "RBC Count", y = "RBC Count") +
  theme_minimal()

# Arrange plots in a grid
grid.arrange(p1, p2, p3, p4, p5, p6, ncol = 2, top = "Conditions During Dengue Fever (Boxplot)")
