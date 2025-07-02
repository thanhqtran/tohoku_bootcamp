import numpy as np
import matplotlib.pyplot as plt


def w_threshold(theta, phi, eta):
    return theta / (phi * eta)


def e_(theta, phi, eta, w, w_thres):
    if w > w_thres:
        return (eta * phi * w - theta) / (1-eta)
    else:
        return 0


def n_(phi, theta, eta, gamma, w, w_thres):
    if w > w_thres:
        return (1-eta) * gamma * w / ((1+gamma) * (phi*w - theta))
    else:
        return gamma / (phi*(1+gamma))


theta = 51.61
phi = 0.039
eta = 0.572
gamma = 0.1
w_thres = w_threshold(theta, phi, eta)
w_thres

# latex
plt.rc('text', usetex=True)
plt.rc('font', family='serif')

wvals = np.linspace(w_thres-2000, w_thres + 10000, 1000)
evals = [e_(theta, phi, eta, w, w_thres) for w in wvals]
nvals = [n_(phi, theta, eta, gamma, w, w_thres) for w in wvals]

plt.figure(figsize=(4, 3))
plt.plot(wvals, evals)
plt.xticks([w_thres], [r'$\theta/(\eta \phi)$'], fontsize=14)
plt.yticks([0])
plt.xlabel('w', fontsize=14, loc='right')
plt.ylabel('e', fontsize=14, loc='top', rotation=0)
# remove top and right frames
ax = plt.gca()
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)

N_max = gamma/(phi*(1+gamma))
N_min = gamma*(1-eta)/(phi*(1+gamma))
print(N_max, N_min)

plt.figure(figsize=(4, 3))
plt.plot(wvals, nvals)
plt.xticks([w_thres], [r'$\theta/(\eta \phi)$'], fontsize=14)
# plt.yticks([])
plt.xlabel('w', fontsize=14, loc='right')
plt.ylabel('n', fontsize=14, loc='top', rotation=0)
plt.ylim(N_min-0.2, N_max+0.2)
# remove top and right frames
ax = plt.gca()
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
plt.vlines(w_thres, N_max, 0, linestyle='--', color='grey')
plt.hlines(N_min, w_thres, wvals[-1], linestyle='--', color='black')
plt.yticks([N_min, N_max], [
           r'$\frac{\gamma(1-\eta)}{\phi(1+\gamma)}$', r'$\frac{\gamma}{\phi(1+\gamma)}$'], fontsize=14)
plt.show()