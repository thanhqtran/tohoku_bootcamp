import numpy as np
import matplotlib.pyplot as plt

# Model parameters
beta = 0.95
sigma = 2.0
alpha = 0.36
delta = 0.1
rho = 0.9
sigma_epsilon = 0.02
T = 1000

# Grid for capital stock values
K_min = 0.1
K_max = 10.0
K_size = 100
K = np.linspace(K_min, K_max, K_size)

# Production function
def production(k):
    return k**alpha

# Utility function
def utility(c):
    return np.log(c)

# Initialize value function
V = np.zeros((T+1, K_size))

# Backward induction
for t in range(T - 1, -1, -1):
    for i in range(K_size):
        k = K[i]
        max_value = -np.inf
        for j in range(K_size):
            k_next = K[j]
            c = production(k) + (1 - delta) * k - k_next
            if c > 0:
                future_value = beta * (rho * V[t+1, j] + (1 - rho) * V[t, j])
                current_value = utility(c) + future_value
                if current_value > max_value:
                    max_value = current_value
        V[t, i] = max_value

# Extract policy function
policy = np.zeros((T, K_size), dtype=int)
for t in range(T):
    for i in range(K_size):
        k = K[i]
        max_value = -np.inf
        for j in range(K_size):
            k_next = K[j]
            c = production(k) + (1 - delta) * k - k_next
            if c > 0:
                future_value = beta * (rho * V[t+1, j] + (1 - rho) * V[t, j])
                current_value = utility(c) + future_value
                if current_value > max_value:
                    max_value = current_value
                    policy[t, i] = j

# Plot the final value function
plt.figure()
plt.plot(K, V[0, :])
plt.title("Ramsey Model: Value Function")
plt.xlabel("Capital Stock")
plt.ylabel("Value Function")
plt.show()

# Print policy for some capital stock levels
for t in [10, 20, 30]:
    for k_idx in [10, 20, 30]:
        print(f"Optimal capital next period at time {t} when current K = {K[k_idx]:.2f}: {K[policy[t, k_idx]]:.2f}")
