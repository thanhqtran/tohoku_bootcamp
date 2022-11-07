# Note: run wdi-ctryinfo.R first to define "alldata"!

# Summarize by country and year
avgdata <- alldata %>%     
  filter(income != "Aggregates") %>%           # remove rows for aggregates
  filter(income != "Not classified") %>%       # remove unclassified ctries
  group_by(income, year) %>%                   # group by income classification
  summarize(LE_avg = mean(LE, na.rm=TRUE)) %>% # average by group 
  ungroup()                                    # remove grouping

# First 6 rows:
tail(avgdata)

# plot
ggplot(avgdata, aes(year, LE_avg, color=income)) +
  geom_line() +
  scale_color_grey()
