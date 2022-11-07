# Repeating the regression from Example 6.2:
data(hprice2, package='wooldridge')

res <- lm( log(price) ~ log(nox)+log(dist)+rooms+I(rooms^2)+stratio,
                                                         data=hprice2)

# Automatic effects plot using the package "effects"
library(effects)
plot( effect("rooms",res) )
