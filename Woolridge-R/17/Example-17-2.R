data(mroz, package='wooldridge')

# Estimate Tobit model using censReg:
library(censReg)
TobitRes <- censReg(hours~nwifeinc+educ+exper+I(exper^2)+ 
                                    age+kidslt6+kidsge6, data=mroz )
summary(TobitRes)

# Partial Effects at the average x:
margEff(TobitRes)
