data(mroz, package='wooldridge')

# Estimate probit model
probitres<-glm(inlf~nwifeinc+educ+exper+I(exper^2)+age+kidslt6+kidsge6,
                                family=binomial(link=probit),data=mroz)
# Summary of results:
summary(probitres)
# Log likelihood value:
logLik(probitres) 
# McFadden's pseudo R2:
1 - probitres$deviance/probitres$null.deviance
