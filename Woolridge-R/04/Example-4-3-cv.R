# CV for alpha=5% and 1% using the t distribution with 137 d.f.:
alpha <- c(0.05, 0.01)
qt(1-alpha/2, 137)

# Critical values for alpha=5% and 1% using the normal approximation:
qnorm(1-alpha/2)
