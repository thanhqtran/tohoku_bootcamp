library(plm);library(stargazer)
data(wagepan, package='wooldridge')

# Generate pdata.frame:
wagepan.p <- pdata.frame(wagepan, index=c("nr","year") )

# Estimate FE parameter in 3 different ways:
wagepan.p$yr<-factor(wagepan.p$year)
reg.fe <-(plm(lwage~married+union+yr*educ,data=wagepan.p, model="within"))
reg.dum<-( lm(lwage~married+union+yr*educ+factor(nr), data=wagepan.p))
reg.re <-(plm(lwage~married+union+yr*educ,data=wagepan.p, model="random"))
reg.cre<-(plm(lwage~married+union+yr*educ+Between(married)+Between(union)
                                         ,data=wagepan.p, model="random"))
