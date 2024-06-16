import numpy as np
import matplotlib.pyplot as plt

# Parameters
alpha = 0.3
beta = 0.99**30
gamma = 0.271
phi = 0.15
T = 10  # Number of periods

# Initial conditions
K0 = 10
N0 = 1000
k0 = K0/N0  # Initial capital

# Initialize arrays to store results
k_values = np.zeros(T+1)
s_values = np.zeros(T)
n_values = np.zeros(T)
n_star_values = np.zeros(T)

# Aggregate
K_values = np.zeros(T)
L_values = np.zeros(T)
Y_values = np.zeros(T)
N_values = np.zeros(T)

# some functions
def prod(K, L):
    return K**alpha * L**(1-alpha)

def saving(K, L):
    return (1-alpha) * prod(K, L)

# Simulation loop
k_values[0] = k0
for t in range(T):
    # Fertility equation
    n_star = gamma / (phi * (1 + beta + gamma))
    n_star_values[t] = n_star
    
    # Savings equation
    s_t = (beta / (1 + beta + gamma)) * (1 - alpha) * k_values[t]**alpha
    s_values[t] = s_t
    
    # AGGREGATE


    # Capital equation
    n_t = n_star
    k_next = s_t / n_
    k_values[t+1] = k_next

# Plotting
plt.plot(range(T+1), k_values, label='Capital')
plt.xlabel('Time', fontsize=16)
plt.ylabel('Capital', fontsize=16)
plt.legend()
plt.show()
print(k_values)
