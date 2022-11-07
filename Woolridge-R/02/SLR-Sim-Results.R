# MC estimate of the expected values:
mean(b0hat)
mean(b1hat)

# MC estimate of the variances:
var(b0hat)
var(b1hat)

# Initialize empty plot
plot( NULL, xlim=c(0,8), ylim=c(0,6), xlab="x", ylab="y")
# add OLS regression lines
for (j in 1:10) abline(b0hat[j],b1hat[j],col="gray")
# add population regression line
abline(b0,b1,lwd=2)
# add legend
legend("topleft",c("Population","OLS regressions"),
                           lwd=c(2,1),col=c("black","gray"))
