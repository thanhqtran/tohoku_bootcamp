# Note: run wdi-ctryavg.R first to define "avgdata"!

# Order the levels meaningfully
avgdata$income <- factor( avgdata$income, 
                          levels = c("High income: OECD",
                                     "High income: nonOECD",
                                     "Upper middle income",
                                     "Lower middle income",
                                     "Low income") )
# Plot
ggplot(avgdata, aes(year, LE_avg, color=income)) +
  geom_line(size=1) +                               # thicker lines 
  scale_color_grey() +                              # gray scale
  scale_x_continuous(breaks=seq(1960,2015,10)) +    # adjust x axis breaks  
  theme_light() +                                   # light theme (white background,...)
  labs(title="Life expectancy of women",            
       subtitle="Average by country classification",
       x="Year", y="Life expectancy [Years]",
       color="Income level",
       caption="Source: World Bank, WDI")
