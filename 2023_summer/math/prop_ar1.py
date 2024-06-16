# Simulate an AR(1) Process
import random
# Parameters
rho = 0.5
mu = 0
sigma = 0.1

def inverse_log(y):
    return np.exp(y)


# Simulate the AR(1) process
T = 100
y = np.zeros(T)
A = np.zeros(T)

y[0] = 0.5
A[0] = inverse_log(y[0])

for t in range(1, T):
    y[t] = rho * y[t-1] + random.normalvariate(mu, sigma)
    A[t] = inverse_log(y[t])

# Plot the simulated AR(1) process
plt.figure()
plt.plot(A)
plt.title("Simulated AR(1) Process")
plt.xlabel("Time")
plt.ylabel("A")
# plot the mean
plt.hlines(np.mean(A), 0, T, linestyles='dashed', colors='gray', label='mean')
plt.show()
plt.plot(y)
plt.title("Simulated AR(1) Process")
plt.xlabel("Time")
plt.ylabel("log of A")
# plot the mean
plt.hlines(np.mean(y), 0, T, linestyles='dashed', colors='gray', label='mean')
plt.show()