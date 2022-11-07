A <- matrix( c(2,-4,-1,5,7,0), nrow=2)
B <- matrix( c(2,1,0,3,-1,5), nrow=2)
A
B
A*B

# Transpose:
(C <- t(B) )

# Matrix multiplication:
(D <- A %*% C )

# Inverse:
solve(D)