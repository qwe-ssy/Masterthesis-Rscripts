library(tidyverse)
clean_data<-read.csv("/Users/siyuan/Desktop/github/Data/Cleaned_Data.csv")

mc1_anova <- aov(MC1 ~ as.factor(Label_Condition), data = clean_data)
summary(mc1_anova)

mc2_anova <- aov(MC2 ~ as.factor(Message_Presence), data = clean_data)
summary(mc2_anova)

age_anova <- aov(Age ~ as.factor(Label_Condition) * as.factor(Message_Presence), data = clean_data)
summary(age_anova)

chisq.test(clean_data$Gender, clean_data$Label_Condition)
chisq.test(clean_data$Gender, clean_data$Message_Presence)