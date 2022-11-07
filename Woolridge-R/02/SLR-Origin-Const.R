data(ceosal1, package='wooldridge')

# Usual OLS regression:
(reg1 <- lm( salary ~ roe, data=ceosal1))

# Regression without intercept (through origin):
(reg2 <- lm( salary ~ 0 + roe, data=ceosal1))

# Regression without slope (on a constant):
(reg3 <- lm( salary ~ 1 , data=ceosal1))

# average y:
mean(ceosal1$salary)

# Scatter Plot with all 3 regression lines
plot(ceosal1$roe, ceosal1$salary, ylim=c(0,4000))
abline(reg1, lwd=2, lty=1)
abline(reg2, lwd=2, lty=2)
abline(reg3, lwd=2, lty=3)
legend("topleft",c("full","through origin","const only"),lwd=2,lty=1:3)