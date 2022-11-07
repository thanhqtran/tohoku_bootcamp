# degrees of freedom = n-1:
df <- 19
# significance levels:
alpha.one.tailed = c(0.1, 0.05, 0.025, 0.01, 0.005, .001)
alpha.two.tailed = alpha.one.tailed * 2

# critical values & table:
CV <- qt(1 - alpha.one.tailed, df)
cbind(alpha.one.tailed, alpha.two.tailed, CV)
