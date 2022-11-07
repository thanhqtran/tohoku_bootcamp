# The data set is stored on the local computer in 
# ~/data/wooldridge/affairs.dta

# Version 1: from package. make sure to install.packages(wooldridge)
data(affairs, package='wooldridge')

# Version 2: Adjust path
affairs2 <- rio::import("~/data/wooldridge/affairs.dta")

# Version 3: Change working directory
setwd("~/data/wooldridge")
affairs3 <- rio::import("affairs.dta")

# Version 4: directly load from internet
affairs4 <- rio::import("http://fmwww.bc.edu/ec-p/data/wooldridge/affairs.dta")

# Compare, e.g. avg. value of naffairs:
mean(affairs$naffairs)
mean(affairs2$naffairs)
mean(affairs3$naffairs)
mean(affairs4$naffairs)
