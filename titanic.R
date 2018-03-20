library(readr)
library(tidyr)
library(dplyr)
titanic_original <- read_csv("Documents/Springboard/Assignments/Titanic/titanic_original.csv")
View(titanic_original)
#find missing values in embarkement and replace them with S
which(is.na(titanic_original$embarked))
titanic_original$embarked[169] <- "S"
titanic_original$embarked[285] <- "S"
titanic_original$embarked[1310] <- "S"

#use the mean of the age column to replace missing values in Age
titanic_original$age <- ifelse(is.na(titanic_original$age), mean(titanic_original$age, na.rm = TRUE), titanic_original$age)

#fill empty slots in boat column with the sting 'None'
titanic_original$boat <- ifelse(is.na(titanic_original$boat), "None", titanic_original$boat)

#create new column 'has_cabin_number': 1 if passenger does, 0 if not
titanic_original <- titanic_original %>%
  mutate(has_cabin_number = ifelse(is.na(titanic_original$cabin), 0, 1))

write.csv(titanic_original, file = "titanic_clean.csv")