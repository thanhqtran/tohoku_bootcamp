
data(audit, package='wooldridge')

# store test results as a list "testres"
testres <- t.test(audit$y)

# print results:
testres

# component names: which results can be accessed?
names(testres)

# p-value
testres$p.value