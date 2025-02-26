% Run uhlig_solver.m first
% shock
rho = .95;

% one-time shock with epsilon = .01
T = 40; %time horizon

tilde_A = zeros(1,T);
tilde_K = zeros(1,T);
tilde_Y = zeros(1,T);
tilde_C = zeros(1,T);
tilde_L = zeros(1,T);
tilde_R = zeros(1,T);

% one-time shock
s = 1;

tilde_A(s) = 0.01;
for t = s:T
    tilde_Y(t) = R(1) * tilde_K(t) + S(1) * tilde_A(t);
    tilde_C(t) = R(2) * tilde_K(t) + S(2) * tilde_A(t);
    tilde_L(t) = R(3) * tilde_K(t) + S(3) * tilde_A(t);
    tilde_R(t) = R(4) * tilde_K(t) + S(4) * tilde_A(t);
    % Update only if t < 100
    if t < T
        tilde_A(t+1) = rho * tilde_A(t);
        tilde_K(t+1) = P * tilde_K(t) + Q * tilde_A(t);
    end
end

variables = {tilde_Y,tilde_C,tilde_K,tilde_L,tilde_R,tilde_A}
labels = {'Y', 'C', 'K', 'L', 'R', 'A'};
horizon = s:T;

figure;
for i = 1:length(variables)
    subplot(2,3,i);
    plot(horizon, variables{i}, 'b', 'LineWidth', 1); %
    hold on;
    title(labels{i});
    yline(0, 'Color','r', 'LineWidth', 1); % Zero line (dotted)
    grid on;
end
