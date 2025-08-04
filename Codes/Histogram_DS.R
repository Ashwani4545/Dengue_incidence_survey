install.packages("gridExtra")

# Load necessary libraries
library(ggplot2)
library(gridExtra)  # Load gridExtra for grid.arrange()

# Set the figure size
options(repr.plot.width=12, repr.plot.height=8)

# Subplot 1
p1 <- ggplot(Denguefever, aes(x = `Duration of fever`, fill = "Duration of Fever")) +
  geom_histogram(color = 'darkblue', bins = 20) +
  labs(title = "Duration of Fever", x = "Duration", y = "Frequency") +
  xlim(0, 30) +  # Set custom limits for the x-axis
  ylim(0, 100) +  # Set custom limits for the y-axis
  theme_minimal()

# Subplot 2
p2 <- ggplot(Denguefever, aes(x = `Haemoglobin Level`, fill = "Haemoglobin Level")) +
  geom_histogram(color = 'black', bins = 20) +
  labs(title = "Haemoglobin Level", x = "Haemoglobin", y = "Frequency") +
  theme_minimal()

# Subplot 3
p3 <- ggplot(Denguefever, aes(x = `PCV count`, fill = "PCV Count")) +
  geom_histogram(color = 'grey', bins = 20) +
  labs(title = "Packed Cell Volume", x = "PCV Count", y = "Frequency") +
  theme_minimal()

# Subplot 4
p4 <- ggplot(Denguefever, aes(x = `Platelets Count`, fill = "Platelets Count")) +
  geom_histogram(color = 'lightgreen', bins = 20) +
  labs(title = "Platelets Count", x = "Platelets", y = "Frequency") +
  theme_minimal()

# Subplot 5
p5 <- ggplot(Denguefever, aes(x = `Leukocytes Count`, fill = "Leukocytes Count")) +
  geom_histogram(color = 'orange', bins = 20) +
  labs(title = "Leukocytes Count", x = "Leukocytes", y = "Frequency") +
  theme_minimal()

# Subplot 6
p6 <- ggplot(Denguefever, aes(x = `RBC Count`, fill = "RBC Count")) +
  geom_histogram(color = 'darkgreen', bins = 20) +
  labs(title = "Red Blood Cell Count", x = "RBC Count", y = "Frequency") +
  theme_minimal()

# Arrange plots in a grid
grid.arrange(p1, p2, p3, p4, p5, p6, ncol = 2, top = "Conditions During Dengue Fever (Histogram)")
