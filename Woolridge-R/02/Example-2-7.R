data(wage1, package='wooldridge')

WAGEregres <- lm(wage ~ educ, data=wage1)

# obtain coefficients, predicted values and residuals
b.hat <- coef(WAGEregres)
wage.hat <- fitted(WAGEregres)
u.hat <- resid(WAGEregres)

# Confirm property (1):
mean(u.hat)

# Confirm property (2):
cor(wage1$educ , u.hat)

# Confirm property (3):
mean(wage1$wage)
b.hat[1] + b.hat[2] * mean(wage1$educ)