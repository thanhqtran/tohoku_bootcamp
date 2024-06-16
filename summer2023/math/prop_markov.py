# Markov chain
import numpy as np
import matplotlib.pyplot as plt

A1 = 1.75
A2 = 0.75

p11 = 0.9
p12 = 0.1
p21 = 0.4
p22 = 0.6

# Transition matrix
P = np.array([[p11, p12], [p21, p22]])

# Simulate the Markov chain
T = 100
s = np.zeros(T, dtype=int)
A = np.zeros(T)

s[0] = 0
A[0] = A1

for t in range(1, T):
    s[t] = np.random.choice([0, 1], p=P[s[t-1], :])
    if s[t] == 1:
        A[t] = A1 
    else:
        A[t] = A2

# Plot the simulated Markov chain
plt.figure()
plt.plot(A)
plt.title("Simulated Markov Chain")
plt.xlabel("Time")
plt.ylabel("State")
plt.yticks([A1, A2])
plt.show()