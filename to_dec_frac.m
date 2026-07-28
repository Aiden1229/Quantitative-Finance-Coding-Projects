function x = to_dec_frac(a,b)
% This program converts a fractional number between 0 and 1 in base b 
% to decimal using the clever algorithm.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Variable Listing:
%  a     - a vector of digits in base b
%  b     - the number base of a
%  x     - a in decimal representation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x = a(1);           % Inner most parens is the most significant digit.
for i=2:length(a)
    x = x*b + a(i);
end
x = x/b^(length(a));