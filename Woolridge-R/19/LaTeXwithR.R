library(stargazer);library(xtable)
data(gpa1, package='wooldridge')


# Number of obs.
sink("numb-n.txt"); cat(nrow(gpa1)); sink()
# generate frequency table in file "tab-gender.txt"
gender <- factor(gpa1$male,labels=c("female","male"))
sink("tab-gender.txt")
xtable( table(gender) )
sink()

# calculate OLS results
res1 <- lm(colGPA ~ hsGPA      , data=gpa1)
res2 <- lm(colGPA ~         ACT, data=gpa1)
res3 <- lm(colGPA ~ hsGPA + ACT, data=gpa1)

# write regression table to file "tab-regr.txt"
sink("tab-regr.txt")
stargazer(res1,res2,res3, keep.stat=c("n","rsq"),
              type="latex",title="Regression Results",label="t:reg")
sink()

# b1 hat
sink("numb-b1.txt"); cat(round(coef(res1)[2],3)); sink()

# Generate graph as PDF file
pdf(file = "regr-graph.pdf", width = 3, height = 2)
par(mar=c(2,2,1,1))
plot(gpa1$hsGPA, gpa1$colGPA)
abline(res1)
dev.off()

