data(gpa1, package='wooldridge')

# Store results under "sumres" and display full table:
( sumres <- summary( lm(colGPA ~ hsGPA+ACT+skipped, data=gpa1) ) )

# Manually confirm the formulas: Extract coefficients and SE
regtable <- sumres$coefficients
bhat <- regtable[,1]
se   <- regtable[,2]

# Reproduce t statistic
( tstat <- bhat / se )
# Reproduce p value
( pval  <- 2*pt(-abs(tstat),137) )
