// OLG based on Example 10.4.1 in Heer (2024)
// In the first 4 periods, they work elastically
// In the last 2, they retire and receive pensions benefit b
// There is no initial wealth: k1 = 0
// Retirees do not work: n41 = n42 = ... = n60 = 0

var k2 k3 k4 k5 k6 k7 k8 k9 k10 k11 k12 k13 k14 k15 k16 k17 k18 k19 k20 k21
    k22 k23 k24 k25 k26 k27 k28 k29 k30 k31 k32 k33 k34 k35 k36 k37 k38 k39 
    k40 k41 k42 k43 k44 k45 k46 k47 k48 k49 k50 k51 k52 k53 k54 k55 k56 k57
    k58 k59 k60
    n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n16 n17 n18 n19 n20
    n21 n22 n23 n24 n25 n26 n27 n28 n29 n30 n31 n32 n33 n34 n35 n36 n37 n38 
    n39 n40
    c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20
    c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 
    c39 c40 c41 c42 c43 c44 c45 c46 c47 c48 c49 c50 c51 c52 c53 c54 c55 c56
    c57 c58 c59 c60
    w r C N K;

// specify parameters
parameters beta eta gamma alpha delta repl b tau;
// repl: replacement rate = b/((1-tau)*w*lbar

// parameter values
beta = 0.98;
eta = 2.0;
gamma = 2.0;
alpha = 0.36;
delta = 0.1;
repl = 0.30;
b = 0.0979;
tau = repl/(2+repl);

