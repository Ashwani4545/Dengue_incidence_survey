# Convert variables to factors
Denguefever$`Duration of fever` <- as.factor(Denguefever$`Duration of fever`)
Denguefever$`Haemoglobin Level` <- as.factor(Denguefever$`Haemoglobin Level`)
Denguefever$`PCV count` <- as.factor(Denguefever$`PCV count`)
Denguefever$`Platelets Count` <- as.factor(Denguefever$`Platelets Count`)
Denguefever$`Leukocytes Count` <- as.factor(Denguefever$`Leukocytes Count`)
Denguefever$`RBC Count` <- as.factor(Denguefever$`RBC Count`)

# Load necessary libraries
library(ggplot2)

# Set the figure size
options(repr.plot.width=12, repr.plot.height=8)

# Pie chart 1
p1 <- ggplot(Denguefever, aes(x = "", fill = `Duration of fever`)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Duration of Fever", fill = "Duration of Fever") +
  theme_void()

# Pie chart 2
p2 <- ggplot(Denguefever, aes(x = "", fill = `Haemoglobin Level`)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Haemoglobin Level", fill = "Haemoglobin Level") +
  theme_void()

# Pie chart 3
p3 <- ggplot(Denguefever, aes(x = "", fill = `PCV count`)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y") +
  labs(title = "PCV Count", fill = "PCV Count") +
  theme_void()

# Pie chart 4
p4 <- ggplot(Denguefever, aes(x = "", fill = `Platelets Count`)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Platelets Count", fill = "Platelets Count") +
  theme_void()

# Pie chart 5
p5 <- ggplot(Denguefever, aes(x = "", fill = `Leukocytes Count`)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y") +
  labs(title = "Leukocytes Count", fill = "Leukocytes Count") +
  theme_void()

# Pie chart 6
p6 <- ggplot(Denguefever, aes(x = "", fill = `RBC Count`)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y") +
  labs(title = "RBC Count", fill = "RBC Count") +
  theme_void()

# Arrange plots in a grid
grid.arrange(p1, p2, p3, p4, p5, p6, ncol = 2, top = "Conditions During Dengue Fever (Piechart)")
