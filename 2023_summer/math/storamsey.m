% Parameters 
alphax = 0.3;
betax = 0.9;
deltax = 0.1;
sigmax = 2;
sxs = 10;
rhox = 0.9;
% Ini
kx0 = 20;
sx0 = 10;
% Calculate the steady state
kxs = (alphax*betax*sxs / (1-betax*(1-deltax)))^(1/(1-alphax));
cxs = sxs*(kxs^alphax) - deltax*kxs;
% Coefficient
a1 = ((1-alphax)/sigmax)*alphax*betax * sxs*(kxs^(alphax-1));
a2 = (1/sigmax)*alphax*betax*sxs*(kxs^(alphax-1));
b1 = 1/betax;
b2 = (1/(alphax*betax))*(1-betax*(1-deltax));
b3 = sxs*(kxs^(alphax-1)) - deltax;
% Eigenvalues and eigenvectors of Ax
M1 = zeros(3,3);

M1(1,1) = -1;
M1(2,1) = -b3;
M1(2,2) = b1;
M1(2,3) = b2;
M1(3,3) = rhox;

M2 = zeros(3,3);
M2(1,1) = -1;
M2(1,2) = -a1;
M2(1,3) = a2;
M2(2,2) = 1;
M2(3,3) = 1;

Ax = inv(M1)*M2;
[Q,L] = eig(Ax);

Q(1,1)
