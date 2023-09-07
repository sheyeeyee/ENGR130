% Shelley Wei
% ENGR 130 Homework 3
% 9/6/23

%% Question 2
clear;
clc;
close all;

%Make a variable g to store the value of g.
g = 9.8;

%Make a vector with the three lengths of pendulum, in meters, in the order
%stated in the problem. Name the vector length
length = [.062, .248, .993];

%Make a vector with the corresponding number of pendula.
%Name the vector in_stock
in_stock = [200, 45, 126];

%Calculate the period of each length pendulum one at a time, but store in
%one vector, named T
period1 = 2*pi*sqrt(length(1)/g);
period2 = 2*pi*sqrt(length(2)/g);
period3 = 2*pi*sqrt(length(3)/g);
T = [period1, period2, period3]

%In one calculation, find the total length of the wires for each pendulum
%size. Store the result in a vector called tot_length
tot_length = length .* in_stock

%Find the total wire length of all pendula in stock WITHOUT using any
%built-in functions. Store the result in a variable named total_1.
total_1 = tot_length(1) + tot_length(2) + tot_length(3)

%Use a built-in function to find the total wire length of all
%pendula in stock. Store the result in a variable named total_2.
total_2 = sum(tot_length)

%Check the above two calculations by taking the difference between them.
%Store the result in a variable named check
check = total_1 - total_2

%% Question 3