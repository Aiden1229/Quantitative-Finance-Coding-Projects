%% Introduction

%{
Program:  quadrature_compare.m
Author:   Aiden Allen
Due Date: 11/18/2025
Purpose:  Compare Errors of Various Quadrature Formulas
%}

%% Define Variables
% a                  = Left Endpoint of Integral
% b                  = Right Endpoint of Integral
% true               = True Value of the Integral
% ns                 = Given "n" values
% n                  = Specific "n"
% k                  = Indexing Variable
% M                  = Value of the Midpoint Rule for the Given n
% T                  = Value of the Trapezoid Rule for the Given n
% betterint(a, b, n) = Function that Computes the New Integral Formula
% IntForm            = Output of betterint(a, b, n)
% M_errors           = Midpoint Formula Error
% T_errors           = Trapezoid Formula Error
% IntForm_errors     = New Integral Error (Combined Midpoint and Trapezoid)
% M_val              = Midpoint Value
% T_val              = Trapezoid Value
% IntForm_val        = New Integral Value
% M_ratio            = Ratio of Successive Errors in Midpoint Formula
% T_ratio            = Ratio of Successive Errors in Trapezoid Formula
% IntForm_ratio      = Ratio of Successive Errors in New Formula
% Error_Table        = Table of Errors for the Three Formulas
% Ratio_Table        = Table of Ratios of Successive Errors of The Formulas

% Compute the Integral using Three Different Quadrature Formulas
a    = 0;
b    = 2;
true = exp(2) - 1;  % Gives the true value of the integral (plugging in endpoints "0" and "2")
ns   = [100 200 400]; % Given "n" values

% Inititalize Matrice for each Method's Error
M_errors       = zeros(1, length(ns));
T_errors       = zeros(1, length(ns));
IntForm_errors = zeros(1, length(ns));

% Loop through the ns to and find errors

for k = 1:length(ns)
    n = ns(k);

    M_val       = mid(a, b, n);
    T_val       = trap(a, b, n);
    IntForm_val = betterint(a, b, n);

    M_errors(k)       = abs(M_val - true);
    T_errors(k)       = abs(T_val - true);
    IntForm_errors(k) = abs(IntForm_val - true);
end

% Build Error Table

Error_Table = table(ns', M_errors', T_errors', IntForm_errors', ...
    'VariableNames', {'n', 'MidpointError', 'TrapezoidError', 'NewIntegralError'});

disp('Error Table (Absolute Errors):');
disp(Error_Table);

% Compute Ratio of Successive Errors
M_ratio       = M_errors(1:2)       ./ M_errors(2:3); % "./" is a shortcut for elementwise division, creating a 1x2 vector here
T_ratio       = T_errors(1:2)       ./ T_errors(2:3);
IntForm_ratio = IntForm_errors(1:2) ./ IntForm_errors(2:3);

% Build Ratio Table

Ratio_Table = table(M_ratio', T_ratio', IntForm_ratio', ...
    'VariableNames', {'MidpointRatio', 'TrapezoidRatio', 'NewIntegralRatio'});

disp('Ratio of Successive Errors of each Integral:');
disp(Ratio_Table);

function IntForm = betterint(a,b,n)
% Call functions from folder
M = mid(a,b,n);
T = trap(a,b,n);
% Use new function from written portion
IntForm = (M + 2*T)/3;
end