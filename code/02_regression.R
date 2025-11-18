library(dplyr)
library(gtsummary)
library(here)

here::i_am("code/02_regression.R")

data <- read.csv(file = here::here("data/covid_sub.csv"))
setwd(here::here())

data <- data %>%
  mutate(death = case_when(
    is.na(DATE_DIED) ~ 0,
    TRUE ~ 1
  ))

data <- data %>%
  mutate(classification = case_when(
    CLASIFFICATION_FINAL == 1 ~ 1,
    CLASIFFICATION_FINAL == 2 ~ 2,
    CLASIFFICATION_FINAL == 3 ~ 3,
    TRUE ~ 0
  ))

regression <- glm(death ~ DIABETES + AGE + SEX + classification, data = data,
                  family = binomial)

regression_table <- tbl_regression(
  regression,
  exponentiate = TRUE,
  label = list(
    DIABETES ~ "Diabetes",
    SEX ~ "Sex",
    AGE ~ "Age (years)",
    classification ~ "COVID Classification"
  )
)

saveRDS(regression_table, file =  here::here("output", "regression_table.rds"))

