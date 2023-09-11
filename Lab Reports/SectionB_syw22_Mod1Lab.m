% Shelley Wei
% ENGR 130
% Module 1 Lab
% Started 9/11/23
% Finished 9//23
% Due 9/18/23

%% LAB 1: MATLAB VECTORS, MATRICES, INPUT AND OUTPUT
%% 1. Variable Operators
clear;
clc;
close all;

r1 = 80;
r2 = 10;
r3 = 15;
rVector = [r1, r2, r3];
rT = 1 / sum(1 ./ rVector)

%% 2. Matrices
clear;
clc;
close all;

a2 = [1:5] % integer values 1 through 5
b2 = [2, 3; 4, 9; 4, 11] % 3x2 matrix
c2 = [a2(1), a2(3); a2(2), a2(3); a2(4), a2(5)] % another 3x2 matrix
d2 = c2 + b2 % add c2 and b2
e2 = b2 - c2 % subtract c2 from b2
f2 = b2 .* c2 % multiply c2 and b2
g2 = max(c2)
h2 = max(c2')
