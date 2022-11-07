library(WDI); library(dplyr)

# Download raw life expectency data
le_data <- WDI(indicator=c("SP.DYN.LE00.FE.IN"), start = 1960, end = 2014) %>% 
  rename(LE = SP.DYN.LE00.FE.IN)

tail(le_data)

# Country-data on income classification
ctryinfo <- as.data.frame(WDI_data$country, stringsAsFactors = FALSE) %>% 
  select(country, income)

tail(ctryinfo)

# Join:
alldata <- left_join(le_data, ctryinfo)

tail(alldata)