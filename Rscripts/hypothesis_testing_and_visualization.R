install.packages("effectsize")
library(tidyverse)
library(effectsize)
clean_data<-read.csv("/Users/siyuan/Desktop/github/Data/Cleaned_Data.csv")

clean_data <- clean_data %>%
  mutate(
    Label_Condition = as.factor(Label_Condition),
    Message_Presence = as.factor(Message_Presence),
    NL_Group = as.factor(NL_Group)
  )
main_anova <- aov(Purchase_Int ~ Label_Condition * Message_Presence * NL_Group, data = clean_data)
summary(main_anova)
eta_squared(main_anova, partial = TRUE)

plot_data <- clean_data %>%
  group_by(Label_Condition, Message_Presence, NL_Group) %>%
  summarise(
    Mean_PI = mean(Purchase_Int, na.rm = TRUE),
    SE = sd(Purchase_Int, na.rm = TRUE) / sqrt(n()),
    .groups = "drop"
  )

interaction_plot <- ggplot(plot_data, aes(x = Label_Condition, y = Mean_PI, fill = Message_Presence)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.8), width = 0.7, color = "black") +
  geom_errorbar(aes(ymin = Mean_PI - SE, ymax = Mean_PI + SE), 
                position = position_dodge(width = 0.8), width = 0.25) +
  facet_wrap(~ NL_Group, labeller = labeller(NL_Group = c(`0` = "Low Nutrition Literacy", `1` = "High Nutrition Literacy"))) +
  labs(
    title = "Interaction Effect on Purchase Intention",
    x = "Label Condition (0 = Incongruent, 1 = Congruent)",
    y = "Purchase Intention (Mean)",
    fill = "Message Presence"
  ) +
  theme_classic() +
  scale_fill_brewer(palette = "Blues")
print(interaction_plot)