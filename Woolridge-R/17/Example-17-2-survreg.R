# Estimate Tobit model using survreg:
library(survival)
res <- survreg(Surv(hours, hours>0, type="left") ~ nwifeinc+educ+exper+
             I(exper^2)+age+kidslt6+kidsge6, data=mroz, dist="gaussian")
summary(res)
