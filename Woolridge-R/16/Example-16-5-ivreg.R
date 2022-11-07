library(AER)
data(mroz, package='wooldridge')
oursample <- subset(mroz,!is.na(wage))

# 2SLS regressions
summary( ivreg(hours~log(wage)+educ+age+kidslt6+nwifeinc
           |educ+age+kidslt6+nwifeinc+exper+I(exper^2), data=oursample))
summary( ivreg(log(wage)~hours+educ+exper+I(exper^2)
           |educ+age+kidslt6+nwifeinc+exper+I(exper^2), data=oursample))
