x <- c(-1,0,1,NA,NaN,-Inf,Inf)
logx <- log(x)
invx <- 1/x
ncdf <- pnorm(x)
isna <- is.na(x)

data.frame(x,logx,invx,ncdf,isna)
