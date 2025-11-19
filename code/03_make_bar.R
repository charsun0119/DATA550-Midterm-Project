here::i_am("code/make_bar.R")

data <- readRDS(
  file = here::here("data/covid_data.rds"))

library(ggplot2)

bar <-
  ggplot(
    data, 
    mapping = aes(x = PATIENT_TYPE, fill = SEX)) +
  geom_bar(position="fill") +
  labs(
    title = "Proportion of the Type of Care Patients Received by Sex",
    x = "Patient Type",
    y = "Proportion") 

ggsave(
  here::here("output/bar_graph.png"),
  plot = bar,
  device = "png")



