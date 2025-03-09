install.packages("rdd")  # Install if not already installed
install.packages("rdrobust")  # Install if not already installed
library(rdrobust)
library(rdd)
library(ggplot2)

set.seed(123)

# Generate Running Variable X (Centered at 0)
n <- 500
X <- runif(n, -50, 50)  # Running variable from -50 to 50

# Treatment assignment: D = 1 if X >= 0, otherwise 0
D <- ifelse(X >= 0, 1, 0)

# Generate Outcome Variable Y with Discontinuity at X = 0
Y <- 50 + 0.5 * X + 30 * D + rnorm(n, 0, 10)

# Create Data Frame
RDdata <- data.frame(X, Y, D)

# Check first few rows
head(RDdata)

# Kernel-weighted RD estimation at cutoff X = 0
rd_kernel <- rdrobust(y = RDdata$Y, x = RDdata$X, c = 0)

# Display results
summary(rd_kernel)

#Try diffeerent kernel #adding extra orders, p = # of orders
rd_triangular <- rdrobust(y = RDdata$Y, x = RDdata$X, c = 0, kernel = "triangular")

# Display Results
summary(rd_triangular)

# Epanechnikov Kernel
rd_epanechnikov <- rdrobust(y = RDdata$Y, x = RDdata$X, c = 0, kernel = "epanechnikov")

# Display Results
summary(rd_epanechnikov)


# Uniform Kernel
rd_uniform <- rdrobust(y = RDdata$Y, x = RDdata$X, c = 0, kernel = "uniform")

# Display Results
summary(rd_uniform)

ggplot(RDdata, aes(x = X, y = Y)) +
  geom_point(alpha = 0.5) +  # Scatter plot of raw data
  geom_smooth(data = subset(RDdata, X < 0), aes(x = X, y = Y), method = "lm", color = "blue") +  # Left of cutoff
  geom_smooth(data = subset(RDdata, X >= 0), aes(x = X, y = Y), method = "lm", color = "red") +  # Right of cutoff
  geom_vline(xintercept = 0, linetype = "dashed", color = "black") +  # Cutoff line at X = 0
  labs(title = "Regression Discontinuity Design (Simulated Data)",
       x = "Running Variable (X)",
       y = "Outcome (Y)") +
  theme_minimal()

#FuzzyRD
set.seed(123)  # Ensure reproducibility

# Sample size
n <- 500  

# Running variable X
X <- runif(n, -50, 50)  

# Treatment probability: Higher for X >= 0
D_prob <- ifelse(X >= 0, 0.8, 0.3)  # 80% treated if X >= 0, 30% otherwise

# Actual treatment assignment based on probability
D <- rbinom(n, 1, D_prob)  

# Outcome Y with treatment effect of 10, plus random noise
Y <- 50 + 0.5 * X + 30 * D + rnorm(n, mean = 0, sd = 10)

# Create DataFrame
FuzzyRDdata <- data.frame(X, Y, D)

# Check first few rows
head(FuzzyRDdata)

# Fuzzy RD estimation
fuzzy_rd_robust <- rdrobust(y = FuzzyRDdata$Y, x = FuzzyRDdata$X, fuzzy = FuzzyRDdata$D, c = 0)

# Display results
summary(fuzzy_rd_robust)
