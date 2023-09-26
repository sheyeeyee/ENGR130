% Shelley Wei
% ENGR 130
% Lecture 4
% 9/19/23

%% LOGICAL INDEXING
%% Practice 1
clear;
clc;
close all;

load("Homework\HW6_design_data.mat");
writematrix(DesignData, "Lecture Preparation and Practice\Lecture5_Practice1_Export.csv");

%% Logical Vectors/Matrices
clear;
clc;
close all;

orig = [2, -4, 9, -7, 0];
positives = orig > 0; % logical array

% How do we extract values that satisfy the criterion? LOGICAL INDEXING
%% Example 1
clear;
clc;
close all;

vec = [5 9 3 4 6 11];
bigOnes = vec(vec > 5); % one step to create a vector of the values greater than 5 in vec

%% Example 2
clear;
clc;
close all;

vec = [5 9 3 4 6 11];

isBig = vec > 5;
bigOnes = vec(isBig);
bigOnesLogical = vec(vec > 5); % multiple steps

%% Practice 2
clear;
clc;
close all;

values = [6 8 2 0 6 0 7];
nonZero = values(values ~= 0); % vectorName(logical test)

%% Practice 3
load("Homework\HW6_design_data.mat");
col3threshold = DesignData(DesignData(:,3) < 1850);

fprintf("There are %i values in column 3 below the threshold of 1850 PSI.\n", length(col3threshold));

minThreshold = min(col3threshold);
maxThreshold = max(col3threshold);
fprintf("Minimum PSI in column 3 w/in threshold: %i\n", minThreshold);
fprintf("Maximum PSI in column 3 w/in threshold: %i\n", maxThreshold);