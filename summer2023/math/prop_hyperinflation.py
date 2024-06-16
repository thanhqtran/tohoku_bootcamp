import numpy as np
import matplotlib.pyplot as plt

# Parameters
psi = 0.5  # You can adjust this value
alpha = psi / (1 + psi)
beta = 1 / (1 + psi)

# Initial conditions
initial_price = 10  # You can set your own initial price
initial_expectation = initial_price  # Initial expectation for future price
initial_external_factor = 0  # Initial external factor

# Number of periods to simulate
num_periods = 100

# Lists to store simulation results
prices = [initial_price]
expectations = [initial_expectation]
external_factors = [initial_external_factor]

# Simulate the dynamics
for t in range(1, num_periods):
    # Compute new external factor (you can define this based on some pattern or random process)
    external_factor = np.random.normal(0, 1)  # Example: Using normal distribution for randomness

    # Calculate new price expectation and price using the equation
    new_expectation = alpha * expectations[t - 1] + beta * external_factor
    new_price = alpha * new_expectation + beta * external_factor

    # Append results to lists
    expectations.append(new_expectation)
    prices.append(new_price)
    external_factors.append(external_factor)

# Plot the results
plt.figure(figsize=(8, 6))
plt.plot(range(num_periods), prices, label='Prices')
plt.plot(range(num_periods), expectations, label='Expectations')
plt.plot(range(num_periods), external_factors, label='External Factors')
plt.xlabel('Time', fontsize=15)
plt.ylabel('Value', fontsize=15)
plt.title('Price Simulation with Expectations and External Factors')
plt.legend()
plt.grid(True)
plt.show()
