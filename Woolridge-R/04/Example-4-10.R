data(meap93, package='wooldridge')

# define new variable within data frame
meap93$b_s <- meap93$benefits / meap93$salary

# Estimate three different models
model1<- lm(log(salary) ~ b_s                       , data=meap93)
model2<- lm(log(salary) ~ b_s+log(enroll)+log(staff), data=meap93)
model3<- lm(log(salary) ~ b_s+log(enroll)+log(staff)+droprate+gradrate
                                                    , data=meap93)
# Load package and display table of results
library(stargazer)
stargazer(list(model1,model2,model3),type="text",keep.stat=c("n","rsq"))
