# Automatic APE calculations with package mfx
library(mfx)
logitmfx(inlf~nwifeinc+educ+exper+I(exper^2)+age+kidslt6+kidsge6, 
                                              data=mroz, atmean=FALSE)
