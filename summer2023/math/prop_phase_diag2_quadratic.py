import numpy as np
import matplotlib.pyplot as plt

# Define the differential equation
def dx_dt(x):
    return x * (1 - x)

# Create a grid of x and t values
x_vals = np.linspace(-1, 2, 20)
t_vals = np.linspace(0, 10, 20)

# Create a meshgrid for quiver
X, T = np.meshgrid(x_vals, t_vals)

# Calculate dx/dt for the quiver plot
U = np.ones_like(X)
V = dx_dt(X)

# Plotting the phase diagram with quiver
plt.figure(figsize=(8, 6))
plt.quiver(T, X, U, V, angles='xy', scale_units='xy', scale=4, color='blue')
plt.hlines(1, 0, 10, color='red', linewidth=1)
plt.hlines(0, 0, 10, color='red', linewidth=1)
#plt.title('Phase Diagram of $\\dot{x} = x(1-x)$ with Directional Arrows (Quiver)')
plt.xlabel('Time', size = 15)
plt.ylabel('x(t)', size = 15)
plt.xlim(0, 10)
plt.ylim(-1, 2)
plt.grid()
plt.show()
