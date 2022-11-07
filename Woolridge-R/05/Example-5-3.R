data(crime1, package='wooldridge')

# 1. Estimate restricted model:
restr <- lm(narr86 ~ pcnv+ptime86+qemp86, data=crime1)

# 2. Regression of residuals from restricted model:
utilde <- resid(restr)
LMreg <- lm(utilde ~ pcnv+ptime86+qemp86+avgsen+tottime, data=crime1)
# R-squared:
(r2 <- summary(LMreg)$r.squared )

# 3. Calculation of LM test statistic:
LM <- r2 * nobs(LMreg)
LM

# 4. Critical value from chi-squared distribution, alpha=10%:
qchisq(1-0.10, 2)

# Alternative to critical value: p value
1-pchisq(LM, 2)

# Alternative: automatic F test (see above)
library(car)
unrestr <- lm(narr86 ~ pcnv+ptime86+qemp86+avgsen+tottime, data=crime1)
linearHypothesis(unrestr, c("avgsen=0","tottime=0"))
