data(gpa3, package='wooldridge')

# load packages (which need to be installed!)
library(lmtest); library(car)

# Estimate model (only for spring data)
reg <- lm(cumgpa~sat+hsperc+tothrs+female+black+white, 
                                     data=gpa3, subset=(spring==1))
# Usual SE:
coeftest(reg)
# Refined White heteroscedasticity-robust SE:
coeftest(reg, vcov=hccm)