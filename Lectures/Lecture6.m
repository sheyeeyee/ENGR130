% Shelley Wei
% ENGR 130
% Lecture 6
% 10/3/23

%% DEBUGGING
%% Name That Error!
%% Practice 1
clear;
clc;
close all;

a = 1;
b = 2;

if (a = b) % you need to compare two values with ==, not = (which is for assigning variables)
    fprintf("a = b!");
end

%% Practice 1.5
clear;
clc;
close all;

response = input("Yes or no?\n"); % forgot to include 's' because MATLAB is expecting a number

%% Practice 2
clear;
clc;
close all;

fprintf("Today is a great day to learn MATLAB\n"; % forgot to include end parenthesis

%% Say the Code Out Loud (if you don't want to say it out loud, then remove suppression to see results while the code is running or disp code)
clear;
clc;
close all;

for i = 1:10
    sumOfSquares = 0; % resetting to 0 every time which is not what we want, we want to sum the squares of every number from 1 to 10
    sumOfSquares = sumOfSquares + i^2;
end