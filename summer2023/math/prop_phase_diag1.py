import numpy as np
import matplotlib.pyplot as plt

# Define the system functions
def phi(x, y):
    return 0.5*x + -0.3*y

def psi(x, y):
    return -0.2*x + 0.9*y

# Create a grid of x and y values
x_vals = np.linspace(-2, 2, 20)
y_vals = np.linspace(-2, 2, 20)
X, Y = np.meshgrid(x_vals, y_vals)

# Calculate the derivatives using the system functions
X_dot = phi(X, Y)
Y_dot = psi(X, Y)

# Create a quiver plot
plt.figure(figsize=(8, 6))
plt.quiver(X, Y, X_dot, Y_dot, angles='xy', scale_units='xy', scale=0.5, color='blue')
plt.xlabel('x')
plt.ylabel('y')
plt.title('Phase Portrait')
plt.axhline(0, color='black', linewidth=0.5)
plt.axvline(0, color='black', linewidth=0.5)
plt.grid()
plt.xlim([-2, 2])
plt.ylim([-2, 2])
plt.show()
