# Example 17.3: Regression table (run Example-17-3-1.R first!)
library(stargazer) # package for regression output
stargazer(lm.res,Poisson.res,QPoisson.res,type="text",keep.stat="n")
