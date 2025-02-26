// RBC level
var Y C I K L R W A;
varexo e;

// params
parameters alpha beta gamma delta rhoa;
alpha = 0.35;
beta = 0.97;
gamma = 0.4;
delta = 0.06;
rhoa = 0.95;

// model block
model;
//1-Consumption-labor supply
(1-gamma)*C/gamma = (1-L)*W;
//2-Euler equation
C(+1) = beta * C * (R(+1) + 1 - delta);
//3-Law of motion of capital
K = (1-delta)*K(-1) + I;
//4-production function
Y = A * K(-1)^alpha * L^(1-alpha);
//5-demand for capital
K(-1) = alpha * Y/R;
//6-demand for labor
L = (1-alpha) * Y/W;
//7-Equilibrium condition
Y = C + I;
//8-Productivity shock
A = exp( (1-rhoa)*log(1) + rhoa*log(A(-1)) + e);
end;

steady(maxit=1000);
check; 
model_diagnostics; 
model_info;

shocks;
var e; 
stderr 0.01; 
end;

stoch_simul(order=1, irf=40) Y C I K L R W A;
