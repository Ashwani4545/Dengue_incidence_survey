# Load necessary libraries
library(caret)
library(matricks)

# Check if the column 'Haemoglobin Level' exists in the dataset
if ("Haemoglobin Levelr" %in% colnames(Denguefever)) {
  # Check the number of unique values in the 'Haemoglobin Level' column
  unique_values <- unique(Denguefever$"Haemoglobin Level")
  
  # Ensure there are at least two unique values (needed for classification)
  if (length(unique_values) > 1) {
    # Proceed with creating the data partition
    # Split the data into training and testing sets (set seed for reproducibility)
    set.seed(123)
    train_index <- createDataPartition(Denguefever$'Haemoglobin Level', p = 0.7, list = FALSE)
    train_data <- Denguefever[train_index, ]
    test_data <- Denguefever[-train_index, ]
    
    # Check data type of 'Haemoglobin Level' (should be numeric for linear regression)
    if(is.numeric(Denguefever$'Haemoglobin Level')) {
      # Fit a linear regression model (include intercept)
      model <- lm(formula = 'Haemoglobin Level' ~ 1 + ., data = train_data)
      
      # Make predictions on the test data
      predictions <- predict(model, newdata = test_data)
      
      # Round predictions to binary values (0 or 1) for classification (threshold of 0.5)
      binary_predictions <- ifelse(predictions > 0.5, 1, 0)
      
      # Calculate accuracy
      accuracy <- mean(binary_predictions == test_data$'Haemoglobin Level')
      cat("Accuracy:", accuracy, "\n")
      
      # Calculate F1 score
      f1_score <- F1_Score(test_data$'Haemoglobin Level', binary_predictions)
      cat("F1 Score:", f1_score, "\n")
      
    } else {
      print("Error: 'Haemoglobin Level' is not numeric. Linear regression requires a numeric outcome variable.")
    }
  } else {
    # Print a message indicating that there is only one unique value
    print("Error: 'Haemoglobin Level' column has only one unique value. Classification not possible.")
  }
} else {
  # Print a message indicating that the 'Duration of fever' column does not exist
  print("Error: 'Haemoglobin Level' column does not exist in the dataset.")
}
