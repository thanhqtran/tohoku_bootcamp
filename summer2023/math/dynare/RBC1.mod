// Dynare code to replicate Figures in Chap. 5 of Romer's book (Log-linearized version)

// 1. Declaration to set up the endogenous and exogenous variables
var Y A K L W R C G;
varexo eA eG;

// 2. Declaration to set up the parameters
parameters rhoA rhoG alpha delta rstar taustar n g ystar kstar cstar lstar;

// 3. Parameter configuration
rhoA=0.95;
rhoG=0.95;
alpha=1/3;
delta=0.025;
rstar=0.015;
taustar=0.1925;
n=0.0025;
g=0.005;
ystar=0.9623;
kstar=8.0188;
cstar=0.5090;
lstar=1/3;

// 4. Definition of equations
model;
Y=(1-alpha)*A+alpha*K+(1-alpha)*L;
W=(1-alpha)*A+alpha*(K-L);
R=(rstar+delta)*(1-alpha)*(A-K+L)/rstar;
ystar*Y(-1)+(1-delta)*kstar*K(-1)=cstar*C(-1)+taustar*G(-1)+exp(n+g)*kstar*K;
W-lstar*L/(1-lstar)=C;
C(+1)-rstar*R(+1)/(1+rstar)=C;
A=rhoA*A(-1)+eA;
G=rhoG*G(-1)+eG;
end;

// 5. Shocks
shocks;
var eA; stderr 1;
var eG; stderr 0;
end;

// 6. Simulation
stoch_simul(order=1, irf=100) A G Y C K L W R;
