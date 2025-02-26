% Ensure the model has run
% dynare OLG_6periods_fix.mod noclearall

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

l_vals = [oo_.steady_state(strmatch('l1', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('l2', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('l3', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('l4', M_.endo_names, 'exact'));
          0;    %l5 is zero
          0     %l6 is zero
          ];

ages = 1:6;

figure;

% Plot capital (k) against age
subplot(1,2,1);
plot(ages, k_vals, 'bo-', 'LineWidth', 2);
xlabel('Age');
ylabel('Capital');
title('Capital Accumulation Over Life Cycle');
grid on;

% Plot consumption (c) against age
subplot(1,2,2);
plot(ages, l_vals, 'ro-', 'LineWidth', 2);
xlabel('Age');
ylabel('Labor');
title('Labor Supply Over Life Cycle');
grid on;
