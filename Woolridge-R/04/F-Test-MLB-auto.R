data(mlb1, package='wooldridge')

# Unrestricted OLS regression:
res.ur <- lm(log(salary) ~ years+gamesyr+bavg+hrunsyr+rbisyr, data=mlb1)

# Load package "car" (which has to be installed on the computer)
library(car)

# F test
myH0 <- c("bavg","hrunsyr","rbisyr")
linearHypothesis(res.ur, myH0)
