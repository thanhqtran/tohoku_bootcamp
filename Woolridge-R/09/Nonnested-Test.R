data(hprice1, package='wooldridge')

# two alternative models
model1 <- lm(price ~     lotsize  +     sqrft  + bdrms, data=hprice1)
model2 <- lm(price ~ log(lotsize) + log(sqrft) + bdrms, data=hprice1)

# Test against comprehensive model
library(lmtest)
encomptest(model1,model2, data=hprice1)
