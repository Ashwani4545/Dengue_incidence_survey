# Load necessary libraries
library(ggplot2)
library(gridExtra)# For arranging plots

# Set the figure size (adjust as needed)
options(repr.plot.width=12, repr.plot.height=8)

# Function to add linear regression line to histogram plot
add_regression_line <- function(p, x_var, y_var) {
  p + geom_smooth(aes(x = !!x_var, y = !!y_var), method = "lm", se = FALSE, color = "red")
}

# Assuming your data is named 'Denguefever' (replace if different)

# Subplot 1: Duration of Fever
p1 <- ggplot(Denguefever, aes(x = `Duration of fever`, fill = "Duration of Fever")) +
  geom_histogram(color = 'darkblue', bins = 20) +
  labs(title = "Duration of Fever", x = "Duration (days)", y = "Frequency") +
  xlim(0, 30) +  # Set custom limits for the x-axis (adjust as needed)
  ylim(0, 100) +  # Set custom limits for the y-axis (adjust as needed)
  theme_minimal()

# Add regression line to subplot 1
p1 <- add_regression_line(p1, "Duration of fever", "Age")

# Subplot 2: Haemoglobin Level
p2 <- ggplot(Denguefever, aes(x = `Haemoglobin Level`, fill = "Haemoglobin Level")) +
  geom_histogram(color = 'black', bins = 20) +
  labs(title = "Haemoglobin Level (g/dL)", x = "Haemoglobin", y = "Frequency") +
  theme_minimal()

# Add regression line to subplot 2
p2 <- add_regression_line(p2, "Haemoglobin Level", "Age")

# ... (similar code for subplots 3-6, replacing variable names)

# Subplot 6: RBC Count (assuming this exists in your data)
p6 <- ggplot(Denguefever, aes(x = `RBC Count`, fill = "RBC Count")) +
  geom_histogram(color = 'darkgreen', bins = 20) +
  labs(title = "Red Blood Cell Count", x = "RBC Count", y = "Frequency") +
  theme_minimal()

# Add regression line to subplot 6
p6 <- add_regression_line(p6, "RBC Count", "Age")

# Arrange plots in a grid (using gridExtra)
grid.arrange(p1, p2, p6, ncol = 2, top = "Dengue Fever Conditions (Histogram with Linear Regression)")