// Model declaration
model;
// prices
r = alpha*K^(alpha-1) * N^(1-alpha) - delta;	// interest rate
w = (1-alpha)*K^alpha * N^(-alpha);				// wage
// constraint
c1 + k2 = (1-tau)*w*n1;							// constraint at age 1	(working)
c2 + k3 = (1-tau)*w*n2 + (1+r)*k2(-1);			// constraint at age 2	(working)
c3 + k4 = (1-tau)*w*n3 + (1+r)*k3(-1);			// constraint at age 3	(working)
c4 + k5 = (1-tau)*w*n4 + (1+r)*k4(-1);			// constraint at age 4	(working)
c5 + k6 = (1-tau)*w*n5 + (1+r)*k5(-1);			// constraint at age 5	(working)
c6 + k7 = (1-tau)*w*n6 + (1+r)*k6(-1);			// constraint at age 6	(working)
c7 + k8 = (1-tau)*w*n7 + (1+r)*k7(-1);			// constraint at age 7	(working)
c8 + k9 = (1-tau)*w*n8 + (1+r)*k8(-1);			// constraint at age 8	(working)
c9 + k10 = (1-tau)*w*n9 + (1+r)*k9(-1);			// constraint at age 9	(working)
c10 + k11 = (1-tau)*w*n10 + (1+r)*k10(-1);			// constraint at age 10	(working)
c11 + k12 = (1-tau)*w*n11 + (1+r)*k11(-1);			// constraint at age 11	(working)
c12 + k13 = (1-tau)*w*n12 + (1+r)*k12(-1);			// constraint at age 12	(working)
c13 + k14 = (1-tau)*w*n13 + (1+r)*k13(-1);			// constraint at age 13	(working)
c14 + k15 = (1-tau)*w*n14 + (1+r)*k14(-1);			// constraint at age 14	(working)
c15 + k16 = (1-tau)*w*n15 + (1+r)*k15(-1);			// constraint at age 15	(working)
c16 + k17 = (1-tau)*w*n16 + (1+r)*k16(-1);			// constraint at age 16	(working)
c17 + k18 = (1-tau)*w*n17 + (1+r)*k17(-1);			// constraint at age 17	(working)
c18 + k19 = (1-tau)*w*n18 + (1+r)*k18(-1);			// constraint at age 18	(working)
c19 + k20 = (1-tau)*w*n19 + (1+r)*k19(-1);			// constraint at age 19	(working)
c20 + k21 = (1-tau)*w*n20 + (1+r)*k20(-1);			// constraint at age 20	(working)
c21 + k22 = (1-tau)*w*n21 + (1+r)*k21(-1);			// constraint at age 21	(working)
c22 + k23 = (1-tau)*w*n22 + (1+r)*k22(-1);			// constraint at age 22	(working)
c23 + k24 = (1-tau)*w*n23 + (1+r)*k23(-1);			// constraint at age 23	(working)
c24 + k25 = (1-tau)*w*n24 + (1+r)*k24(-1);			// constraint at age 24	(working)
c25 + k26 = (1-tau)*w*n25 + (1+r)*k25(-1);			// constraint at age 25	(working)
c26 + k27 = (1-tau)*w*n26 + (1+r)*k26(-1);			// constraint at age 26	(working)
c27 + k28 = (1-tau)*w*n27 + (1+r)*k27(-1);			// constraint at age 27	(working)
c28 + k29 = (1-tau)*w*n28 + (1+r)*k28(-1);			// constraint at age 28	(working)
c29 + k30 = (1-tau)*w*n29 + (1+r)*k29(-1);			// constraint at age 29	(working)
c30 + k31 = (1-tau)*w*n30 + (1+r)*k30(-1);			// constraint at age 30	(working)
c31 + k32 = (1-tau)*w*n31 + (1+r)*k31(-1);			// constraint at age 31	(working)
c32 + k33 = (1-tau)*w*n32 + (1+r)*k32(-1);			// constraint at age 32	(working)
c33 + k34 = (1-tau)*w*n33 + (1+r)*k33(-1);			// constraint at age 33	(working)
c34 + k35 = (1-tau)*w*n34 + (1+r)*k34(-1);			// constraint at age 34	(working)
c35 + k36 = (1-tau)*w*n35 + (1+r)*k35(-1);			// constraint at age 35	(working)
c36 + k37 = (1-tau)*w*n36 + (1+r)*k36(-1);			// constraint at age 36	(working)
c37 + k38 = (1-tau)*w*n37 + (1+r)*k37(-1);			// constraint at age 37	(working)
c38 + k39 = (1-tau)*w*n38 + (1+r)*k38(-1);			// constraint at age 38	(working)
c39 + k40 = (1-tau)*w*n39 + (1+r)*k39(-1);			// constraint at age 39	(working)
c40 + k41 = (1-tau)*w*n40 + (1+r)*k40(-1);			// constraint at age 40	(working)
c41 + k42 = (1+r)*k41(-1) + b;						// constraint at age 41	(retire)
c42 + k43 = (1+r)*k42(-1) + b;						// constraint at age 42	(retire)
c43 + k44 = (1+r)*k43(-1) + b;						// constraint at age 43	(retire)
c44 + k45 = (1+r)*k44(-1) + b;						// constraint at age 44	(retire)
c45 + k46 = (1+r)*k45(-1) + b;						// constraint at age 45	(retire)
c46 + k47 = (1+r)*k46(-1) + b;						// constraint at age 46	(retire)
c47 + k48 = (1+r)*k47(-1) + b;						// constraint at age 47	(retire)
c48 + k49 = (1+r)*k48(-1) + b;						// constraint at age 48	(retire)
c49 + k50 = (1+r)*k49(-1) + b;						// constraint at age 49	(retire)
c50 + k51 = (1+r)*k50(-1) + b;						// constraint at age 50	(retire)
c51 + k52 = (1+r)*k51(-1) + b;						// constraint at age 51	(retire)
c52 + k53 = (1+r)*k52(-1) + b;						// constraint at age 52	(retire)
c53 + k54 = (1+r)*k53(-1) + b;						// constraint at age 53	(retire)
c54 + k55 = (1+r)*k54(-1) + b;						// constraint at age 54	(retire)
c55 + k56 = (1+r)*k55(-1) + b;						// constraint at age 55	(retire)
c56 + k57 = (1+r)*k56(-1) + b;						// constraint at age 56	(retire)
c57 + k58 = (1+r)*k57(-1) + b;						// constraint at age 57	(retire)
c58 + k59 = (1+r)*k58(-1) + b;						// constraint at age 58	(retire)
c59 + k60 = (1+r)*k59(-1) + b;						// constraint at age 59	(retire)
c60 = (1+r)*k60(-1) + b;						// constraint at age 60	(retire)
// Euler equations
(1-tau)*w = gamma*( (1-tau)*w*n1 - k2(+1))/(1-n1);																									// consumption-leisure euler at age 1
1/beta = (( (1+r)*k2(+1) + (1-tau)*w*n2(+1) - k3(+2) )/( (1-tau)*w*n1 - k2(+1) ))^(-eta) * (1+r) * ( (1-n2(+1))/(1-n1) )^(gamma*(1-eta));			// consumption-saving euler at age 1

(1-tau)*w = gamma*((1+r)*k2(-1) + (1-tau)*w*n2 - k3(+1))/(1-n2);																									// consumption-leisure euler at age 2
1/beta = (( (1+r)*k3(+1) + (1-tau)*w*n3(+1) - k4(+2) )/( (1+r)*k2(-1) + (1-tau)*w*n2 - k3(+1) ))^(-eta) * (1+r) * ( (1-n3(+1))/(1-n2) )^(gamma*(1-eta));			// consumption-saving euler at age 2

