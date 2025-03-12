library(ggplot2)
library(dplyr)
library(car)
library(lmtest)
library(sandwich)
library(fixest)
library(xtable)
library(tidyr)
library(etwfe)

#Read Data
dat_url = 'https://raw.githubusercontent.com/thanhqtran/tohoku_bootcamp/refs/heads/main/2025_spring/econometrics/preGeneralTrade.csv'
data <- read.csv(url(dat_url))

#Data Cleaning
#Generate Log Variables for later OLS
data <- data %>%
  mutate(
    log_trade = log(PrimaryValue),
    log_exporter_GDP = log(Exporter_GDP),
    log_importer_GDP = log(Importer_GDP),
    log_distance = log(dist)
  )

#Generate the EXRate of exporter against importer
data$EXR <- data$Exporter_EXRate / data$Importer_EXRate

#Generate Treatment dummy (Europe)
european_countries <- c("ALB", "AND", "AUT", "BEL", "BGR", "BIH", "BLR", "CHE", "CYP",
                        "CZE", "DEU","DNK", "ESP", "EST", "FIN", "FRA", "GBR", "GRC", "HRV", "HUN", "IRL", "ISL",
                        "ITA", "KOS", "LIE", "LTU", "LUX", "LVA", "MCO", "MDA", "MKD", "MLT", "MNE", "NLD","NOR", "POL", "PRT", "ROU", "RUS", "SMR", "SRB", "SVK", "SVN", "SWE", "UKR", "VAT")

policy_period <- 201403

data <- data %>%
  mutate(
    treatment = ifelse(ReporterISO %in% european_countries, 1, 0),  # 1 if exporting country is European
    post = ifelse(Period >= policy_period, 1, 0),  # 1 if year is 2015 or later
    treatment_post = treatment * post  # Interaction term
  )

#If you want to use time index

data$Time_Index <- 12 * (data$RefYear - 2014) + (data$RefMonth-3) 
data$post2 <- ifelse(data$Time_Index >= 0, 1, 0)
identical(data$post, data$post2)

#Run the traditional
DiD1 <- feols(log_trade ~ treatment_post + log_exporter_GDP + log_importer_GDP + log_distance + EXR + contig + comlang_off + colony | ReporterISO + PartnerISO + Period,  data)
DiD2 <- feols(log_trade ~ treatment_post + log_exporter_GDP + log_importer_GDP + log_distance + EXR + contig + comlang_off + colony | ReporterISO + PartnerISO + Period, se = "HC1", data)
etable(DiD1, DiD2)

#time interactions
DiD3 <- feols(log_trade ~ i(Time_Index, treatment, 0) + log_exporter_GDP + log_importer_GDP + log_distance + EXR + contig + comlang_off + colony | ReporterISO + PartnerISO + Period, vcov = "twoway", data)
iplot(DiD3)

#Staggered DiD
#Create the Treatment satrting time varaible (Group Variables)
data$Group <- case_when(data$treatment == 0 ~ "Group_0", 
                         data$ReporterISO == "DEU"| data$ReporterISO == "FRA" | data$ReporterISO == "GBR" ~ "Group_1",
                         .default = "Group_2")

data <- mutate(data, Group_0 = ifelse(Group == "Group_0", 1, 0))
data <- mutate(data, Group_1 = ifelse(Group == "Group_1", 1, 0))
data <- mutate(data, Group_2 = ifelse(Group == "Group_2", 1, 0))

data$Time_Treated <- case_when(data$Group_1 == 1 ~ 0, data$Group_2 == 1 ~ 10,
                                .default = -1000)

#SunAb
DiD_SunAb <- feols(log_trade ~ sunab(Time_Treated,Time_Index)+ log_exporter_GDP + log_importer_GDP + log_distance + EXR | ReporterISO + PartnerISO + Period,  data)
iplot(DiD_SunAb)
summary(DiD_SunAb, agg = "att")
summary(DiD_SunAb, agg = "cohort")

#Wooldridge #Be careful, dont put too many control, it will take forever and will not converge
DiD_Wooldridge <- etwfe(log_trade ~  log_exporter_GDP + log_importer_GDP, tvar = Time_Index, gvar = Time_Treated, data, fe = "feo")
emfx(DiD_Wooldridge)
emfx(DiD_Wooldridge, type = "group")
