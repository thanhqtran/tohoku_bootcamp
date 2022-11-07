################################################################
# Test of overall significance:
# Manual calculation of the LR test statistic:
probitres$null.deviance - probitres$deviance

# Automatic calculations including p-values,...:
library(lmtest)
lrtest(probitres)

################################################################
# Test of H0: experience and age are irrelevant
restr <- glm(inlf~nwifeinc+educ+ kidslt6+kidsge6, 
                          family=binomial(link=logit),data=mroz)
lrtest(restr,probitres)
