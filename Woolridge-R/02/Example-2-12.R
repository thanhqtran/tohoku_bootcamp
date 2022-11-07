data(meap93, package='wooldridge')

# Estimate the model and save the results as "results"
results <- lm(math10 ~ lnchprg, data=meap93)

# Number of obs.
( n <- nobs(results) )
# SER:
(SER <- sd(resid(results)) * sqrt((n-1)/(n-2)) )
# SE of b0hat & b1hat, respectively:
SER / sd(meap93$lnchprg) / sqrt(n-1) * sqrt(mean(meap93$lnchprg^2))
SER / sd(meap93$lnchprg) / sqrt(n-1)

# Automatic calculations:
summary(results)