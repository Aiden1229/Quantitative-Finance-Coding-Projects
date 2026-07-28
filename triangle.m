%% Introduction

%{ 
Program: triangle.m
Author:  Aiden Allen
Date:    8/28/25
Purpose: Given vertices, calculate area and perimeter of a triangle and
plot it.
%}

%% Description of Variables

% a     = length of side 1 of the triangle
% x1    = x-coordinate of vertice 1
% y1    = y-coordinate of vertice 1

% b     = length of side 2 of the triangle
% x2    = x-coordinate of vertice 2
% y2    = y-coordinate of vertice 2

% c     = length of side 3 of the triangle
% x3    = x-coordinate of vertice 3
% y3    = y-coordinate of vertice 3

% P     = perimeter of the triangle
% semiP = semi-perimeter of the triangle (1/2 P)
% A     = area of the triangle

%% Prompt User for Coordinates of Vertices
x1 = input('What is the x-coordinate of the first vertice of the triangle? ');
y1 = input('What is the y-coordinate of the first vertice of the triangle? ');

x2 = input('What is the x-coordinate of the second vertice of the triangle? ');
y2 = input('What is the y-coordinate of the second vertice of the triangle? ');

x3 = input('What is the x-coordinate of the third vertice of the triangle? ');
y3 = input('What is the y-coordinate of the third vertice of the triangle? ');

%% Perform Calculations

% Length of Sides
a = sqrt((x2-x1)^2 +(y2-y1)^2);
b = sqrt((x3-x2)^2 +(y3-y2)^2);
c = sqrt((x3-x1)^2 +(y3-y1)^2);

% Perimeter of Triangle
P = a + b + c;

% Semi-Perimeter of the Triangle
semiP = 1/2*P;

% Area of the Triangle
A = sqrt(semiP*(semiP - a)*(semiP - b)*(semiP - c));

% Print Calculations
fprintf('The Perimeter of the Triangle is %4.2f. ', P);
fprintf('The Area of the Triangle is %4.2f. ', A);

%% Plot the Triangle

% Data for Vertices
x = [x1 x2 x3];
y = [y1 y2 y3];

% We must repeat the first vertice to close the triangle
x_closed = [x x1];
y_closed = [y y1];

% Create Figure and Plot
figure;
plot (x_closed, y_closed, '--g');
hold on; 
scatter (x, y, 'green', 'filled');
title('Your Triangle');
xlabel('x');
ylabel('y');

grid on;

% Set Custom axes limits
xlim([min(x)-1 max(x)+1]);
ylim([min(y)-1 max(y)+1]);