here::i_am("code/01_descriptive_stats.R")

data <- readRDS(
  file = here::here("data/covid_data.rds")
)

head(covid_data)
library(gtsummary)
library(dplyr)

# Create Bivariate Analysis Table using gtsummary
tbl <- covid_data %>%
  select(DIABETES, DEATH, SEX, AGE, PREGNANT, COPD, ASTHMA, INMSUPR, HIPERTENSION, CARDIOVASCULAR, RENAL_CHRONIC, OTHER_DISEASE, INTUBED, ICU) %>%
  tbl_summary(by = DIABETES, missing = "no", 
              label = list(
                DEATH ~ "Death Instance",
                SEX ~ "Gender", 
                AGE ~ "Age",
                PREGNANT ~ "Pregnancy Status",
                COPD ~ "COPD",
                ASTHMA ~ "Asthma", 
                INMSUPR ~ "Immunosuppression", 
                HIPERTENSION ~ "Hypertension", 
                CARDIOVASCULAR ~ "Cardiovascular Disease", 
                RENAL_CHRONIC ~ "Chronic Renal Disease", 
                OTHER_DISEASE ~ "Other Disease", 
                INTUBED ~ "Intubation Done", 
                ICU ~ "ICU Placement")) %>%
  add_p(test = everything() ~ "fisher.test", 
        test.args = everything() ~ list(simulate.p.value = TRUE))

saveRDS(
  tbl,
  file = here::here("output/table_one.rds")
)
