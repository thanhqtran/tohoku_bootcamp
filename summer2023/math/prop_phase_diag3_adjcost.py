import numpy as np
import matplotlib.pyplot as plt
import scipy

# Parameters
chi = 0.9
r = 0.1

# Define the system of differential equations
def system_eqns(y, t):
    k, q = y
    dk_dt = (q - 1) / chi * k
    dq_dt = r * q - f_prime(k) - 0.5 * chi**(-1) * (q - 1)**2
    return [dk_dt, dq_dt]


# Define the production function derivative
def f_prime(k):
    return 0.3 * 2 * k**(0.3-1)

# Create a grid of k and q values
k_vals = np.linspace(0.1, 5, 20)
q_vals = np.linspace(0.1, 2, 20)

K, Q = np.meshgrid(k_vals, q_vals)

# Calculate the derivatives dk/dt and dq/dt for each point in the grid
dK_dt, dQ_dt = system_eqns([K, Q], 0)

# calculate the equilibrium points
eq_points = []
for i in range(len(k_vals)):
    for j in range(len(q_vals)):
        if dK_dt[i, j] == 0 and dQ_dt[i, j] == 0:
            eq_points.append([k_vals[i], q_vals[j]])

# Plotting the phase diagram with quiver
plt.figure(figsize=(10, 8))
plt.quiver(Q, K, dQ_dt, dK_dt, angles='xy', scale_units='xy', color='red', scale=5)
# plot the equilibrium points
for point in eq_points:
    plt.plot(point[0], point[1], 'bo', ms=10)
plt.xlabel('k')
plt.ylabel('q')
plt.title('Phase Diagram of the System')
plt.grid()
plt.show()
