% Extract steady-state values from Dynare
k_vals = oo_.steady_state(1:59); % k2 to k60
n_vals = oo_.steady_state(60:99); % n1 to n40
c_vals = oo_.steady_state(100:159) % c1 to c60

% Define age vector
ages = 21:80; % Age 1 to 60

% Prepend k1 = 0
k_vals = [0; k_vals]; 

% Append n41 to n60 = 0
n_vals = [n_vals; zeros(20,1)]; 

% construct income
inc_vals = [];
for t = 1:59
    inc_vals(t) = c_vals(t) + k_vals(t+1);
end
inc_vals(60) = c_vals(60);

% plot

figure;

% Plot capital (k) against age
subplot(2,2,1);  % subplot(no.of rows, no.of columns, graph no.1)
plot(ages, k_vals, 'b-', 'LineWidth', 2); %b is blue, o is marker
xlabel('Age');
ylabel('Capital');
title('Capital Held Over Life Cycle');
grid on;

% Plot labor (n) against age
subplot(2,2,2); % subplot(no.of rows, no.of columns, graph no.2)
plot(ages, n_vals, 'r-', 'LineWidth', 2); %r is red, o is marker
xlabel('Age');
ylabel('Labor');
title('Labor Supply Over Life Cycle');
grid on;

% Plot consumption (c) against age
subplot(2,2,3); % subplot(no.of rows, no.of columns, graph no.3)
plot(ages, c_vals, 'b-', 'LineWidth', 2); %r is red, o is marker
xlabel('Age');
ylabel('Consumption');
title('Consumption Supply Over Life Cycle');
grid on;

% Plot income against age
subplot(2,2,4); % subplot(no.of rows, no.of columns, graph no.4)
plot(ages, inc_vals, 'r-', 'LineWidth', 2); %r is red, o is marker
xlabel('Age');
ylabel('Income');
title('Income Over Life Cycle');
grid on;
