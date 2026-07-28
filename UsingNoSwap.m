%% Lab 9 - Part (b): Using gauss_noswap
% This script uses gauss_noswap.m to solve the system
% a*x1 + x2 = 1
% x1   + x2 = 2
% for a = 10^(-n), n = 4, 8, 12, 16, then computes errors.

clear; clc;

% n values and corresponding a values
n_vals = [4 8 12 16];
a_vals = 10.^(-n_vals);

% Preallocate error arrays
err_x1 = zeros(size(n_vals));
err_x2 = zeros(size(n_vals));

% Loop over each n
for k = 1:length(n_vals)
    
    a = a_vals(k);
    
    % Augmented matrix for the system:
    % [a  1 | 1]
    % [1  1 | 2]
    A = [a 1 1;
         1 1 2];
    
    % Solve using gauss_noswap
    [x_gauss, Atri] = gauss_noswap(A);
    
    % Exact solution from part (a):
    % x1 = -1/(a - 1),   x2 = 2 + 1/(a - 1)
    x1_exact = -1/(a - 1);
    x2_exact = 2 + 1/(a - 1);
    
    % Absolute errors
    err_x1(k) = abs(x_gauss(1) - x1_exact);
    err_x2(k) = abs(x_gauss(2) - x2_exact);
end

% Put results in a table for easy viewing
Results_partb = table(n_vals.', a_vals.', err_x1.', err_x2.', ...
    'VariableNames', {'n', 'a', 'Error_x1', 'Error_x2'});

disp(Results_partb);
