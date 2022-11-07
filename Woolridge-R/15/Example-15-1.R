library(AER);library(stargazer)
data(mroz, package='wooldridge')

# restrict to non-missing wage observations
oursample <- subset(mroz, !is.na(wage))

# OLS slope parameter manually
with(oursample, cov(log(wage),educ) / var(educ) )
# IV slope parameter manually
with(oursample, cov(log(wage),fatheduc) / cov(educ,fatheduc) )


# OLS automatically
reg.ols <-   lm(log(wage) ~ educ, data=oursample)

# IV automatically 
reg.iv <- ivreg(log(wage) ~ educ | fatheduc, data=oursample) 

# Pretty regression table
stargazer(reg.ols,reg.iv, type="text")
