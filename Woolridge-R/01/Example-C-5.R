# Note: we reuse variables from Example-C-3.R. It has to be run first!
# t statistic for H0: mu=0:
(t <- avgy/se)

# Critical values for t distribution with n-1=240 d.f.:
alpha.one.tailed = c(0.1, 0.05, 0.025, 0.01, 0.005, .001)
CV <- qt(1 - alpha.one.tailed, n-1)
cbind(alpha.one.tailed, CV)