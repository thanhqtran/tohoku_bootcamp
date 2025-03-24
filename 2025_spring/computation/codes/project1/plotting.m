% step 1: run the model
% step 2: run this file to plot

addpath /Applications/Dynare/6.2-arm64/matlab

% run the first model
dynare OLG_12periods_oldpolicy.mod

% Extract steady-state values
c_vals = [oo_.steady_state(strmatch('c1', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('c2', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('c3', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('c4', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('c5', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('c6', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('c7', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('c8', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('c9', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('c10', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('c11', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('c12', M_.endo_names, 'exact'))
          ];

k_vals = [0; % k1 is zero
          oo_.steady_state(strmatch('k2', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('k3', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('k4', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('k5', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('k6', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('k7', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('k8', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('k9', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('k10', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('k11', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('k12', M_.endo_names, 'exact'))
          ];

n_vals = [oo_.steady_state(strmatch('n1', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('n2', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('n3', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('n4', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('n5', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('n6', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('n7', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('n8', M_.endo_names, 'exact'));
          0;    %n9 is zero
          0;    %n10 is zero
          0;    %n11 is zero
          0    %n12 is zero
          ];

inc_vals = [c_vals(1) + k_vals(2);
            c_vals(2) + k_vals(3);
            c_vals(3) + k_vals(4);
            c_vals(4) + k_vals(5);
            c_vals(5) + k_vals(6);
            c_vals(6) + k_vals(7);
            c_vals(7) + k_vals(8);
            c_vals(8) + k_vals(9);
            c_vals(9) + k_vals(10);
            c_vals(10) + k_vals(11);
            c_vals(11) + k_vals(12);
            c_vals(12)];

% run the second model
dynare OLG_12periods_newpolicy.mod

% Extract steady-state values
c_vals2 = [oo_.steady_state(strmatch('c1', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('c2', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('c3', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('c4', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('c5', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('c6', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('c7', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('c8', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('c9', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('c10', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('c11', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('c12', M_.endo_names, 'exact'))
          ];

k_vals2 = [0; % k1 is zero
          oo_.steady_state(strmatch('k2', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('k3', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('k4', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('k5', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('k6', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('k7', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('k8', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('k9', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('k10', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('k11', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('k12', M_.endo_names, 'exact'))
          ];

n_vals2 = [oo_.steady_state(strmatch('n1', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('n2', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('n3', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('n4', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('n5', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('n6', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('n7', M_.endo_names, 'exact'));
          oo_.steady_state(strmatch('n8', M_.endo_names, 'exact'));
          0;    %n9 is zero
          0;    %n10 is zero
          0;    %n11 is zero
          0    %n12 is zero
          ];

inc_vals2 = [c_vals2(1) + k_vals2(2);
            c_vals2(2) + k_vals2(3);
            c_vals2(3) + k_vals2(4);
            c_vals2(4) + k_vals2(5);
            c_vals2(5) + k_vals2(6);
            c_vals2(6) + k_vals2(7);
            c_vals2(7) + k_vals2(8);
            c_vals2(8) + k_vals2(9);
            c_vals2(9) + k_vals2(10);
            c_vals2(10) + k_vals2(11);
            c_vals2(11) + k_vals2(12);
            c_vals2(12)];


% plot
ages = 1:12;

figure;

% Plot capital (k) against age
subplot(2,2,1);
h1 = plot(ages, k_vals, '-', 'LineWidth', 2); 
hold on;
h2 = plot(ages, k_vals2, '-', 'LineWidth', 2); 
xlabel('Age');
ylabel('Capital');
title('Capital Held Over Life Cycle');
grid on;

% Plot labor (n) against age
subplot(2,2,2);
plot(ages, n_vals, '-', 'LineWidth', 2); 
hold on;
plot(ages, n_vals2, '-', 'LineWidth', 2); 
xlabel('Age');
ylabel('Labor');
title('Labor Supply Over Life Cycle');
grid on;

% Plot consumption (c) against age
subplot(2,2,3);
plot(ages, c_vals, '-', 'LineWidth', 2); 
hold on;
plot(ages, c_vals2, '-', 'LineWidth', 2); 
xlabel('Age');
ylabel('Consumption');
title('Consumption Over Life Cycle');
grid on;

% Plot income against age
subplot(2,2,4);
plot(ages, inc_vals, '-', 'LineWidth', 2); 
hold on;
plot(ages, inc_vals2, '-', 'LineWidth', 2); 
xlabel('Age');
ylabel('Income');
title('Income Over Life Cycle');
grid on;

% Create a single legend for the entire figure
lgd = legend([h1, h2], {'repl = 0.3', 'repl = 0.2'}, 'Orientation', 'horizontal');
lgd.Position = [0.35, 0.05, 0.3, 0.05];  % [left bottom width height] (adjust as needed)
