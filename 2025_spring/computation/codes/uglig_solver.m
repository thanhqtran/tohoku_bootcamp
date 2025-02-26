%rbc uhlig
clear all;

%params
beta = 0.97;       % Discount factor
delta = 0.06;     % Depreciation rate
alpha = 0.35;      % Capital share in production
gamma = 0.4;       % Weight parameter in the utility function
A_bar = 1;         % Value of A_bar (given)
rhoa = 0.95;

% Step 1: Compute the steady-state return on capital (R_bar)
R_bar = 1 / beta + delta - 1;

% Step 2: Compute the steady-state labor (L_bar)
L_bar = (gamma * (1 - alpha) * (1 - beta + beta * delta)) / ...
        ((1 - gamma) * (1 - beta + (1 - alpha) * beta * delta) + ...
         gamma * (1 - alpha) * (1 - beta + beta * delta));

Y_bar = (alpha/R_bar)^(alpha/(1-alpha)) * L_bar;
K_bar = (alpha/R_bar) * Y_bar;
I_bar = delta * K_bar;
C_bar = Y_bar - I_bar;

% Define matrices
A = [0; -K_bar; 0; 0]
B = [0; (1 - delta) * K_bar; alpha; -1]
C = [1, -1, -1/(1-L_bar), 0; ...
     Y_bar, -C_bar, 0, 0; ...
     -1, 0, 1-alpha, 0; ...
     1, 0, 0, -1]
D = [0; 0; 1; 0]
F = [0]; G = [0]; H = [0]
J = [0, -1, 0, beta * R_bar]
K = [0, 1, 0, 0]
L = [0]; M = [0]
N = [rhoa];

% Solve for P (quadratic equation)
C_inv = inv(C);
a = F - J * C_inv*A
b = - (J * C_inv * B - G + K * C_inv * A)
c = - K * C_inv * B + H
DELTA = b^2 - 4 * a * c;
P1 = (-b + sqrt(DELTA))/(2*a);
P2 = (-b - sqrt(DELTA))/(2*a);
P = min(abs(P1), abs(P2));

% Solve for R
R = -C_inv * (A * P + B);

% Solve for Q

k = 1; % Number of columns in Q, based on the dimension of z_t
I_k = eye(k);

% LHS matrix for the system
LHS = kron(N', F - J * C_inv * A) + kron(I_k, J * R + F * P + G - K * C_inv * A);

% RHS vector for the system
RHS = (J * C_inv * D - L) * N + K * C_inv * D - M;

% Solve for vectorized Q
Q_vec = LHS \ RHS;

% Since Q is 1x1, assign directly
Q = Q_vec; % No need to reshape for scalar values

% Solve for S
S = -C_inv * (A * Q + D);

% Display results
disp('P = '); disp(P);
disp('R = '); disp(R);
disp('Q = '); disp(Q);
disp('S = '); disp(S);
