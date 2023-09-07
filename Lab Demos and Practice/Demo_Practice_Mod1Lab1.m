% Shelley Wei
% ENGR 130
% Module 1 Lab 1
% 9/7/23

%% Practice 1
clear;
clc;
close all;

v1 = [3:8]
v2 = [1.3:.4:2.5] % you can control decimal places displayed with fprintf
v3 = [9:-2:3] % how do you make it backwards? negative increment

v2_2 = linspace(1.3, 2.5, 4)

% test matrix with different vector sizes
nums = [v1; v2]

%% Practice 2
clear;
clc;
close all;

% Each table tries to create the same matrix in many different ways
% m1 = linspace(5, 11, 4; 27, 6, 4) % can't use linspace to make a matrix
% m2 = [linspace(5,11,4); linspace(27,6,4)] % use functions in vector creations
% m3 = [5;27, 7;20, 9;13, 11;6]

%% Practice 3
clear;
clc;
close all;

V = [1:6];
M = [1:4;5:8;10:13];

% length finds length of row
lengthV = length(V)
lengthM = length(M)

% size finds dimensions (rows first, then column)
sizeV = size(V)
sizeM = size(M)

% numel finds number of elements
numelV = numel(V)
numelM = numel(M)

% max finds max
maxV = max(V)

% max finds max per column
maxM = max(M)
maxMaxM = max(max(M)) % to find the max of the entire matrix, nest max in max

% min finds min
minV = min(V)

% min finds min per column
minM = min(M)
minMinM = min(min(M))

%% Practice 4
