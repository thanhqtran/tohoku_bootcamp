data(gpa1, package='wooldridge')

# Determine sample size & no. of regressors:
n <- nrow(gpa1); k<-2

# extract y
y <- gpa1$colGPA

# extract X & add a column of ones
X <- cbind(1, gpa1$hsGPA, gpa1$ACT)

# Display first rows of X:
head(X)

# Parameter estimates:
( bhat <- solve( t(X)%*%X ) %*% t(X)%*%y )

# Residuals, estimated variance of u and SER:
uhat <- y - X %*% bhat
sigsqhat <- as.numeric( t(uhat) %*% uhat / (n-k-1) )
( SER <- sqrt(sigsqhat) )

# Estimated variance of the parameter estimators and SE:
Vbetahat <- sigsqhat * solve( t(X)%*%X )
( se <- sqrt( diag(Vbetahat) ) )