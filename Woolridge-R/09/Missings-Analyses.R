data(lawsch85, package='wooldridge')

# Mean of a variable with missings:
mean(lawsch85$LSAT)
mean(lawsch85$LSAT,na.rm=TRUE)

# Regression with missings
summary(lm(log(salary)~LSAT+cost+age, data=lawsch85))
