% Shelley Wei
% ENGR 130
% Lecture Preparation 10
% Started 11/5/23
% Finished 11/5/23
% Due 11/7/23

%% Generating Random Numbers
clear; clc; close all;

num1 = rand(); % random num from 0 to 1 non-inclusive
randi(n); % random pos integer from 1 to n inclusive
randi([m, n]); % random integer from m to n inclusive

%% Practice 1
clear; clc; close all;

% want to simulate patient temp btwn 96.0 and 102.5
temp = 96 + rand * (102.5 - 96); % min + rand * range

%% Practice 2
clear; clc; close all;

% generate vector of first 15 random stripes from integer widths of 5 to 9 inches
numStripes = 15;
stripes = zeros(1, numStripes);

for i = 1:numStripes
    stripes(i) = randi([5, 9]);
end

disp(stripes);