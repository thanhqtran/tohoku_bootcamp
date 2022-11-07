data(CPS1985,package="AER")

# Regression
res <- lm(log(wage) ~ education+experience+gender+occupation, data=CPS1985)

# ANOVA table
car::Anova(res)
