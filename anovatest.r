library(tidyverse)
library(readxl)
library(rstatix)
torontodata <- read_csv("C:/Users/jacob/Documents/HighVisCrosswalks/Toronto/Products/TorontoCrosswalksCrashVehiclePed.csv.csv")
torontodata <- torontodata %>% reorder_levels(TYPECHANGESIMPLE, order = c("High-Vis Unchanging","Low-Vis Unchanging","Low-to-High-Vis"))
res.aov <- torontodata %>% anova_test(CrashChange~TYPECHANGESIMPLE+CarsChange+PedsChange)
res.aov
torontodata <- torontodata %>% reorder_levels(CarsCategory, order = c("HIGHTRAFFIC","MEDIUMTRAFFIC","LOWTRAFFIC"))
torontodata <- torontodata %>% reorder_levels(PedsCategory, order = c("HIGHTRAFFIC","MEDIUMTRAFFIC","LOWTRAFFIC"))
res.aov <- torontodata %>% anova_test(CrashChange~TYPECHANGESIMPLE+CarsCategory+PedsCategory)
res.aov
