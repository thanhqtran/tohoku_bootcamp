data(rdchem, package='wooldridge')

# Regression
reg <- lm(rdintens~sales+profmarg, data=rdchem)

# Studentized residuals for all observations:
studres <- rstudent(reg)

# Display extreme values:
min(studres)
max(studres)

# Histogram (and overlayed density plot):
hist(studres, freq=FALSE)
lines(density(studres), lwd=2)
