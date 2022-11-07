data(mlb1, package='wooldridge')

# Unrestricted OLS regression:
res.ur <- lm(log(salary) ~ years+gamesyr+bavg+hrunsyr+rbisyr, data=mlb1)

# Restricted OLS regression:
res.r <- lm(log(salary) ~ years+gamesyr, data=mlb1)

# R2:
( r2.ur <- summary(res.ur)$r.squared )
( r2.r <- summary(res.r)$r.squared )

# F statistic:
( F <- (r2.ur-r2.r) / (1-r2.ur) * 347/3 )

# p value = 1-cdf of the appropriate F distribution:
1-pf(F, 3,347)