(1-tau)*w = gamma*((1+r)*k3(-1) + (1-tau)*w*n3 - k4(+1))/(1-n3);																									// consumption-leisure euler at age 3
1/beta = (( (1+r)*k4(+1) + (1-tau)*w*n4(+1) - k5(+2) )/( (1+r)*k3(-1) + (1-tau)*w*n3 - k4(+1) ))^(-eta) * (1+r) * ( (1-n4(+1))/(1-n3) )^(gamma*(1-eta));			// consumption-saving euler at age 3

(1-tau)*w = gamma*((1+r)*k4(-1) + (1-tau)*w*n4 - k5(+1))/(1-n4);																									// consumption-leisure euler at age 4
1/beta = (( (1+r)*k5(+1) + (1-tau)*w*n5(+1) - k6(+2) )/( (1+r)*k4(-1) + (1-tau)*w*n4 - k5(+1) ))^(-eta) * (1+r) * ( (1-n5(+1))/(1-n4) )^(gamma*(1-eta));			// consumption-saving euler at age 4

(1-tau)*w = gamma*((1+r)*k5(-1) + (1-tau)*w*n5 - k6(+1))/(1-n5);																									// consumption-leisure euler at age 5
1/beta = (( (1+r)*k6(+1) + (1-tau)*w*n6(+1) - k7(+2) )/( (1+r)*k5(-1) + (1-tau)*w*n5 - k6(+1) ))^(-eta) * (1+r) * ( (1-n6(+1))/(1-n5) )^(gamma*(1-eta));			// consumption-saving euler at age 5

(1-tau)*w = gamma*((1+r)*k6(-1) + (1-tau)*w*n6 - k7(+1))/(1-n6);																									// consumption-leisure euler at age 6
1/beta = (( (1+r)*k7(+1) + (1-tau)*w*n7(+1) - k8(+2) )/( (1+r)*k6(-1) + (1-tau)*w*n6 - k7(+1) ))^(-eta) * (1+r) * ( (1-n7(+1))/(1-n6) )^(gamma*(1-eta));			// consumption-saving euler at age 6

(1-tau)*w = gamma*((1+r)*k7(-1) + (1-tau)*w*n7 - k8(+1))/(1-n7);																									// consumption-leisure euler at age 7
1/beta = (( (1+r)*k8(+1) + (1-tau)*w*n8(+1) - k9(+2) )/( (1+r)*k7(-1) + (1-tau)*w*n7 - k8(+1) ))^(-eta) * (1+r) * ( (1-n8(+1))/(1-n7) )^(gamma*(1-eta));			// consumption-saving euler at age 7

(1-tau)*w = gamma*((1+r)*k8(-1) + (1-tau)*w*n8 - k9(+1))/(1-n8);																									// consumption-leisure euler at age 8
1/beta = (( (1+r)*k9(+1) + (1-tau)*w*n9(+1) - k10(+2) )/( (1+r)*k8(-1) + (1-tau)*w*n8 - k9(+1) ))^(-eta) * (1+r) * ( (1-n9(+1))/(1-n8) )^(gamma*(1-eta));			// consumption-saving euler at age 8

(1-tau)*w = gamma*((1+r)*k9(-1) + (1-tau)*w*n9 - k10(+1))/(1-n9);																									// consumption-leisure euler at age 9
1/beta = (( (1+r)*k10(+1) + (1-tau)*w*n10(+1) - k11(+2) )/( (1+r)*k9(-1) + (1-tau)*w*n9 - k10(+1) ))^(-eta) * (1+r) * ( (1-n10(+1))/(1-n9) )^(gamma*(1-eta));			// consumption-saving euler at age 9

(1-tau)*w = gamma*((1+r)*k10(-1) + (1-tau)*w*n10 - k11(+1))/(1-n10);																									// consumption-leisure euler at age 10
1/beta = (( (1+r)*k11(+1) + (1-tau)*w*n11(+1) - k12(+2) )/( (1+r)*k10(-1) + (1-tau)*w*n10 - k11(+1) ))^(-eta) * (1+r) * ( (1-n11(+1))/(1-n10) )^(gamma*(1-eta));			// consumption-saving euler at age 10

(1-tau)*w = gamma*((1+r)*k11(-1) + (1-tau)*w*n11 - k12(+1))/(1-n11);																									// consumption-leisure euler at age 11
1/beta = (( (1+r)*k12(+1) + (1-tau)*w*n12(+1) - k13(+2) )/( (1+r)*k11(-1) + (1-tau)*w*n11 - k12(+1) ))^(-eta) * (1+r) * ( (1-n12(+1))/(1-n11) )^(gamma*(1-eta));			// consumption-saving euler at age 11

