library(plyr)
library(dplyr)
library(tidyr)
df <- read.csv("titanic_original.csv")  #importing csv file
df <- tbl_df(df)


df$embarked <- sub("^$", "S", df$embarked)  #adding "S" to blank values in embarked col.

age_mean <- mean(df$age, na.rm = TRUE)
df$age[is.na(df$age)] <- age_mean


View(df)
