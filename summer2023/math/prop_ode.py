import numpy as np


def ode(lamda, t):
    return x0 * np.exp(lamda * t)

def ode2(lamda, t):
    k = x0 + b/lamda
    return - b/lamda + k * np.exp(lamda * t)

x0 = 0.9 
b = 2

lamdas = [-1.5, -0.5, 0.5, 1.5]
t = np.linspace(0, 10, 100)

for lamda in lamdas:
    plt.plot(t, ode(lamda, t), label=f'$\lambda={lamda}$')
     
plt.hlines(0, 0, 10, linestyles='dashed', colors='gray', label=f'$\dot x=0$')
plt.ylim(-1, 10)
plt.xlabel('t', size=15)
plt.ylabel('x(t)', size=15)
plt.legend()
plt.show()

""" x0 = -1

for lamda in lamdas:
    plt.plot(t, ode2(lamda, t), label=f'$\lambda={lamda}$')
     
plt.xlabel('t', size=15)
plt.ylabel('x(t)', size=15)
plt.ylim(-2, 10)
plt.legend()
plt.show() """