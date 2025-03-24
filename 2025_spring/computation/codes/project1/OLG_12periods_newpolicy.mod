// OLG of 12-period lived agents
// In the first 8 periods, they work elastically
// In the last 4, they retire and receive pensions benefit b
// There is no initial wealth: k1 = 0
// Retirees do not work: n9 = n10 = n11 = n12 = 0
// we fix the tax rate and let pension benefit adjust

// NEW Policy: repl = 0.2

var k2 k3 k4 k5 k6 k7 k8 k9 k10 k11 k12 
    c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12
    n1 n2 n3 n4 n5 n6 n7 n8
    C K N w r b;
// k1 = n9 = n10 = n11 = n12 = 0

// specify parameters
parameters beta eta gamma alpha delta repl tau;

// parameter values
beta = 0.99^5;      // discount factor = .99^10
eta = 2.0;        // consumption parameter
gamma = 2.0;      // leisure parameter
alpha = 0.30;     // capital share
delta = 1 - 0.95^5;     // depreciation rate =(1 - 0.95^10)
repl = 0.20;      // replacement rate
tau = repl/(2+repl);    // tax rate based on replacement rate

// Model declaration
model;
// prices
r = alpha*K^(alpha-1)*N^(1-alpha) - delta;		// interest rate
w = (1-alpha)*K^alpha * N^(-alpha);				// wage
b = tau*w*N*12/4;                                // government budget balancing
// constraint
c1 + k2 = (1-tau)*w*n1;							// constraint at age 1	(working)
c2 + k3 = (1-tau)*w*n2 + (1+r)*k2(-1);			// constraint at age 2	(working)
c3 + k4 = (1-tau)*w*n3 + (1+r)*k3(-1);			// constraint at age 3	(working)
c4 + k5 = (1-tau)*w*n4 + (1+r)*k4(-1);			// constraint at age 4	(working)
c5 + k6 = (1-tau)*w*n5 + (1+r)*k5(-1);			// constraint at age 5	(working)
c6 + k7 = (1-tau)*w*n6 + (1+r)*k6(-1);			// constraint at age 6	(working)
c7 + k8 = (1-tau)*w*n7 + (1+r)*k7(-1);			// constraint at age 7	(working)
c8 + k9 = (1-tau)*w*n8 + (1+r)*k8(-1);			// constraint at age 8	(working)
c9 + k10 = (1+r)*k9(-1) + b;						// constraint at age 9	(retire)
c10 + k11 = (1+r)*k10(-1) + b;						// constraint at age 10	(retire)
c11 + k12 = (1+r)*k11(-1) + b;						// constraint at age 11	(retire)
c12 = (1+r)*k12(-1) + b;			                // constraint at age 12	(retire)
// FOC equations
(1-tau)*w = gamma*c1/(1-n1);	// consumption-leisure euler at age 1
1/beta = (1+r)*(c2(+1)/c1)^(-eta) * ((1-n2(+1))/(1-n1))^(gamma*(1-eta));			// consumption-saving euler at age 1

(1-tau)*w = gamma*c2/(1-n2);	// consumption-leisure euler at age 2
1/beta = (1+r)*(c3(+1)/c2)^(-eta) * ((1-n3(+1))/(1-n2))^(gamma*(1-eta));			// consumption-saving euler at age 2

(1-tau)*w = gamma*c3/(1-n3);	// consumption-leisure euler at age 3
1/beta = (1+r)*(c4(+1)/c3)^(-eta) * ((1-n4(+1))/(1-n3))^(gamma*(1-eta));			// consumption-saving euler at age 3

(1-tau)*w = gamma*c4/(1-n4);	// consumption-leisure euler at age 4
1/beta = (1+r)*(c5(+1)/c4)^(-eta) * ((1-n5(+1))/(1-n4))^(gamma*(1-eta));			// consumption-saving euler at age 3

(1-tau)*w = gamma*c5/(1-n5);	// consumption-leisure euler at age 5
1/beta = (1+r)*(c6(+1)/c5)^(-eta) * ((1-n6(+1))/(1-n5))^(gamma*(1-eta));			// consumption-saving euler at age 3

(1-tau)*w = gamma*c6/(1-n6);	// consumption-leisure euler at age 6
1/beta = (1+r)*(c7(+1)/c6)^(-eta) * ((1-n7(+1))/(1-n6))^(gamma*(1-eta));			// consumption-saving euler at age 3

(1-tau)*w = gamma*c7/(1-n7);	// consumption-leisure euler at age 7
1/beta = (1+r)*(c8(+1)/c7)^(-eta) * ((1-n8(+1))/(1-n7))^(gamma*(1-eta));			// consumption-saving euler at age 3


(1-tau)*w = gamma*c8/(1-n8);	// consumption-leisure euler at age 8
1/beta = (1+r)*(c9(+1)/c8)^(-eta) * (1/(1-n8))^(gamma*(1-eta));			// consumption-saving euler at age 4

1/beta = (1+r)*(c10(+1)/c9)^(-eta);	        // consumption-saving euler at age 9
1/beta = (1+r)*(c11(+1)/c10)^(-eta);	        // consumption-saving euler at age 10
1/beta = (1+r)*(c12(+1)/c11)^(-eta);	        // consumption-saving euler at age 11
// ** in age 12, you consume everything left, so there is no FOC to write down

// Aggregate equations
N = (n1 + n2 + n3 + n4 + n5 + n6 + n7 + n8)/12;
K = (k2(-1) + k3(-1) + k4(-1) + k5(-1) + k6(-1) + k7(-1) + k8(-1) + k9(-1) + k10(-1) + k11(-1) + k12(-1) )/12;
C = (c1 + c2 + c3 + c4 + c5 + c6 + c7 + c8 + c9 + c10 + c11 + c12)/12;
end;

// initial value
initval;
k2 = 0.03;
k3 = 0.06;
k4 = 0.09;
k5 = 0.12;
k6 = 0.15;
k7 = 0.18;
k8 = 0.21;
k9 = 0.19;
k10 = 0.17;
k11 = 0.15;
k12 = 0.13;
n1 = 0.38;
n2 = 0.36;
n3 = 0.34;
n4 = 0.32;
n5 = 0.31;
n6 = 0.30;
n7 = 0.28;
n8 = 0.26;
r = 1/beta - 1;
c1 = k2/(beta * (1+r));
c2 = k3/(beta * (1+r));
c3 = k4/(beta * (1+r));
c4 = k5/(beta * (1+r));
c5 = k6/(beta * (1+r));
c6 = k7/(beta * (1+r));
c7 = k8/(beta * (1+r));
c8 = k9/(beta * (1+r));
c9 = k10/(beta * (1+r));
c10 = k11/(beta * (1+r));
c11 = k12/(beta * (1+r));
c12 = k12;
N = 0.3;
w = alpha * r / (1-alpha);
K = 1;
end;


steady(maxit=200000);
resid;
