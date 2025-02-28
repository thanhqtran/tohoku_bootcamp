# Install and load necessary packages
install.packages("ggplot2", dependencies = TRUE)
install.packages("dplyr", dependencies = TRUE)
install.packages("tidyr", dependencies = TRUE)
install.packages("car", dependencies = TRUE)
install.packages("lmtest", dependencies = TRUE)
install.packages("sandwich", dependencies = TRUE)
install.packages("fixest", dependencies = TRUE)   # For fixed-effects regression
install.packages("xtable", dependencies = TRUE)   # For summary table

library(ggplot2)
library(dplyr)
library(car)
library(lmtest)
library(sandwich)
library(fixest)
library(xtable)
library(tidyr)

# Load dataset
# data <- read.csv(file.choose())
# try this to load directly from git
dat_url = 'https://github.com/thanhqtran/tohoku_bootcamp/blob/main/2025_spring/econometrics/preGeneralTrade.csv'
data <- read.csv(url(dat_url))


# Remove missing values
data <- na.omit(data)


# Transform variables for Gravity Model
data <- data %>%
  mutate(
    log_trade = log(PrimaryValue),
    log_exporter_GDP = log(Exporter_GDP),
    log_importer_GDP = log(Importer_GDP),
    log_distance = log(dist)
  )

#### 1️⃣ GRAVITY MODEL ####

# 1a. OLS Gravity Model using `lm()`
gravity_model_ols <- feols(log_trade ~ log_exporter_GDP + log_importer_GDP + log_distance +
                          Exporter_EXRate + Importer_EXRate + contig + comlang_off + colony, se = "HC1", 
                        data = data)

# Display OLS Model Results
summary(gravity_model_ols)



# 1b. Fixed-Effects Gravity Model using `fixest`
gravity_model_fixest <- feols(log_trade ~ log_exporter_GDP + log_importer_GDP + log_distance +
                                Exporter_EXRate + Importer_EXRate + contig + comlang_off + colony| ReporterISO+ PartnerISO + Period,
                              se = "HC1",  # Cluster SEs at the exporter level
                              data = data)

# Display Fixed-Effects Model Results
summary(gravity_model_fixest)

# Comparison: OLS vs. Fixed-Effects
etable(gravity_model_ols,gravity_model_fixest)
etable(gravity_model_ols,gravity_model_fixest, tex = TRUE)


#### 2️⃣ PRE-TREATMENT SUMMARY TABLE ####

# Define list of Asian countries (ISO codes)
#Assume we have some shock in Asia in 2015
asian_countries <- c("CHN", "JPN", "KOR", "IND", "THA", "VNM", "PHL", "MYS", 
                     "SGP", "IDN", "PAK", "BGD")
policy_year <- 2015


data <- data %>%
  mutate(
    treatment = ifelse(ReporterISO %in% asian_countries, 1, 0),  # 1 if exporting country is Asian
    post = ifelse(RefYear >= policy_year, 1, 0),  # 1 if year is 2015 or later
    treatment_post = treatment * post  # Interaction term
  )

# Filter pre-treatment data (before 2015)
pre_treatment_data <- data %>% filter(RefYear < 2015)

# Filter pre-treatment data (before 2015)
pre_treatment_data <- data %>% filter(post == 0)

summary_table_means <- pre_treatment_data %>%
  group_by(treatment) %>%
  summarise(
    Trade_Value = mean(PrimaryValue, na.rm = TRUE),
    Exporter_GDP = mean(Exporter_GDP, na.rm = TRUE),
    Importer_GDP = mean(Importer_GDP, na.rm = TRUE),
    Distance = mean(dist, na.rm = TRUE),
    Exporter_EXRate = mean(Exporter_EXRate, na.rm = TRUE),
    Importer_EXRate = mean(Importer_EXRate, na.rm = TRUE)
  ) %>%
  pivot_longer(cols = -treatment, names_to = "Variable", values_to = "Mean") %>%
  mutate(Group = ifelse(treatment == 1, "Asian Exporters", "Non-Asian Exporters")) %>%
  select(-treatment) %>%
  pivot_wider(names_from = Group, values_from = Mean)

