# Generating matrix A from one vector with all values:
v <- c(2,-4,-1,5,7,0)
( A <- matrix(v,nrow=2) )

# Generating matrix A from two vectors corresponding to rows:
row1 <- c(2,-1,7); row2 <- c(-4,5,0)
( A <- rbind(row1, row2) )

# Generating matrix A from three vectors corresponding to columns:
col1 <- c(2,-4); col2 <- c(-1,5); col3 <- c(7,0)
( A <- cbind(col1, col2, col3) )

# Giving names to rows and columns:
colnames(A) <- c("Alpha","Beta","Gamma")
rownames(A) <- c("Aleph","Bet") 
A

# Diaginal and identity matrices: 
diag( c(4,2,6) )
diag( 3 )

# Indexing for extracting elements (still using A from above):
A[2,1]
A[,2]
A[,c(1,3)]