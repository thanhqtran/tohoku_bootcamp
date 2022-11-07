# Note that the estimates "reg.cre" are calculated in
# Script "Example-Dummy-CRE-1.R" which has to be run first.

# RE test as an F test on the "Between" coefficients 
library(car)
linearHypothesis(reg.cre, matchCoefs(reg.cre,"Between"))
