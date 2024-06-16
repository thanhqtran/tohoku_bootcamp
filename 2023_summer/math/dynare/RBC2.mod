// Dynare code to replicate Figures in Chap.5 of Romer's book (Non-log-linearized version)

// 1. Declaration to set up the endogenous and exogenous variables
var Y A K L W R C G;
varexo eA eG;

// 2. Declaration to set up the parameters
parameters rhoA rhoG alpha delta taustar n g b rho astar gstar wstar rstar lstar kstar ystar cstar;

// 3. Parameter configuration
rhoA=0.95;
rhoG=0.95;
alpha=1/3;
delta=0.025;
b=2.5208;
rho=0.0099;
taustar=0.1925;
n=0.0025;
g=0.005;

// 4. Steady state
astar=0;
gstar=0;
rstar=exp(rho+g)-1;
K_L=(alpha/(rstar+delta))^(1/(1-alpha));
Y_L=(K_L)^alpha;
wstar=(1-alpha)*(K_L)^alpha;
lstar=(wstar/b+taustar)/(Y_L+(1-delta-exp(n+g))*K_L+wstar/b);
kstar=K_L*lstar;
ystar=Y_L*lstar;
cstar=(Y_L+(1-delta-exp(n+g))*K_L)*lstar-taustar;


// 5. Definition of equations
model;
ystar*exp(Y)=exp((1-alpha)*A)*((kstar*exp(K))^alpha)*((lstar*exp(L))^(1-alpha));
wstar*exp(W)=(1-alpha)*ystar*exp(Y)/(lstar*exp(L));
rstar*exp(R)+delta=alpha*ystar*exp(Y)/(kstar*exp(K));
ystar*exp(Y(-1))+(1-delta)*kstar*exp(K(-1))=cstar*exp(C(-1))+taustar*exp(G(-1))+exp(n+g)*kstar*exp(K);
wstar*exp(W)/(cstar*exp(C))=b/(1-lstar*exp(L));
exp(C(+1))/exp(C)=exp(-rho-g)*(1+rstar*exp(R(+1)));
A=rhoA*A(-1)+eA;
G=rhoG*G(-1)+eG;
end;


// 6. Initial Value
initval;
C=0;
Y=0;
K=0;
L=0;
W=0;
R=0;
A=0;
K=0;
end;

steady;

// 7. Shocks
shocks;
var eA; stderr 0;
var eG; stderr 1;
end;

// 8. Simulation
stoch_simul(order=1, irf=40) A G Y C K L W R;
