# 3 state Markov process
import numpy as np
import matplotlib.pyplot as plt

A1 = 1.75
A2 = 1.25
A3 = 0.75

p11 = 0.7
p12 = 0.2
p13 = 0.1
p21 = 0.3
p22 = 0.4
p23 = 0.3
p31 = 0.1
p32 = 0.1
p33 = 0.8

# Transition matrix
P = np.array([[p11, p12, p13], [p21, p22, p23], [p31, p32, p33]])

# Simulate the Markov chain
T = 100
s = np.zeros(T, dtype=int)
A = np.zeros(T)

s[0] = 0
A[0] = A1

for t in range(1, T):
    s[t] = np.random.choice([0, 1, 2], p=P[s[t-1], :])
    if s[t] == 0:
        A[t] = A1 
    elif s[t] == 1:
        A[t] = A2
    else:
        A[t] = A3

# Plot the simulated Markov chain
plt.figure()
plt.plot(A)
plt.title("Simulated Markov Chain (3 states)")
plt.xlabel("Time")
plt.ylabel("State")
plt.yticks([A1, A2, A3])
plt.show()
