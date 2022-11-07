# F-Tests using different variance-covariance formulas:
myH0 <- c("black","white")
# Ususal VCOV
linearHypothesis(reg, myH0)
# Refined White VCOV
linearHypothesis(reg, myH0, vcov=hccm)
# Classical White VCOV
linearHypothesis(reg, myH0, vcov=hccm(reg,type="hc0"))
