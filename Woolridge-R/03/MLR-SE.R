data(gpa1, package='wooldridge')

# Full estimation results including automatic SE :
res <- lm(colGPA ~ hsGPA+ACT, data=gpa1)
summary(res)

# Extract SER (instead of calculation via residuals)
( SER <- summary(res)$sigma )

# regressing hsGPA on ACT for calculation of R2 & VIF
( R2.hsGPA  <- summary( lm(hsGPA~ACT, data=gpa1) )$r.squared )
( VIF.hsGPA <- 1/(1-R2.hsGPA) )

# manual calculation of SE of hsGPA coefficient:
n <- nobs(res)
sdx <- sd(gpa1$hsGPA) * sqrt((n-1)/n)  # (Note: sd() uses the (n-1) version)
( SE.hsGPA <- 1/sqrt(n) * SER/sdx  * sqrt(VIF.hsGPA) )
