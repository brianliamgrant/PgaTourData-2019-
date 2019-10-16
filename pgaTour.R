library(readr)
pga <- read_table2("Desktop/Oracle Prep/pga")

library(tidyr)
pga$`Player Name` <- paste(pga$FIRST, pga$LAST, sep=" ")

X2019_data <- read_csv("Desktop/Oracle Prep/2019_data.csv")

library(dplyr)
gir <- X2019_data %>% select(`Player Name`, Variable, Value) %>% 
  filter(Variable == "GIR Percentage from Fairway - (%)")
gir

scoringAvg <- X2019_data %>% select(`Player Name`, Variable, Value) %>% 
  filter(Variable == "Scoring Average - (AVG)")
scoringAvg

putt <- X2019_data %>% select(`Player Name`, Variable, Value) %>% 
  filter(Variable == "One-Putt Percentage - (%)")
putt

install.packages("xlsx")
library("xlsx")
write.xlsx(pga, "Desktop/Oracle Prep/data/pga.xlsx", sheetName = "Sheet1", 
           col.names = TRUE, row.names = TRUE, append = FALSE)
write.xlsx(gir, "Desktop/Oracle Prep/data/gir.xlsx", sheetName = "Sheet1", 
           col.names = TRUE, row.names = TRUE, append = FALSE)
write.xlsx(scoringAvg, "Desktop/Oracle Prep/data/scoringAvg.xlsx", sheetName = "Sheet1", 
           col.names = TRUE, row.names = TRUE, append = FALSE)
write.xlsx(putt, "Desktop/Oracle Prep/data/putt.xlsx", sheetName = "Sheet1", 
           col.names = TRUE, row.names = TRUE, append = FALSE)
