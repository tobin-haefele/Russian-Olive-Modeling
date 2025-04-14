library(gbm)
library(dismo)


# Drop geometry and ensure PA is numeric (0/1)
df <- st_drop_geometry(survey_sf)

df$PA <- as.numeric(as.character(df$PA))  # if PA is still a factor

brt_model <- gbm.step(
  data = df,
  gbm.x = which(names(df) != "PA"),  # predictor columns
  gbm.y = which(names(df) == "PA"),  # response column
  family = "bernoulli",              # binomial outcome
  tree.complexity = 5,               # depth of individual trees
  learning.rate = 0.01,              # step size
  bag.fraction = 0.5,                # subsampling rate
  step.size = 50,                    # trees added per iteration
  verbose = TRUE
)


gbm.plot(brt_model, n.plots = 9)

pd <- plot.gbm(brt_model,
               i.var = "LEVEL2",
               return.grid = TRUE)

# Add factor levels to x-axis
pd$LEVEL2 <- factor(pd$LEVEL2, labels = levels(df$LEVEL2))

# Plot with ggplot2
ggplot(pd, aes(x = LEVEL2, y = y)) +
  geom_col(fill = "steelblue") +
  theme_minimal() +
  labs(
    title = "Partial Dependence: LEVEL2 Landcover",
    x = "Landcover Type",
    y = "Effect on Predicted Probability"
  ) +
  coord_flip()