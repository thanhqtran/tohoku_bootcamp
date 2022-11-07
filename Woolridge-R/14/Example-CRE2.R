library(plm)
data(wagepan, package='wooldridge')

# Generate pdata.frame:
wagepan.p <- pdata.frame(wagepan, index=c("nr","year") )

# Estimate CRE parameters
wagepan.p$yr<-factor(wagepan.p$year)
summary(plm(lwage~married+union+educ+black+hisp+Between(married)+
                         Between(union), data=wagepan.p, model="random"))