(1-tau)*w = gamma*((1+r)*k12(-1) + (1-tau)*w*n12 - k13(+1))/(1-n12);																									// consumption-leisure euler at age 12
1/beta = (( (1+r)*k13(+1) + (1-tau)*w*n13(+1) - k14(+2) )/( (1+r)*k12(-1) + (1-tau)*w*n12 - k13(+1) ))^(-eta) * (1+r) * ( (1-n13(+1))/(1-n12) )^(gamma*(1-eta));			// consumption-saving euler at age 12

(1-tau)*w = gamma*((1+r)*k13(-1) + (1-tau)*w*n13 - k14(+1))/(1-n13);																									// consumption-leisure euler at age 13
1/beta = (( (1+r)*k14(+1) + (1-tau)*w*n14(+1) - k15(+2) )/( (1+r)*k13(-1) + (1-tau)*w*n13 - k14(+1) ))^(-eta) * (1+r) * ( (1-n14(+1))/(1-n13) )^(gamma*(1-eta));			// consumption-saving euler at age 13

(1-tau)*w = gamma*((1+r)*k14(-1) + (1-tau)*w*n14 - k15(+1))/(1-n14);																									// consumption-leisure euler at age 14
1/beta = (( (1+r)*k15(+1) + (1-tau)*w*n15(+1) - k16(+2) )/( (1+r)*k14(-1) + (1-tau)*w*n14 - k15(+1) ))^(-eta) * (1+r) * ( (1-n15(+1))/(1-n14) )^(gamma*(1-eta));			// consumption-saving euler at age 14

(1-tau)*w = gamma*((1+r)*k15(-1) + (1-tau)*w*n15 - k16(+1))/(1-n15);																									// consumption-leisure euler at age 15
1/beta = (( (1+r)*k16(+1) + (1-tau)*w*n16(+1) - k17(+2) )/( (1+r)*k15(-1) + (1-tau)*w*n15 - k16(+1) ))^(-eta) * (1+r) * ( (1-n16(+1))/(1-n15) )^(gamma*(1-eta));			// consumption-saving euler at age 15

(1-tau)*w = gamma*((1+r)*k16(-1) + (1-tau)*w*n16 - k17(+1))/(1-n16);																									// consumption-leisure euler at age 16
1/beta = (( (1+r)*k17(+1) + (1-tau)*w*n17(+1) - k18(+2) )/( (1+r)*k16(-1) + (1-tau)*w*n16 - k17(+1) ))^(-eta) * (1+r) * ( (1-n17(+1))/(1-n16) )^(gamma*(1-eta));			// consumption-saving euler at age 16

(1-tau)*w = gamma*((1+r)*k17(-1) + (1-tau)*w*n17 - k18(+1))/(1-n17);																									// consumption-leisure euler at age 17
1/beta = (( (1+r)*k18(+1) + (1-tau)*w*n18(+1) - k19(+2) )/( (1+r)*k17(-1) + (1-tau)*w*n17 - k18(+1) ))^(-eta) * (1+r) * ( (1-n18(+1))/(1-n17) )^(gamma*(1-eta));			// consumption-saving euler at age 17

(1-tau)*w = gamma*((1+r)*k18(-1) + (1-tau)*w*n18 - k19(+1))/(1-n18);																									// consumption-leisure euler at age 18
1/beta = (( (1+r)*k19(+1) + (1-tau)*w*n19(+1) - k20(+2) )/( (1+r)*k18(-1) + (1-tau)*w*n18 - k19(+1) ))^(-eta) * (1+r) * ( (1-n19(+1))/(1-n18) )^(gamma*(1-eta));			// consumption-saving euler at age 18

(1-tau)*w = gamma*((1+r)*k19(-1) + (1-tau)*w*n19 - k20(+1))/(1-n19);																									// consumption-leisure euler at age 19
1/beta = (( (1+r)*k20(+1) + (1-tau)*w*n20(+1) - k21(+2) )/( (1+r)*k19(-1) + (1-tau)*w*n19 - k20(+1) ))^(-eta) * (1+r) * ( (1-n20(+1))/(1-n19) )^(gamma*(1-eta));			// consumption-saving euler at age 19

(1-tau)*w = gamma*((1+r)*k20(-1) + (1-tau)*w*n20 - k21(+1))/(1-n20);																									// consumption-leisure euler at age 20
1/beta = (( (1+r)*k21(+1) + (1-tau)*w*n21(+1) - k22(+2) )/( (1+r)*k20(-1) + (1-tau)*w*n20 - k21(+1) ))^(-eta) * (1+r) * ( (1-n21(+1))/(1-n20) )^(gamma*(1-eta));			// consumption-saving euler at age 20

