library(gbm)
library(dismo)


gbm_preds <- survey_sf %>%
  st_drop_geometry() %>%
  mutate(GBM_Pred = NA_real_)

# Loop through each fold
for (k in seq_along(folds)) {
  train_ids <- unlist(folds[[k]][1])
  test_ids  <- unlist(folds[[k]][2])
  
  train_data <- survey_sf[train_ids, ] %>% st_drop_geometry()
  test_data  <- survey_sf[test_ids, ] %>% st_drop_geometry()
  
  train_data$PA <- as.integer(as.character(train_data$PA))
  test_data$PA  <- as.integer(as.character(test_data$PA))
  
  # Fit the GBM model
  model <- gbm(
    formula = PA ~ .,
    data = train_data,
    distribution = "bernoulli",
    interaction.depth = 5,
    shrinkage = 0.01,
    bag.fraction = 0.5,
    train.fraction = 1.0,
    verbose = FALSE
  )
  
  # Use early stopping with OOB estimate
  best_iter <- gbm.perf(model, method = "cv")
  
  # Predict on test data
  preds <- predict(model, newdata = test_data, n.trees = best_iter, type = "response")
  
  gbm_preds$GBM_Pred[test_ids] <- preds
}

pred <- prediction(gbm_preds$GBM_Pred, gbm_preds$PA)
perf <- performance(pred, "tpr", "fpr")
plot(perf, main = "ROC - GBM (blockCV)", col = "blue", lwd = 2)
abline(a = 0, b = 1, lty = 2, col = "gray")

auc <- performance(pred, "auc")@y.values[[1]]
print(paste("AUC:", round(auc, 3)))


