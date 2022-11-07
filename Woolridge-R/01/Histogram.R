# Load data
data(ceosal1, package='wooldridge')

# Extract ROE to single vector
ROE <- ceosal1$roe

# Subfigure (a): histogram (counts)
hist(ROE)

# Subfigure (b): histogram (densities, explicit breaks)
hist(ROE, breaks=c(0,5,10,20,30,60) )

