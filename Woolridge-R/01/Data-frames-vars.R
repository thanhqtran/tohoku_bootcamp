# Accessing a single variable:
sales$product2

# Generating a new  variable in the data frame:
sales$totalv1 <- sales$product1 + sales$product2 + sales$product3 

# The same but using "with":
sales$totalv2 <- with(sales, product1+product2+product3)

# The same but using "attach":
attach(sales)
sales$totalv3 <- product1+product2+product3
detach(sales)

# Result:
sales