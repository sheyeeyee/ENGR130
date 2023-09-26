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
clear;
clc;
close all;

load("Homework\HW6_design_data.mat");
col3threshold = DesignData(DesignData(:,3) < 1850);

fprintf("There are %i values in column 3 below the threshold of 1850 PSI.\n", length(col3threshold));

[minValues, minIndices] = min(DesignData);
[maxValues, maxIndices] = max(DesignData);
fprintf("\nMinimum PSIs:\n Column 1: %i\n   Index: %i\n", minValues(1), minIndices(1));
fprintf(" Column 2: %i\n   Index: %i\n", minValues(2), minIndices(2));
fprintf(" Column 3: %i\n   Index: %i\n", minValues(3), minIndices(3));
fprintf(" Column 4: %i\n   Index: %i\n", minValues(4), minIndices(4));
fprintf(" Column 5: %i\n   Index: %i\n", minValues(5), minIndices(5));

fprintf("\nMaximum PSIs:\n Column 1: %i\n   Index: %i\n", maxValues(1), maxIndices(1));
fprintf(" Column 2: %i\n   Index: %i\n", maxValues(2), maxIndices(2));
fprintf(" Column 3: %i\n   Index: %i\n", maxValues(3), maxIndices(3));
fprintf(" Column 4: %i\n   Index: %i\n", maxValues(4), maxIndices(4));
fprintf(" Column 5: %i\n   Index: %i\n", maxValues(5), maxIndices(5));