summary_table_sds <- pre_treatment_data %>%
  group_by(treatment) %>%
  summarise(
    Trade_Value = sd(PrimaryValue, na.rm = TRUE),
    Exporter_GDP = sd(Exporter_GDP, na.rm = TRUE),
    Importer_GDP = sd(Importer_GDP, na.rm = TRUE),
    Distance = sd(dist, na.rm = TRUE),
    Exporter_EXRate = sd(Exporter_EXRate, na.rm = TRUE),
    Importer_EXRate = sd(Importer_EXRate, na.rm = TRUE)
  ) %>%
  pivot_longer(cols = -treatment, names_to = "Variable", values_to = "SD") %>%
  mutate(Group = ifelse(treatment == 1, "Asian Exporters", "Non-Asian Exporters")) %>%
  select(-treatment) %>%
  pivot_wider(names_from = Group, values_from = SD)

# Merge means and SDs correctly
summary_table <- inner_join(summary_table_means, summary_table_sds, by = "Variable") %>%
  mutate(
    `Asian Exporters` = paste0(round(`Asian Exporters.x`, 2), " (", round(`Asian Exporters.y`, 2), ")"),
    `Non-Asian Exporters` = paste0(round(`Non-Asian Exporters.x`, 2), " (", round(`Non-Asian Exporters.y`, 2), ")")
  ) %>%
  select(Variable, `Asian Exporters`, `Non-Asian Exporters`)

# Perform t-tests
t_tests <- list(
  Trade_Value = t.test(PrimaryValue ~ treatment, data = pre_treatment_data),
  Exporter_GDP = t.test(Exporter_GDP ~ treatment, data = pre_treatment_data),
  Importer_GDP = t.test(Importer_GDP ~ treatment, data = pre_treatment_data),
  Distance = t.test(dist ~ treatment, data = pre_treatment_data),
  Exporter_EXRate = t.test(Exporter_EXRate ~ treatment, data = pre_treatment_data),
  Importer_EXRate = t.test(Importer_EXRate ~ treatment, data = pre_treatment_data)
)

# Extract p-values and apply significance stars
p_values <- sapply(t_tests, function(test) test$p.value)
stars <- ifelse(p_values < 0.01, "***", 
                ifelse(p_values < 0.05, "**", 
                       ifelse(p_values < 0.10, "*", "")))

# Merge p-values into the table (only for means, not SDs)
summary_table <- summary_table %>%
  mutate(`p-value` = paste0(round(p_values, 3), stars))

# Print formatted table using xtable
summary_table

#### 3️⃣ DIFFERENCE-IN-DIFFERENCES (DiD) ESTIMATION ####

# Run Difference-in-Differences (DiD) regression
did_model <- feols(log_trade ~ treatment + post + treatment_post +
                     log_exporter_GDP + log_importer_GDP + log_distance + 
                     Exporter_EXRate + Importer_EXRate, data = data)

# Display Model Results
summary(did_model)

# Step 3: Visualize Trade Trends Before & After 2015
data %>%
  group_by(RefYear, treatment) %>%
  summarize(mean_trade = mean(PrimaryValue, na.rm = TRUE)) %>%
  ggplot(aes(x = RefYear, y = mean_trade, color = as.factor(treatment))) +
  geom_line(size = 1.2) +
  labs(title = "Trade Trends: Asian vs Non-Asian Exporters",
       x = "Year", y = "Mean Trade Value",
       color = "Treatment Status (Asian Exporters = 1)") +
  theme_minimal()

# Step 4: Event Study Plot
event_study_model <- feols(log_trade ~ i(RefYear, treatment, ref = policy_year) +
                             log_exporter_GDP + log_importer_GDP + log_distance + 
                             Exporter_EXRate + Importer_EXRate, data = data)

iplot(event_study_model, xlab = "Years", main = "Event Study: Impact on Trade by Asian Exporters")
