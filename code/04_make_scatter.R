here::i_am("code/make_scatter.R")

data <- readRDS(
  file = here::here("data/covid_data.rds"))

library(ggplot2)

regression <- glm(DEATH ~ DIABETES + AGE + SEX + CLASIFFICATION_FINAL, 
                  data = data, family = binomial)
reg_data <- model.frame(regression)
reg_data$pred_prob <- predict(regression, type = "response")
reg_data <- reg_data[order(reg_data$pred_prob), ]

scatterplot <- ggplot(reg_data, aes(x = pred_prob, y = DEATH)) +
  geom_jitter(height = 0.05, alpha = 0.3) +
  stat_smooth(method = "glm", se = FALSE, color = "blue", linewidth = 1.2, 
              method.args = list(family=binomial)) +
  labs(
    x = "Predicted probability of death",
    y = "Observed death (0/1)",
    title = "Observed vs Predicted"
  ) +
  theme_minimal()

ggsave(
  here::here("output/scatterplot.png"),
  plot = scatterplot,
  device = "png")


