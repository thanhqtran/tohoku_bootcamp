data(vote1, package='wooldridge')

# OLS regression (parentheses for immediate output):
( VOTEres <- lm(voteA ~ shareA, data=vote1) )

# scatter plot with regression line:
with(vote1, plot(shareA, voteA))
abline(VOTEres)