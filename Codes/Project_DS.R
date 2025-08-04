library(readxl)
library(dplyr)
library(ggplot2)

#1
print(
  ggplot(Denguefever, aes(x=Age, y=`Duration of fever`)) + 
    geom_point() + 
    labs(title="Dengue Prediction", x="Age", y="Duration of fever")
)
#2
print(
  ggplot(Denguefever, aes(x=Age, y=`Haemoglobin Level`)) + 
    geom_point() + 
    labs(title="Dengue Prediction", x="Age", y="Haemoglobin Level")
)
#3
print(
  ggplot(Denguefever, aes(x=Age, y=`PCV count`)) + 
    geom_point() + 
    labs(title="Dengue Prediction", x="Age", y="PCV count")
)
#4
print(
  ggplot(Denguefever, aes(x=Age, y=`Platelets Count`)) + 
    geom_point() + 
    labs(title="Dengue Prediction", x="Age", y="Platelets Count")
)
#5
print(
  ggplot(Denguefever, aes(x=Age, y=`Leukocytes Count`)) + 
    geom_point() + 
    labs(title="Dengue Prediction", x="Age", y="Leukocytes Count")
)
#6
print(
  ggplot(Denguefever, aes(x=Age, y=`RBC Count`)) + 
    geom_point() + 
    labs(title="Dengue Prediction", x="Age", y="RBC Count")
)