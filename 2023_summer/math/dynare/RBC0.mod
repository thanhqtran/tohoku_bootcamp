var c k y A;  // Declare endogenous variables
varexo e;           // Declare exogenous shock
predetermined_variables k; // Declare k0

parameters beta rho delta alpha;  // Declare parameters
beta = 0.99;        // Discount factor
rho = 0.95;         // Autoregressive coefficient for A
delta = 0.02;       // Depreciation rate
alpha = 0.36;       // Production elasticity of capital


// Define the model equations
model;
y = exp(A)*k^alpha;
k(+1) = y - c + (1-delta)*k;
c(+1) = c * beta * (alpha*exp(A(+1))*k(+1)^(alpha-1) + 1 - delta) ; // Euler
A = rho*A(-1) + e;
end;

initval;
c = ((1 - beta*(1-(1-alpha)*delta))/(alpha*beta)) * ((alpha*beta)/(1-(1-delta)*beta))^(1/(1-alpha));
k = ((alpha*beta)/(1-(1-delta)*beta))^(1/(1-alpha));
A = 0;
e = 0;
end;

steady;

shocks;
var e; stderr 0.1;
end;

stoch_simul(irf=100) A y k c;
