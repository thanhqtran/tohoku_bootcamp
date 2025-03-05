install.packages("etwfe")

library(fixest)
library(etwfe)

data(base_stagg)
head(base_stagg)

# "Naive" TWFE DiD (note that the time to treatment for the never treated is -1000)
# (by using ref = c(-1, -1000) we exclude the period just before the treatment and 
# the never treated)
res_twfe = feols(y ~ x1 + i(time_to_treatment, ref = c(-1, -1000)) | id + year, base_stagg)

# To implement the Sun and Abraham (2020) method,
# we use the sunab(cohort, period) function
res_sa20 = feols(y ~ x1 + sunab(year_treated, year) | id + year, base_stagg)

# Plot the two TWFE results
iplot(list(res_twfe, res_sa20), sep = 0.5)

# Add the true results
att_true = tapply(base_stagg$treatment_effect_true, base_stagg$time_to_treatment, mean)[-1]
points(-9:8, att_true, pch = 15, col = 4)

legend("topleft", col = c(1, 4, 2), pch = c(20, 15, 17), 
       legend = c("TWFE", "Truth", "Sun & Abraham (2020)"))

#ATT
summary(res_sa20, agg = "att")
summary(res_sa20, agg = "cohort")


#Wooldridge
res_wool = etwfe(fml = y ~ x1, #only put control variables here
                 tvar = year,          # Time variable
                 gvar = year_treated,  # Cohort (group) variable
                 fe = "feo",  vcov = ~id + year, cgroup= "never",
                 data = base_stagg) 
#ATT
ATT_wool <- emfx(res_wool)
ATT_group <- emfx(res_wool,type = "group") 
ATT_event <- emfx(res_wool,type = "event") 
ATT_event <- ATT_event %>% filter(event >= -9)



ggplot(ATT_event, aes(x = event, y = estimate, ymin = conf.low, ymax = conf.high)) +
  geom_hline(yintercept = 0) +
  geom_vline(xintercept = c(0))+
  geom_pointrange(col = "darkcyan") +
  labs(x = "Year", y = "Effect")

