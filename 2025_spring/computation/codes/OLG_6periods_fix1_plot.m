% step 1: run the model
% step 2: run this file to plot


% Extract steady-state values
c_vals = [oo_.steady_state(strmatch('c1', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('c2', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('c3', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('c4', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('c5', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('c6', M_.endo_names, 'exact'))
          ];

k_vals = [0; % k1 is zero
          oo_.steady_state(strmatch('k2', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('k3', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('k4', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('k5', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('k6', M_.endo_names, 'exact'))
          ];

n_vals = [oo_.steady_state(strmatch('n1', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('n2', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('n3', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('n4', M_.endo_names, 'exact'));
          0;    %n5 is zero
          0     %n6 is zero
          ];
% check the constraint to see how the total income (on the left-hand side) is constructed
inc_vals = [c_vals(1) + k_vals(2);
            c_vals(2) + k_vals(3);
            c_vals(3) + k_vals(4);
            c_vals(4) + k_vals(5);
            c_vals(5) + k_vals(6);
            c_vals(6)];

ages = 1:6;

% plot

figure;

% Plot capital (k) against age
subplot(2,2,1);  % subplot(no.of rows, no.of columns, graph no.1)
plot(ages, k_vals, 'bo-', 'LineWidth', 2); %b is blue, o is marker
xlabel('Age');
ylabel('Capital');
title('Capital Held Over Life Cycle');
grid on;

% Plot labor (n) against age
subplot(2,2,2); % subplot(no.of rows, no.of columns, graph no.2)
plot(ages, n_vals, 'ro-', 'LineWidth', 2); %r is red, o is marker
xlabel('Age');
ylabel('Labor');
title('Labor Supply Over Life Cycle');
grid on;

% Plot consumption (c) against age
subplot(2,2,3); % subplot(no.of rows, no.of columns, graph no.3)
plot(ages, c_vals, 'bo-', 'LineWidth', 2); %r is red, o is marker
xlabel('Age');
ylabel('Consumption');
title('Consumption Supply Over Life Cycle');
grid on;

% Plot income against age
subplot(2,2,4); % subplot(no.of rows, no.of columns, graph no.4)
plot(ages, inc_vals, 'ro-', 'LineWidth', 2); %r is red, o is marker
xlabel('Age');
ylabel('Income');
title('Income Over Life Cycle');
grid on;
