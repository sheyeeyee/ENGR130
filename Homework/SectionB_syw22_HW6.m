% Shelley Wei
% ENGR 130
% Homework 6
% Started 9/28/23
% Submitted 9//23
% Due 10/4/23

%% Question 1
clear;
clc;
close all;

%bring in data from data file
load("HW6_numbers.mat");

%in one line, find how many elements of vector A are equal to 4
Num_of_4s = length(A(A == 4));

%in one line, find how many elements of vector A are divisible by 5
Div_by_5 = length(A(mod(A, 5) == 0));

%in one line, sum all of the elements of the vector A that are greater than
%50.
Sum_Over_50 = sum(A(A > 50));

%in one line, find the mean value of all elements of the vector A that are
%less than 30.
Mean_Under_30 = mean(A(A < 30));

%in one line, find how many elements are equal to the maximum value in the
%vector A
Number_at_Max = length(A(A == max(A)));

%in one line, create a new vector with all the even-valued elements in A
B = A(mod(A, 2) == 0 & A ~= 0);

%% Question 2
clear;
clc;
close all;

load("Homework\HW6_design_data.mat"); % load data from .mat file

minPressure = input("Enter the threshold value: "); % ask user for a minimum pressure
simNumber = input("Enter the simulation number (1-5): "); % ask user for which sim they want to see data below the threshold from

thresholdData = DesignData(DesignData(:, simNumber) < minPressure); % logical indexing
% the vector thresholdData is equal to a vector of pressures in below the minimum pressure in the simulation

fprintf("Simulation %i generated values below the threshold %i times.\n", simNumber, length(thresholdData)); % print the info that the user requested

[minValues, minIndices] = min(DesignData); % extract minimum values and indices
[maxValues, maxIndices] = max(DesignData); % extract maximum values and indices

% multiply the indices by 0.1 to turn the indices into time (0.1 second difference between each successive measurement)
maxTime = 0.1 .* maxIndices;
minTime = 0.1 .* minIndices;

% use a for-loop to print max and min for each simulation
for i = 1:5
    fprintf("\nSimulation %i:\nMaximum value: %i PSI at %.1f s.\nMinimum value: %i PSI at %.1f s.\n", i, maxValues(i), maxTime(i), minValues(i), minTime(i));
end

%% Question 3
clear;
clc;
close all;

load("HW6_PressureSensors.mat");

warnings = 0;

% for-loop for counting warnings
for i = 1:length(bulkhead)
    if (bulkhead(i) < 60)
        if (abs(cabin(i) - cabin(i-1)) > 10)
            warnings = warnings + 1;
        end
    end
end

% attempt at logical indexing
% bulkheadWarnings = bulkhead(bulkhead < 60);
% cabinWarnings = cabin(< 10); % how do you check if the difference between two consecutive values is less than 10?

if (warnings == 0)
    fprintf("No action required.\n");
elseif (warnings < 21)
    fprintf("There are %i warnings. Follow the POTENTIAL RISK protocol!\n", warnings);
else
    fprintf("There are %i warnings. Follow the PROBABLE RISK protocol!\n", warnings);
end