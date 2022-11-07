# Note: run Example-18-8.R first to generate the results res1 and res2

# Actual unemployment and forecasts:
y  <- window(tsdat,start=1997)[,"unem"]
f1 <- predict( res1, newdata=window(tsdat,start=1997) )
f2 <- predict( res2, newdata=window(tsdat,start=1997) )

# Plot unemployment and forecasts:
matplot(time(y), cbind(y,f1,f2), type="l",  col="black",lwd=2,lty=1:3)
legend("topleft",c("Unempl.","Forecast 1","Forecast 2"),lwd=2,lty=1:3)

# Forecast errors:
e1<- y - f1
e2<- y - f2

# RMSE:
sqrt(mean(e1^2))
sqrt(mean(e2^2))

# MAE:
mean(abs(e1))
mean(abs(e2))
