import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import odeint

# Define the Holling-Tanner model
def holling_tanner(Z, t):
    x, y = Z
    dx_dt = x * (1 - x / 6) - 6 * x * y / (8 + 8 * x)
    dy_dt = 0.2 * y * (1 - 0.4 * y / x)
    return dx_dt, dy_dt

x = np.linspace(0.1, 7, 20)
y = np.linspace(0.1, 7, 20)

X, Y = np.meshgrid(x, y)

t = 0

u, v = np.zeros(X.shape), np.zeros(Y.shape)

NI, NJ = X.shape

for i in range(NI):
    for j in range(NJ):
        x = X[i, j]
        y = Y[i, j]
        yprime = holling_tanner([x, y], t)
        u[i,j] = yprime[0]
        v[i,j] = yprime[1]

Q = plt.quiver(X, Y, u, v, color='r', scale=20)

# equilibrium points
epm1 = [6, 0]
epm2 = [0.846, 2.114]



# add some trajectories close to equilibrium points
t = np.linspace(0, 10, 12000)
n = 5
x0 = 0.5 * np.ones(n)
y0 = np.linspace(0, 6, n)
for i in range(n):
    x = x0[i]
    y = y0[i]
    z = odeint(holling_tanner, [x, y], t)
    plt.plot(z[:,0], z[:,1], 'b-') # path
    plt.plot([z[0,0]], [z[0,1]], 'o') # start
    plt.plot([z[-1,0]], [z[-1,1]], 's') # end
 
plt.scatter(epm1[0], epm1[1], marker='*', s=200, c='g')
plt.scatter(epm2[0], epm2[1], marker='*', s=200, c='g')
plt.xlabel('$x$')
plt.ylabel('$y$')
plt.xlim([0, 7])
plt.ylim([-0.5, 7])
plt.show()
