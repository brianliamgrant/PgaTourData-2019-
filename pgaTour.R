#for reading the txt file created after using python to get earnings data from ESPN
library(readr)
pga <- read_table2("Desktop/Oracle Prep/pga")

#create a player name key that matches the data from kaggle
library(tidyr)
pga$`Player Name` <- paste(pga$FIRST, pga$LAST, sep=" ")
pga$FIRST <- NULL 
pga$LAST <- NULL 
pga

#for reading the csv file downloaded from kaggle
X2019_data <- read_csv("Desktop/Oracle Prep/2019_data.csv")
X2019_data 

#for filtering through the massive csv file to get the 3 stats to compare to earnings (gir, scoring and putting)
library(dplyr)
gir <- X2019_data %>% select(`Player Name`, Variable, Value) %>% 
  filter(Variable == "GIR Percentage from Fairway - (%)")
gir

scoringAvg <- X2019_data %>% select(`Player Name`, Variable, Value) %>% 
  filter(Variable == "Scoring Average - (AVG)")
scoringAvg

final1 <- merge(gir, scoringAvg, by="Player Name")
final1

putt <- X2019_data %>% select(`Player Name`, Variable, Value) %>% 
  filter(Variable == "One-Putt Percentage - (%)")
putt

final2 <- merge(final1, putt, by="Player Name")
final2

#making the final dataset that only keeps the sme 30 names from the earnings data for better use in OAC
final <- final2 %>% select(`Player Name`, Variable.x, Value.x, Variable.y, Value.y, Variable, Value) %>% 
  filter(`Player Name` == pga$`Player Name`)
final

#turning the created data frames into excel files to import into OAC
install.packages("xlsx")
library("xlsx")
write.xlsx(pga, "Desktop/Oracle Prep/data/pga.xlsx", sheetName = "Sheet1", 
           col.names = TRUE, row.names = TRUE, append = FALSE)
write.xlsx(final, "Desktop/Oracle Prep/data/final.xlsx", sheetName = "Sheet1", 
           col.names = TRUE, row.names = TRUE, append = FALSE)



