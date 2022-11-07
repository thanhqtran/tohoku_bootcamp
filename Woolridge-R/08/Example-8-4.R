data(hprice1, package='wooldridge')

# Estimate model
reg <- lm(price~lotsize+sqrft+bdrms, data=hprice1)
reg

# Automatic BP test
library(lmtest)
bptest(reg)

# Manual regression of squared residuals 
summary(lm( resid(reg)^2 ~ lotsize+sqrft+bdrms, data=hprice1))
