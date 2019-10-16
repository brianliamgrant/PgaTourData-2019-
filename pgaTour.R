library(readr)
pga <- read_table2("Desktop/Oracle Prep/pga")

library(tidyr)
pga$`Player Name` <- paste(pga$FIRST, pga$LAST, sep=" ")
pga

X2019_data <- read_csv("Desktop/Oracle Prep/2019_data.csv")

pga
X2019_data 

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

write_csv(pga, "Desktop/Oracle Prep/pga.csv")
write_csv(gir, "Desktop/Oracle Prep/gir.csv")
write_csv(scoringAvg, "Desktop/Oracle Prep/scoringAvg.csv")
write_csv(putt, "Desktop/Oracle Prep/putt.csv")


