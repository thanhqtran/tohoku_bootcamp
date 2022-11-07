# load package
library(ggplot2)

# Generate ggplot2 graph:
ggplot() + geom_point( data=mpg, mapping=aes(x=displ, y=hwy) )