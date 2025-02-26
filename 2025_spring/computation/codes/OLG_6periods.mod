// OLG based on Example 10.4.1 in Heer (2024)
// In the first 4 periods, they work elastically
// In the last 2, they retire and receive pensions benefit b
// There is no initial wealth: k1 = 0
// Retirees do not work: l5 = l6 = 0

var k2 k3 k4 k5 k6 c1 c2 c3 c4 c5 c6 l1 l2 l3 l4 C K L w r b;
// k1 = l5 = l6 = 0

// specify parameters
parameters beta eta gamma alpha delta repl tau;

// parameter values
beta = 0.90;
eta = 2.0;
gamma = 2.0;
alpha = 0.30;
delta = 0.40;
repl = 0.30;
tau = repl/(2+repl);

// Model declaration
model;
// prices
r = alpha*K^(alpha-1)*L^(1-alpha) - delta;		// interest rate
w = (1-alpha)*K^alpha * L^(-alpha);				// wage
b = repl*(1-tau)*w*L*3/2;
// constraint
c1 + k2 = (1-tau)*w*l1;							// constraint at age 1	(working)
c2 + k3 = (1-tau)*w*l2 + (1+r)*k2(-1);			// constraint at age 2	(working)
c3 + k4 = (1-tau)*w*l3 + (1+r)*k3(-1);			// constraint at age 3	(working)
c4 + k5 = (1-tau)*w*l4 + (1+r)*k4(-1);			// constraint at age 4	(working)
c5 + k6 = (1+r)*k5(-1) + b;						// constraint at age 5	(retire)
c6 = (1+r)*k6(-1) + b;			// constraint at age 6	(retire)
// Euler equations
(1-tau)*w = gamma*( (1-tau)*w*l1 - k2(+1))/(1-l1);	// consumption-leisure euler at age 1
1/beta = (( (1+r)*k2(+1) + (1-tau)*w*l2(+1) - k3(+2) )/( (1-tau)*w*l1 - k2(+1) ))^(-eta) * (1+r) * ( (1-l2(+1))/(1-l1) )^(gamma*(1-eta));			// consumption-saving euler at age 1

(1-tau)*w = gamma*((1+r)*k2(-1) + (1-tau)*w*l2 - k3(+1))/(1-l2);	// consumption-leisure euler at age 2
1/beta = (( (1+r)*k3(+1) + (1-tau)*w*l3(+1) - k4(+2) )/( (1+r)*k2(-1) + (1-tau)*w*l2 - k3(+1) ))^(-eta) * (1+r) * ( (1-l3(+1))/(1-l2) )^(gamma*(1-eta));			// consumption-saving euler at age 2

(1-tau)*w = gamma*((1+r)*k3(-1) + (1-tau)*w*l3 - k4(+1))/(1-l3);	// consumption-leisure euler at age 3
1/beta = (( (1+r)*k4(+1) + (1-tau)*w*l4(+1) - k5(+2) )/( (1+r)*k3(-1) + (1-tau)*w*l3 - k4(+1) ))^(-eta) * (1+r) * ( (1-l4(+1))/(1-l3) )^(gamma*(1-eta));			// consumption-saving euler at age 3

(1-tau)*w = gamma*((1+r)*k4(-1) + (1-tau)*w*l4 - k5(+1))/(1-l4);	// consumption-leisure euler at age 4
1/beta = (( (1+r)*k5(+1)  - k6(+2) + b)/( (1+r)*k4(-1) + (1-tau)*w*l4 - k5(+1) ))^(-eta) * (1+r) * ( (1)/(1-l4) )^(gamma*(1-eta));			// consumption-saving euler at age 4

1/beta = (( (1+r)*k6(+1) + b)/( (1+r)*k5(-1) - k6(+1) + b ))^(-eta) * (1+r);	// consumption-saving euler at age 5

// Aggregate equations
L = (l1 + l2 + l3 + l4)/6;
K = (k2(-1) + k3(-1) + k4(-1) + k5(-1) + k6(-1))/6;
C = (c1 + c2 + c3 + c4 + c5 + c6)/6;
end;

// initial value
initval;
k2 = 0.03;
k3 = 0.06;
k4 = 0.08;
k5 = 0.1;
k6 = 0.06;
l1 = 0.38;
l2 = 0.36;
l3 = 0.32;
l4 = 0.28;
c1 = 0.06;
c2 = 0.08;
c3 = 0.12;
c4 = 0.15;
c5 = 0.16;
c6 = 0.2;
K = 0.0667;
L = 0.229;
r = 0.31;
w = 0.48;

end;

resid;
steady(maxit=200000);
