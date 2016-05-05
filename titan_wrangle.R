library(dplyr)
df <- read.csv("titanic_original.csv")  #importing csv file
df <- tbl_df(df)

# initial setup complete-----------------------------------------------------------

df$embarked <- sub("^$", "S", df$embarked)  #adding "S" to blank values in embarked col.

df$age[is.na(df$age)] <- mean(df$age, na.rm = TRUE)   #add mean age to na values in age col.

df$boat <- sub("^$", "None", df$boat)   #filled empty rows with "None" in boat col.

df$has_cabin_number <- ifelse(df$cabin == "", 0, 1) #

# clean up complete -------------------------------------------------------

write.csv(df, "titanic_clean.csv")   #export cleaned up data
