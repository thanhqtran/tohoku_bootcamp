data(wage1, package='wooldridge')

# OLS regression:
summary( lm(log(wage) ~ educ, data=wage1) )
