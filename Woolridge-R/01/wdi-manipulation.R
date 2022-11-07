library(dplyr)

# filter: only US data
ourdata <- filter(wdi_raw, iso2c=="US")
# rename lifeexpectancy variable
ourdata <- rename(ourdata, LE_fem=SP.DYN.LE00.FE.IN)
# select relevant variables
ourdata <- select(ourdata, year, LE_fem)
# order by year (increasing)
ourdata <- arrange(ourdata, year)

# Head and tail of data
head(ourdata)
tail(ourdata)

# Graph
library(ggplot2)
ggplot(ourdata, aes(year, LE_fem)) + 
  geom_line() +
  theme_light() +
  labs(title="Life expectancy of females in the US",
       subtitle="World Bank: World Development Indicators",
       x = "Year",
       y = "Life expectancy [years]"
       ) 