# Install and load required packages
install.packages("xgboost")
library(xgboost)
library(caret)  # For data preprocessing and evaluation

# Assuming your dataset is named 'Denguefever'

# 1. Data Preparation
# Load the dataset
data <- read.csv("path/to/Denguefever.csv")

# Preprocess the data (handle missing values, encode categorical variables, etc.)
# For simplicity, let's assume the data is already preprocessed

# Split the data into training and testing sets
set.seed(123)  # For reproducibility
train_index <- createDataPartition(data$Dengue, p = 0.7, list = FALSE)
train_data <- data[train_index, ]
test_data <- data[-train_index, ]

# 2. Train the XGBoost Model
# Convert data to DMatrix format
dtrain <- xgb.DMatrix(data = as.matrix(train_data[, -which(names(train_data) == "Dengue")]),
                      label = train_data$Dengue)

# Define parameters
params <- list(booster = "gbtree",
               objective = "binary:logistic",  # Binary classification
               eta = 0.3,  # Learning rate
               max_depth = 6,  # Maximum depth of the tree
               eval_metric = "logloss")  # Evaluation metric

# Train the model
xgb_model <- xgboost(data = dtrain, params = params, nrounds = 100)

# 3. Evaluate the Model
# Convert test data to DMatrix format
dtest <- xgb.DMatrix(data = as.matrix(test_data[, -which(names(test_data) == "Dengue")]),
                     label = test_data$Dengue)

# Predictions
pred <- predict(xgb_model, dtest)

# Evaluate the model
confusionMatrix(table(ifelse(pred > 0.5, 1, 0), test_data$Dengue))

# 4. Hyperparameter Tuning (Optional)
# You can use techniques like grid search or Bayesian optimization to tune hyperparameters.
# For simplicity, it's not included in this example.
