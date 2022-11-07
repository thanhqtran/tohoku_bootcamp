# Note: "sales" is defined in Data-frames.R, so it has to be run first!
# save data frame as RData file (in the current working directory)
save(sales, file = "oursalesdata.RData")

# remove data frame "sales" from memory
rm(sales)

# Does variable "sales" exist?
exists("sales")

# Load data set  (in the current working directory):
load("oursalesdata.RData")

# Does variable "sales" exist?
exists("sales")

sales

# averages of the variables:
colMeans(sales)
