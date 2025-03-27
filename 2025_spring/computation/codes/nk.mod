// NK model
var Y I C R K W L MC P Pstar X1 X2 PI A;
varexo e;
parameters sigma phi alpha beta delta rhoa psi theta;

// Parameters
sigma = 2;
phi = 1.5; 
alpha = 0.35; 
beta = 0.985; 
delta = 0.025; 
rhoa = 0.95;
theta = 0.75;
psi = 8;

model;
C^sigma * L^phi = W / P;
(C(+1)/C)^sigma = beta * ((1-delta)+ R(+1)/P(+1));
K = (1-delta)*K(-1) + I;
Y = A * K(-1)^alpha * L^(1-alpha);
K = alpha * MC * Y / R;
L = (1-alpha) * MC * Y / W;
MC = 1/A*(W/(1-alpha))^(1-alpha) * (R/alpha)^alpha;
Pstar = psi / (psi-1) * X1 / X2;
X1 = Y * MC + beta * theta * X1(+1);
X2 = Y + beta * theta * X2(+1);
P = (theta * P(-1)^(1-psi) + (1-theta) * Pstar^(1-psi))^(1/(1-psi));
PI = P / P(-1);
Y = C + I;
ln(A) = (1-rhoa) * STEADY_STATE(ln(A)) + rhoa * ln(A(-1)) + e;
end;

steady_state_model;
A = 1;
P = 1;
Pstar = 1;
PI = 1;
R = (1/beta - (1-delta));
MC = (psi-1)/psi*P;
W = (1-alpha) * MC^(1/(1-alpha))* (alpha/R)^(alpha/(1-alpha));
Y = (R/(R - delta * alpha * MC))^(sigma/(sigma+phi)) * (W / P * (W/(1-alpha)/MC)^phi)^(1/(sigma+phi));
K = alpha * MC * Y / R;
I = delta * K;
C = Y - I;
L = (1-alpha) * MC * Y / W;
X1 = MC * Y / (1 - theta * beta); 
X2 = Y / (1 - theta * beta);
end;

steady;
check(qz_zero_threshold=1e-20);

shocks;
var e;
stderr 0.01;
end;

stoch_simul(order=1,irf=200, nocorr, qz_zero_threshold=1e-20);
