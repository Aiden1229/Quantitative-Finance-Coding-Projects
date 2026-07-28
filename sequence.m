%% Introduction

%{ 
Program:  sequence.m
Author:   Aiden Allen
Due Date: 9/11/2025
Purpose:  To create a function that given the amount of numbers in a sequence,
the first term, and the second term, make a table of the sequence and plot
it on a graph.
%}

%% Define Variables
% n   = Positive Integer, inputted
% a1  = First Term of the Sequence, inputted
% a2  = Second Term of the Sequence, inputted
% k   = Indexing Term
% a_k = General Term of Sequence at index k

%% Calculate the Sequence

function [A_table] = sequence(n, a1, a2)
   format long; % Display full decimal value
    A = zeros(n,1); % Preallocate 0s in array (column vector that has sequence values)
    A(1) = a1;
        if (n >= 2)
             A(2) = a2;
         end 

    for i = 3:n
        A(i) = (A(i-1) + A(i-2))/2;
    end
    k = (1:n)'; % Creates column vector with integers 1 to n, representing "k"
    A_table = table(k, A, 'VariableNames', {'k', 'a_k'});

    figure;
        plot(k, A, '*', 'LineStyle','none');
        xlabel('k');
        ylabel('a_k');
        title('Sequence:  a_{k+2} = (a_{k+1} + a_k) / 2');
        grid on; 
end 






