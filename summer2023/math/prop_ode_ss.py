import numpy as np
import matplotlib.pyplot as plt

# Define the differential equation
def dx_dt(x):
    return x * (1 - x)

# Create a range of x values
x_vals = np.linspace(-0.5, 1.5, 100)

# Calculate dx/dt for each x value
dx_dt_vals = dx_dt(x_vals)

# Plotting the phase line with equilibrium points and arrows
plt.figure(figsize=(8, 6))
plt.plot(x_vals, dx_dt_vals, color='blue')
plt.axhline(0, color='gray', linestyle='--', linewidth=0.8)  # Horizontal axis

# Equilibrium points
equilibrium_points = [0, 1]
plt.plot(equilibrium_points, [0, 0], 'ro', label='Equilibrium Points')

# Directional arrows
for x_eq in equilibrium_points:
    plt.arrow(x_eq, 0.2, 0, -0.1, head_width=0.05, head_length=0.03, fc='green', ec='green')

plt.xlabel('x', fontsize=14)
plt.ylabel('$\\dot{x}$', fontsize=14)
plt.hlines(0, -0.5, 1.5, color='black', linestyle='--', linewidth=2)
plt.legend()
plt.grid()
plt.show()
