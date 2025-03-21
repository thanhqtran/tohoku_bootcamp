// ONG based on Example 10.4.1 in Heer (2024)
// In the first 4 periods, they work elastically
// In the last 2, they retire and receive pensions benefit b
// There is no initial wealth: k1 = 0
// Retirees do not work: n5 = n6 = 0
// we fix the tax rate and let pension benefit adjust

var k2 k3 k4 k5 k6 c1 c2 c3 c4 c5 c6 n1 n2 n3 n4 C K N w r b;
// k1 = n5 = n6 = 0

// specify parameters
parameters beta eta gamma alpha delta repl tau;

// parameter values
beta = 0.90;      // discount factor = .99^10
eta = 2.0;        // consumption parameter
gamma = 2.0;      // leisure parameter
alpha = 0.30;     // capital share
delta = 0.40;     // depreciation rate =(1 - 0.95^10)
repl = 0.30;      // replacement rate  =b/((1-tau)*w*nbar)
tau = repl/(2+repl);    // tax rate based on replacement rate

// Model declaration
model;
// prices
r = alpha*K^(alpha-1)*N^(1-alpha) - delta;		// interest rate
w = (1-alpha)*K^alpha * N^(-alpha);				// wage
b = tau*w*N*6/2;                                // government budget balancing
// constraint
c1 + k2 = (1-tau)*w*n1;							// constraint at age 1	(working)
c2 + k3 = (1-tau)*w*n2 + (1+r)*k2(-1);			// constraint at age 2	(working)
c3 + k4 = (1-tau)*w*n3 + (1+r)*k3(-1);			// constraint at age 3	(working)
c4 + k5 = (1-tau)*w*n4 + (1+r)*k4(-1);			// constraint at age 4	(working)
c5 + k6 = (1+r)*k5(-1) + b;						// constraint at age 5	(retire)
c6 = (1+r)*k6(-1) + b;			                // constraint at age 6	(retire)
// FOC equations
(1-tau)*w = gamma*c1/(1-n1);	// consumption-leisure euler at age 1
1/beta = (1+r)*(c2(+1)/c1)^(-eta) * ((1-n2(+1))/(1-n1))^(gamma*(1-eta));			// consumption-saving euler at age 1

(1-tau)*w = gamma*c2/(1-n2);	// consumption-leisure euler at age 2
1/beta = (1+r)*(c3(+1)/c2)^(-eta) * ((1-n3(+1))/(1-n2))^(gamma*(1-eta));			// consumption-saving euler at age 2

(1-tau)*w = gamma*c3/(1-n3);	// consumption-leisure euler at age 3
1/beta = (1+r)*(c4(+1)/c3)^(-eta) * ((1-n4(+1))/(1-n3))^(gamma*(1-eta));			// consumption-saving euler at age 3

(1-tau)*w = gamma*c4/(1-n4);	// consumption-leisure euler at age 4
1/beta = (1+r)*(c5(+1)/c4)^(-eta) * (1/(1-n4))^(gamma*(1-eta));			// consumption-saving euler at age 4

1/beta = (1+r)*(c6(+1)/c5)^(-eta);	        // consumption-saving euler at age 5
// ** in age 6, you consume everything left, so there is no FOC to write down

// Aggregate equations
N = (n1 + n2 + n3 + n4)/6;
K = (k2(-1) + k3(-1) + k4(-1) + k5(-1) + k6(-1))/6;
C = (c1 + c2 + c3 + c4 + c5 + c6)/6;
end;

// initial value
initval;
k2 = 0.03;
k3 = 0.06;
k4 = 0.09;
k5 = 0.12;
k6 = 0.09;
n1 = 0.38;
n2 = 0.36;
n3 = 0.34;
n4 = 0.32;
c1 = 0.06;
c2 = 0.12;
c3 = 0.15;
c4 = 0.20;
c5 = 0.16;
c6 = 0.2;
K = 0.0667;
N = 0.229;
r = 0.31;
w = 0.48;
end;

resid;
steady(maxit=200000);
