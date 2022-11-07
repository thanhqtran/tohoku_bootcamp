library(car)
data(hprice2, package='wooldridge')
res <- lm(log(price)~log(nox)+log(dist)+poly(rooms,2,raw=TRUE)+
           stratio,data=hprice2)

# Manual F test for rooms:
linearHypothesis(res, matchCoefs(res,"rooms"))

# ANOVA (type 2) table:
Anova(res)