(1-tau)*w = gamma*((1+r)*k21(-1) + (1-tau)*w*n21 - k22(+1))/(1-n21);																									// consumption-leisure euler at age 21
1/beta = (( (1+r)*k22(+1) + (1-tau)*w*n22(+1) - k23(+2) )/( (1+r)*k21(-1) + (1-tau)*w*n21 - k22(+1) ))^(-eta) * (1+r) * ( (1-n22(+1))/(1-n21) )^(gamma*(1-eta));			// consumption-saving euler at age 21

(1-tau)*w = gamma*((1+r)*k22(-1) + (1-tau)*w*n22 - k23(+1))/(1-n22);																									// consumption-leisure euler at age 22
1/beta = (( (1+r)*k23(+1) + (1-tau)*w*n23(+1) - k24(+2) )/( (1+r)*k22(-1) + (1-tau)*w*n22 - k23(+1) ))^(-eta) * (1+r) * ( (1-n23(+1))/(1-n22) )^(gamma*(1-eta));			// consumption-saving euler at age 22

(1-tau)*w = gamma*((1+r)*k23(-1) + (1-tau)*w*n23 - k24(+1))/(1-n23);																									// consumption-leisure euler at age 23
1/beta = (( (1+r)*k24(+1) + (1-tau)*w*n24(+1) - k25(+2) )/( (1+r)*k23(-1) + (1-tau)*w*n23 - k24(+1) ))^(-eta) * (1+r) * ( (1-n24(+1))/(1-n23) )^(gamma*(1-eta));			// consumption-saving euler at age 23

(1-tau)*w = gamma*((1+r)*k24(-1) + (1-tau)*w*n24 - k25(+1))/(1-n24);																									// consumption-leisure euler at age 24
1/beta = (( (1+r)*k25(+1) + (1-tau)*w*n25(+1) - k26(+2) )/( (1+r)*k24(-1) + (1-tau)*w*n24 - k25(+1) ))^(-eta) * (1+r) * ( (1-n25(+1))/(1-n24) )^(gamma*(1-eta));			// consumption-saving euler at age 24

(1-tau)*w = gamma*((1+r)*k25(-1) + (1-tau)*w*n25 - k26(+1))/(1-n25);																									// consumption-leisure euler at age 25
1/beta = (( (1+r)*k26(+1) + (1-tau)*w*n26(+1) - k27(+2) )/( (1+r)*k25(-1) + (1-tau)*w*n25 - k26(+1) ))^(-eta) * (1+r) * ( (1-n26(+1))/(1-n25) )^(gamma*(1-eta));			// consumption-saving euler at age 25

(1-tau)*w = gamma*((1+r)*k26(-1) + (1-tau)*w*n26 - k27(+1))/(1-n26);																									// consumption-leisure euler at age 26
1/beta = (( (1+r)*k27(+1) + (1-tau)*w*n27(+1) - k28(+2) )/( (1+r)*k26(-1) + (1-tau)*w*n26 - k27(+1) ))^(-eta) * (1+r) * ( (1-n27(+1))/(1-n26) )^(gamma*(1-eta));			// consumption-saving euler at age 26

(1-tau)*w = gamma*((1+r)*k27(-1) + (1-tau)*w*n27 - k28(+1))/(1-n27);																									// consumption-leisure euler at age 27
1/beta = (( (1+r)*k28(+1) + (1-tau)*w*n28(+1) - k29(+2) )/( (1+r)*k27(-1) + (1-tau)*w*n27 - k28(+1) ))^(-eta) * (1+r) * ( (1-n28(+1))/(1-n27) )^(gamma*(1-eta));			// consumption-saving euler at age 27

(1-tau)*w = gamma*((1+r)*k28(-1) + (1-tau)*w*n28 - k29(+1))/(1-n28);																									// consumption-leisure euler at age 28
1/beta = (( (1+r)*k29(+1) + (1-tau)*w*n29(+1) - k30(+2) )/( (1+r)*k28(-1) + (1-tau)*w*n28 - k29(+1) ))^(-eta) * (1+r) * ( (1-n29(+1))/(1-n28) )^(gamma*(1-eta));			// consumption-saving euler at age 28

(1-tau)*w = gamma*((1+r)*k29(-1) + (1-tau)*w*n29 - k30(+1))/(1-n29);																									// consumption-leisure euler at age 29
1/beta = (( (1+r)*k30(+1) + (1-tau)*w*n30(+1) - k31(+2) )/( (1+r)*k29(-1) + (1-tau)*w*n29 - k30(+1) ))^(-eta) * (1+r) * ( (1-n30(+1))/(1-n29) )^(gamma*(1-eta));			// consumption-saving euler at age 29

