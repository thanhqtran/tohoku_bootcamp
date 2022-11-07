
data(ceosal1, package='wooldridge')

# sample average:
mean(ceosal1$salary)
# sample median:
median(ceosal1$salary)
#standard deviation:
sd(ceosal1$salary)
# summary information:
summary(ceosal1$salary)

# correlation with ROE:
cor(ceosal1$salary, ceosal1$roe)
