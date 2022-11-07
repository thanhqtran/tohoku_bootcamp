library(plm);library(stargazer)
data(wagepan, package='wooldridge')

# Generate pdata.frame:
wagepan.p <- pdata.frame(wagepan, index=c("nr","year") )

pdim(wagepan.p)

# Check variation of variables within individuals
pvar(wagepan.p)