(1-tau)*w = gamma*((1+r)*k30(-1) + (1-tau)*w*n30 - k31(+1))/(1-n30);																									// consumption-leisure euler at age 30
1/beta = (( (1+r)*k31(+1) + (1-tau)*w*n31(+1) - k32(+2) )/( (1+r)*k30(-1) + (1-tau)*w*n30 - k31(+1) ))^(-eta) * (1+r) * ( (1-n31(+1))/(1-n30) )^(gamma*(1-eta));			// consumption-saving euler at age 30

(1-tau)*w = gamma*((1+r)*k31(-1) + (1-tau)*w*n31 - k32(+1))/(1-n31);																									// consumption-leisure euler at age 31
1/beta = (( (1+r)*k32(+1) + (1-tau)*w*n32(+1) - k33(+2) )/( (1+r)*k31(-1) + (1-tau)*w*n31 - k32(+1) ))^(-eta) * (1+r) * ( (1-n32(+1))/(1-n31) )^(gamma*(1-eta));			// consumption-saving euler at age 31

(1-tau)*w = gamma*((1+r)*k32(-1) + (1-tau)*w*n32 - k33(+1))/(1-n32);																									// consumption-leisure euler at age 32
1/beta = (( (1+r)*k33(+1) + (1-tau)*w*n33(+1) - k34(+2) )/( (1+r)*k32(-1) + (1-tau)*w*n32 - k33(+1) ))^(-eta) * (1+r) * ( (1-n33(+1))/(1-n32) )^(gamma*(1-eta));			// consumption-saving euler at age 32

(1-tau)*w = gamma*((1+r)*k33(-1) + (1-tau)*w*n33 - k34(+1))/(1-n33);																									// consumption-leisure euler at age 33
1/beta = (( (1+r)*k34(+1) + (1-tau)*w*n34(+1) - k35(+2) )/( (1+r)*k33(-1) + (1-tau)*w*n33 - k34(+1) ))^(-eta) * (1+r) * ( (1-n34(+1))/(1-n33) )^(gamma*(1-eta));			// consumption-saving euler at age 33

(1-tau)*w = gamma*((1+r)*k34(-1) + (1-tau)*w*n34 - k35(+1))/(1-n34);																									// consumption-leisure euler at age 34
1/beta = (( (1+r)*k35(+1) + (1-tau)*w*n35(+1) - k36(+2) )/( (1+r)*k34(-1) + (1-tau)*w*n34 - k35(+1) ))^(-eta) * (1+r) * ( (1-n35(+1))/(1-n34) )^(gamma*(1-eta));			// consumption-saving euler at age 34

(1-tau)*w = gamma*((1+r)*k35(-1) + (1-tau)*w*n35 - k36(+1))/(1-n35);																									// consumption-leisure euler at age 35
1/beta = (( (1+r)*k36(+1) + (1-tau)*w*n36(+1) - k37(+2) )/( (1+r)*k35(-1) + (1-tau)*w*n35 - k36(+1) ))^(-eta) * (1+r) * ( (1-n36(+1))/(1-n35) )^(gamma*(1-eta));			// consumption-saving euler at age 35

(1-tau)*w = gamma*((1+r)*k36(-1) + (1-tau)*w*n36 - k37(+1))/(1-n36);																									// consumption-leisure euler at age 36
1/beta = (( (1+r)*k37(+1) + (1-tau)*w*n37(+1) - k38(+2) )/( (1+r)*k36(-1) + (1-tau)*w*n36 - k37(+1) ))^(-eta) * (1+r) * ( (1-n37(+1))/(1-n36) )^(gamma*(1-eta));			// consumption-saving euler at age 36

(1-tau)*w = gamma*((1+r)*k37(-1) + (1-tau)*w*n37 - k38(+1))/(1-n37);																									// consumption-leisure euler at age 37
1/beta = (( (1+r)*k38(+1) + (1-tau)*w*n38(+1) - k39(+2) )/( (1+r)*k37(-1) + (1-tau)*w*n37 - k38(+1) ))^(-eta) * (1+r) * ( (1-n38(+1))/(1-n37) )^(gamma*(1-eta));			// consumption-saving euler at age 37

(1-tau)*w = gamma*((1+r)*k38(-1) + (1-tau)*w*n38 - k39(+1))/(1-n38);																									// consumption-leisure euler at age 38
1/beta = (( (1+r)*k39(+1) + (1-tau)*w*n39(+1) - k40(+2) )/( (1+r)*k38(-1) + (1-tau)*w*n38 - k39(+1) ))^(-eta) * (1+r) * ( (1-n39(+1))/(1-n38) )^(gamma*(1-eta));			// consumption-saving euler at age 38

