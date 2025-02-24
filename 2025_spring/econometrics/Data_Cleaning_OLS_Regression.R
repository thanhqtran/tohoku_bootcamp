

# ================================
# 0. INSTALL & LOAD REQUIRED PACKAGES
# ================================

if (!require(tidyverse)) install.packages("tidyverse")
if (!require(car)) install.packages("car")
if (!require(faraway)) install.packages("faraway")
if (!require(ggplot2)) install.packages("ggplot2")
if (!require(dplyr)) install.packages("dplyr")

# Load each package individually
library(tidyverse)
library(car)
library(faraway)
library(ggplot2)
library(dplyr)

# ================================
# 1. READ DATA
# ================================

# Let the user select the file interactively
df <- read.csv(file.choose())

# ================================
# 2. DATA CLEANING
# ================================

# Select columns
df1 <- df %>%
  select(State,Poverty,PCT_Unemployed, PCT_Recent_Drug_Use, PCT_Major_Depression, PCT_Disabled)  


# Convert categorical columns to factors
df <- df %>%
  mutate(across(where(is.character), as.factor))

# Filter data for California only (example condition)
df_CA <- df %>% filter(State == "California")

# Check for duplicates and remove them
df <- df %>% distinct()

# Drop rows with missing values
df <- df %>% drop_na()

na_counts <- colSums(is.na(df))
print("Missing values per column:")
print(na_counts)

# ================================
# 3. BASIC SUMMARY STATISTICS
# ================================

# Summary of dependent variable (Life Expectancy)
summary(df$Average_Life_Expectancy)

# Summary of independent variables
summary(df %>% select(Poverty, PCT_Unemployed, PCT_Major_Depression, PCT_Disabled))

# ================================
# 4. DATA VISUALIZATION
# ================================

# Scatter plot: Poverty vs Life Expectancy
ggplot(df, aes(x = Poverty, y = Average_Life_Expectancy)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", col = "red") +
  labs(title = "Poverty vs Life Expectancy", x = "Poverty Rate", y = "Life Expectancy")

# Histogram of Life Expectancy
ggplot(df, aes(x = Average_Life_Expectancy)) +
  geom_histogram(binwidth = 1, fill = "lightblue", color = "black") +
  labs(title = "Distribution of Life Expectancy", x = "Life Expectancy", y = "Count")

# Density plot of Unemployment Rate
ggplot(df, aes(x = PCT_Unemployed)) +
  geom_density(fill = "orange", alpha = 0.5) +
  labs(title = "Density Plot of Unemployment Rate", x = "Unemployment Rate", y = "Density")

# ================================
# 5. OLS REGRESSION
# ================================

# Define model variables
model <- lm(Average_Life_Expectancy ~ Poverty + PCT_Unemployed + PCT_Major_Depression + PCT_Disabled, data = df)

# Summary of the regression
summary(model)

# ================================
# 6. COLLINEARITY CHECK (VIF)
# ================================

# Check for Variance Inflation Factor (VIF)
vif_values <- vif(model)
print(vif_values)

# ================================
# 7. RESIDUAL DIAGNOSTICS
# ================================

# Directly generate residual plots for all predictors
residualPlots(model)

# QQ plot for residuals
qqPlot(model, main = "QQ Plot of Residuals")

# ================================
# 8. MARGINAL MODEL PLOTS (MMP)
# ================================

# Marginal Model Plots
mmp(model)


# ================================
# 9. MODEL SELECTION METRICS (AIC & BIC)
# ================================

# Calculate AIC & BIC
aic_value <- AIC(model)
bic_value <- BIC(model)

print(paste("AIC:", aic_value))
print(paste("BIC:", bic_value))

# ================================
# 10. WRITE CLEANED DATA TO FILE
# ================================

# Let the user choose where to save the cleaned data
write.csv(df, file = file.choose(new = TRUE))

