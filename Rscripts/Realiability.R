library(tidyverse)
clean_data<-read.csv("/Users/siyuan/Desktop/github/Data/Cleaned_Data.csv")
library(psych)

nl_items <- clean_data %>% 
  select(Moderator_1, Moderator_2, Moderator_3, Moderator_4, 
         Moderator_5, Moderator_6, Moderator_7, Moderator_8)
psych::alpha(nl_items)

pi_items <- clean_data %>% 
  select(OM_1, OM_2, OM_3_R, OM_4)
psych::alpha(pi_items)