(1-tau)*w = gamma*((1+r)*k39(-1) + (1-tau)*w*n39 - k40(+1))/(1-n39);																									// consumption-leisure euler at age 39
1/beta = (( (1+r)*k40(+1) + (1-tau)*w*n40(+1) - k41(+2) )/( (1+r)*k39(-1) + (1-tau)*w*n39 - k40(+1) ))^(-eta) * (1+r) * ( (1-n40(+1))/(1-n39) )^(gamma*(1-eta));			// consumption-saving euler at age 39

//-Special attention needed at age 40
(1-tau)*w = gamma*((1+r)*k40(-1) + (1-tau)*w*n40 - k41(+1))/(1-n40);                                                                                                    // consumption-leisure euler at age 40
1/beta = (( (1+r)*k41(+1) - k42(+2) + b)/( (1+r)*k40(-1) + (1-tau)*w*n40 - k41(+1) ))^(-eta) * (1+r) * ( 1/(1-n40) )^(gamma*(1-eta));									// consumption-saving euler at age 40

//-Retirees
1/beta = (( (1+r)*k42(+1) - k43(+2) + b )/( (1+r)*k41(-1) - k42(+1) + b ))^(-eta) * (1+r);	// consumption-saving euler at age 41

1/beta = (( (1+r)*k43(+1) - k44(+2) + b )/( (1+r)*k42(-1) - k43(+1) + b ))^(-eta) * (1+r);	// consumption-saving euler at age 42

1/beta = (( (1+r)*k44(+1) - k45(+2) + b )/( (1+r)*k43(-1) - k44(+1) + b ))^(-eta) * (1+r);	// consumption-saving euler at age 43

1/beta = (( (1+r)*k45(+1) - k46(+2) + b )/( (1+r)*k44(-1) - k45(+1) + b ))^(-eta) * (1+r);	// consumption-saving euler at age 44

1/beta = (( (1+r)*k46(+1) - k47(+2) + b )/( (1+r)*k45(-1) - k46(+1) + b ))^(-eta) * (1+r);	// consumption-saving euler at age 45

1/beta = (( (1+r)*k47(+1) - k48(+2) + b )/( (1+r)*k46(-1) - k47(+1) + b ))^(-eta) * (1+r);	// consumption-saving euler at age 46

1/beta = (( (1+r)*k48(+1) - k49(+2) + b )/( (1+r)*k47(-1) - k48(+1) + b ))^(-eta) * (1+r);	// consumption-saving euler at age 47

1/beta = (( (1+r)*k49(+1) - k50(+2) + b )/( (1+r)*k48(-1) - k49(+1) + b ))^(-eta) * (1+r);	// consumption-saving euler at age 48

1/beta = (( (1+r)*k50(+1) - k51(+2) + b )/( (1+r)*k49(-1) - k50(+1) + b ))^(-eta) * (1+r);	// consumption-saving euler at age 49

1/beta = (( (1+r)*k51(+1) - k52(+2) + b )/( (1+r)*k50(-1) - k51(+1) + b ))^(-eta) * (1+r);	// consumption-saving euler at age 50

1/beta = (( (1+r)*k52(+1) - k53(+2) + b )/( (1+r)*k51(-1) - k52(+1) + b ))^(-eta) * (1+r);	// consumption-saving euler at age 51

1/beta = (( (1+r)*k53(+1) - k54(+2) + b )/( (1+r)*k52(-1) - k53(+1) + b ))^(-eta) * (1+r);	// consumption-saving euler at age 52

1/beta = (( (1+r)*k54(+1) - k55(+2) + b )/( (1+r)*k53(-1) - k54(+1) + b ))^(-eta) * (1+r);	// consumption-saving euler at age 53

1/beta = (( (1+r)*k55(+1) - k56(+2) + b )/( (1+r)*k54(-1) - k55(+1) + b ))^(-eta) * (1+r);	// consumption-saving euler at age 54

1/beta = (( (1+r)*k56(+1) - k57(+2) + b )/( (1+r)*k55(-1) - k56(+1) + b ))^(-eta) * (1+r);	// consumption-saving euler at age 55

1/beta = (( (1+r)*k57(+1) - k58(+2) + b )/( (1+r)*k56(-1) - k57(+1) + b ))^(-eta) * (1+r);	// consumption-saving euler at age 56

1/beta = (( (1+r)*k58(+1) - k59(+2) + b )/( (1+r)*k57(-1) - k58(+1) + b ))^(-eta) * (1+r);	// consumption-saving euler at age 57

1/beta = (( (1+r)*k59(+1) - k60(+2) + b )/( (1+r)*k58(-1) - k59(+1) + b ))^(-eta) * (1+r);	// consumption-saving euler at age 58

1/beta = (( (1+r)*k60(+1) + b )/( (1+r)*k59(-1) - k60(+1) + b ))^(-eta) * (1+r);	// consumption-saving euler at age 59

