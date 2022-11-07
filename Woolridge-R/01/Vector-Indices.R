# Create a vector "avgs":
avgs <- c(.366, .358, .356, .349, .346)

# Create a string vector of names:
players <- c("Cobb","Hornsby","Jackson","O'Doul","Delahanty")

# Assign names to vector and display vector:
names(avgs) <- players
avgs

# Indices by number:
avgs[2]
avgs[1:4]

# Indices by name:
avgs["Jackson"]

# Logical indices:
avgs[ avgs>=0.35 ]
