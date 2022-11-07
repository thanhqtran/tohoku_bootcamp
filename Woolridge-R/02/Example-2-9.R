data(vote1, package='wooldridge')

VOTEres <- lm(voteA ~ shareA, data=vote1)

# Summary of the regression results
summary(VOTEres)

# Calculate R^2 manually:
var( fitted(VOTEres) ) / var( vote1$voteA )