// Aggregate equations
N = (n1 + n2 + n3 + n4 + n5 + n6 + n7 + n8 + n9 + n10 + n11 + n12 + n13 + n14 + n15 + n16 + n17 + n18 + n19 + n20 + n21 + n22 + n23 + n24 + n25 + n26 + n27 + n28 + n29 + n30 + n31 + n32 + n33 + n34 + n35 + n36 + n37 + n38 + n39 + n40)/60;
K = (k2(-1) + k3(-1) + k4(-1) + k5(-1) + k6(-1) + k7(-1) + k8(-1) + k9(-1) + k10(-1) + k11(-1) + k12(-1) + k13(-1) + k14(-1) + k15(-1) + k16(-1) + k17(-1) + k18(-1) + k19(-1) + k20(-1) + k21(-1) + k22(-1) + k23(-1) + k24(-1) + k25(-1) + k26(-1) + k27(-1) + k28(-1) + k29(-1) + k30(-1) + k31(-1) + k32(-1) + k33(-1) + k34(-1) + k35(-1) + k36(-1) + k37(-1) + k38(-1) + k39(-1) + k40(-1) + k41(-1) + k42(-1) + k43(-1) + k44(-1) + k45(-1) + k46(-1) + k47(-1) + k48(-1) + k49(-1) + k50(-1) + k51(-1) + k52(-1) + k53(-1) + k54(-1) + k55(-1) + k56(-1) + k57(-1) + k58(-1) + k59(-1) + k60(-1))/60;
C = (c1 + c2 + c3 + c4 + c5 + c6 + c7 + c8 + c9 + c10 + c11 + c12 + c13 + c14 + c15 + c16 + c17 + c18 + c19 + c20 + c21 + c22 + c23 + c24 + c25 + c26 + c27 + c28 + c29 + c30 + c31 + c32 + c33 + c34 + c35 + c36 + c37 + c38 + c39 + c40 + c41 + c42 + c43 + c44 + c45 + c46 + c47 + c48 + c49 + c50 + c51 + c52 + c53 + c54 + c55 + c56 + c57 + c58 + c59 + c60)/60;
end;

// initial value
initval;
k2 = 0.1;
k3 = 0.15;
k4 = 0.2;
k5 = 0.25;
k6 = 0.3;
k7 = 0.35;
k8 = 0.4;
k9 = 0.45;
k10 = 0.5;
k11 = 0.55;
k12 = 0.6;
k13 = 0.65;
k14 = 0.7;
k15 = 0.75;
k16 = 0.8;
k17 = 0.85;
k18 = 0.9;
k19 = 0.95;
k20 = 1;
k21 = 1.05;
k22 = 1.1;
k23 = 1.15;
k24 = 1.2;
k25 = 1.25;
k26 = 1.3;
k27 = 1.35;
k28 = 1.4;
k29 = 1.45;
k30 = 1.5;
k31 = 1.55;
k32 = 1.6;
k33 = 1.65;
k34 = 1.7;
k35 = 1.75;
k36 = 1.8;
k37 = 1.85;
k38 = 1.9;
k39 = 1.95;
k40 = 2;
k41 = 2.05;
k42 = 1.9;
k43 = 1.8;
k44 = 1.7;
k45 = 1.6;
k46 = 1.5;
k47 = 1.4;
k48 = 1.3;
k49 = 1.2;
k50 = 1.1;
k51 = 1;
k52 = 0.9;
k53 = 0.8;
k54 = 0.7;
k55 = 0.6;
k56 = 0.5;
k57 = 0.4;
k58 = 0.3;
k59 = 0.2;
k60 = 0.1;
n1 = 0.37;
n2 = 0.369;
n3 = 0.368;
n4 = 0.367;
n5 = 0.366;
n6 = 0.365;
n7 = 0.364;
n8 = 0.363;
n9 = 0.362;
n10 = 0.361;
n11 = 0.36;
n12 = 0.359;
n13 = 0.358;
n14 = 0.357;
n15 = 0.356;
n16 = 0.355;
n17 = 0.354;
n18 = 0.353;
n19 = 0.352;
n20 = 0.351;
n21 = 0.35;
n22 = 0.349;
n23 = 0.348;
n24 = 0.347;
n25 = 0.346;
n26 = 0.345;
n27 = 0.344;
n28 = 0.343;
n29 = 0.342;
n30 = 0.341;
n31 = 0.34;
n32 = 0.339;
n33 = 0.338;
n34 = 0.337;
n35 = 0.336;
n36 = 0.335;
n37 = 0.334;
n38 = 0.333;
n39 = 0.332;
n40 = 0.331;
K = 0.937;
N = 0.236;
r = 0.045;
w = 1.05;

end;

resid;
steady(maxit=200000);
