# CLASS

# PARAMETERS

alpha = 1 - 0.43
beta = 0.95**30 # literature: 0.99, 0.98, 0.95 (quarterly)
n = 1.05
phi = (98.48 + 46.74)/(2*60*(24-8))
gamma = n*phi*(1+beta)/(1-n*phi)

# INITIAL VALUES
A = 1
K = 1
L = 1000
N = L/(1-phi*n)
k0 = K/L

# Using Class

class Model():
    def __init__(self, alpha, beta, phi, n, k0, iter):
        # PARAMS
        self.iter = iter
        self.alpha = alpha
        self.beta = beta
        self.phi = phi 
        self.n = n*phi*(1+beta)/(1-n*phi)
        self.gamma = gamma
        # initiate values
        self.k = np.zeros(self.iter)
        self.t = np.zeros(self.iter)
    
    # INITIAL VALUES
    k0 = 0.1

    def run_simul(self):
        self.k[0] = k0 
        self.t[0] = 0
        for i in np.arange(1,self.iter):
            self.t[i] = i
            self.k[i] = self.beta*(1-self.alpha)/(1+self.beta) * (self.k[i-1]**self.alpha)
        return self.k


# In[70]:


# TESTING: How alpha affects the model

model1 = Model(0.3, 0.99**30, 0.07, 1.05, 0.01, 20)
model2 = Model(0.4, 0.99**30, 0.07, 1.05, 0.01, 20)
model3 = Model(0.5, 0.99**30, 0.07, 1.05, 0.01, 20)

# run simulations
model1.run_simul()
model2.run_simul()
model3.run_simul()

# plot
plt.plot(model1.t, model1.k, label=f'alpha ={model1.alpha}')
plt.plot(model2.t, model2.k, label=f'alpha ={model2.alpha}')
plt.plot(model3.t, model3.k, label=f'alpha ={model3.alpha}')
plt.xlabel('t')
plt.ylabel('k')
plt.legend()