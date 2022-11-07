data(wage1, package='wooldridge')

# Estimate log-level model
lm( log(wage) ~ educ, data=wage1 )