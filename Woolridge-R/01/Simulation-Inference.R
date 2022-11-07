# Set the random seed
set.seed(123456)

# initialize vectors to later store results:
r <- 10000
CIlower <- numeric(r); CIupper <- numeric(r)
pvalue1 <- numeric(r); pvalue2 <- numeric(r)

# repeat r times:
for(j in 1:r) {
  # Draw a sample
  sample <- rnorm(100,10,2)
  # test the (correct) null hypothesis mu=10:
  testres1 <- t.test(sample,mu=10)
  # store CI & p value:
  CIlower[j] <- testres1$conf.int[1]
  CIupper[j] <- testres1$conf.int[2]
  pvalue1[j] <- testres1$p.value
  # test the (incorrect) null hypothesis mu=9.5 & store the p value:
  pvalue2[j] <- t.test(sample,mu=9.5)$p.value
}

# Test results as logical value
reject1<-pvalue1<=0.05;  reject2<-pvalue2<=0.05
table(reject1)
table(reject2)