function T = trap(a,b,n)
%   T = trap(a, b, n) returns the approximate integral of f over [a,b]
%   using n subintervals and the composite trapezoid rule.
%
% Inputs:
%   a - lower limit of integration
%   b - upper limit of integration
%   n - number of subintervals
%
% Output:
%   T - approximation of the integral

h = (b - a)/n; % Step size.
x = a;
sum = func(x);
for i=1:(n-1)
    x = x + h;
    sum = sum + 2*func(x);
end

sum = sum + func(b);
T = h/2*sum;  % Composite Trapezoid value.

    function fx = func(x)
    % function f to take the integral of.
        fx = exp(x);
    end

end