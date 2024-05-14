
df <- readRDS("df.rds")

library(tidymodels)
library(mice)
md.pattern(df)
imputation <- mice(df, seed = 2024, printFlag=F, method = "rf")

indexes_missing_values <- which(is.na(df$rating_bus))

imputation_1 <- complete(imputation, action = 1)
imputation_2 <- complete(imputation, action = 2)
imputation_3 <- complete(imputation, action = 3)
imputation_4 <- complete(imputation, action = 4)
imputation_5 <- complete(imputation, action = 5)

split <- initial_split(imputation_5)
train <- training(split)
test <- testing(split)
rec <- recipe(rating ~ ., data = train)

rf <- rand_forest(mode = "classification", mtry = 5, trees = 100) %>% 
  set_engine("ranger")

wflow <- workflow() %>% 
  add_recipe(rec) %>% 
  add_model(rf)

wflow_fit <- fit(wflow, data = train)

pred_test <- predict(wflow_fit, test)

cm <- pred_test %>% 
  bind_cols(test) %>%
  conf_mat(truth = rating, estimate = .pred_class)

summary(cm)
