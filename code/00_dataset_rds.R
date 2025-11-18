here::i_am("code/00_dataset_rds.R")

covid_data <- read.csv("data/covid_sub.csv")

# Create variable tracking instances of death
covid_data$DEATH <- ifelse(is.na(covid_data$DATE_DIED), 0, 1)

saveRDS(
  covid_data, 
  file = here::here("data/covid_data.rds")
)
