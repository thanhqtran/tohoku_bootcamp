data(wage1, package='wooldridge')

# OLS regression:
lmres <- lm(log(wage) ~ educ+exper+tenure, data=wage1)

# Regression output:
summary(lmres)

# Load package "car" (has to be installed):
library(car)
# Automatically calculate VIF :
vif(lmres)
