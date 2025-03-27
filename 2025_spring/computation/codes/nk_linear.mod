
//NK model - Chapter 3 (UNDERSTANDING DSGE MODELS) 

var Y I C R K W L MC P PI A;
varexo e;
parameters sigma phi alpha beta delta rhoa psi theta;

sigma = 2;
phi = 1.5; 
alpha = 0.35; 
beta = 0.985; 
delta = 0.025; 
rhoa = 0.95; 
psi = 8;
theta = 0.75;

model(linear);

#Pss = 1;
#Rss = Pss*((1/beta)-(1-delta));
#MCss = ((psi-1)/psi)*(1-beta*theta)*Pss;
#Wss = (1-alpha)*(MCss^(1/(1-alpha)))*((alpha/Rss)^(alpha/(1-alpha))); #Yss = ((Rss/(Rss-delta*alpha*MCss))^(sigma/(sigma+phi))) *((Wss/Pss)*(Wss/((1-alpha)*MCss))^phi)^(1/(sigma+phi));
#Kss = alpha*MCss*(Yss/Rss);
#Iss = delta*Kss;
#Css = Yss - Iss;
#Lss = (1-alpha)*MCss*(Yss/Wss);

//1-Labor supply
sigma*C + phi*L = W - P;
//2-Euler equation
(sigma/beta)*(C(+1)-C)=(Rss/Pss)*(R(+1)-P(+1));
//3-Law of motion of capital
K = (1-delta)*K(-1) + delta*I;
//4-Production function
Y = A + alpha*K(-1) + (1-alpha)*L;
//5-Demand for capital
K(-1) = Y - R;
//6-Demand for labor
L = Y - W;
//7-Marginal cost
MC = (1-alpha)*W + alpha*R - A;
//8-Phillips equation
PI = beta*PI(+1)+((1-theta)*(1-beta*theta)/theta)*(MC-P);
//9-Gross inflation rate
PI = P - P(-1);
//10-Goods market equilibrium condition
Yss*Y = Css*C + Iss*I;
//11-Productivity shock
A = rhoa*A(-1) + e;
end;

steady; 
check(qz_zero_threshold=1e-20);

shocks;
var e; 
stderr 0.01;
end;

stoch_simul(order=1, irf=40, qz_zero_threshold=1e-20) Y I C R K W L P PI A;
nk_results = oo_.irfs;
