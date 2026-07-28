function x=to_dec(a,b)
%{
Program:    to_dec.m
Author:     Alex Capaldi
Date:       9/10/25
Purpose:    This program converts an integer in base b to decimal using the
             clever algorithm (Horner's Method).

%}
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