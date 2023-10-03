% Shelley Wei
% ENGR 130
% Homework 6
% Started 9/28/23
% Submitted 9/30/23
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
B = A(mod(A, 2) == 0 & A ~= 0); % not sure why zero isn't even

%% Question 2
clear;
clc;
close all;

load("Homework\HW6_design_data.mat"); % load data from .mat file

minPressure = input("Enter the threshold value: "); % ask user for a minimum pressure
simNumber = input("Enter the simulation number (1-5): "); % ask user for which sim they want to see data below the threshold from
t = 0.1:0.1:10; % time starting from 1 second, going to 10 (100 time values)
sim1 = DesignData(:, 1);
sim2 = DesignData(:, 2);
sim3 = DesignData(:, 3);
sim4 = DesignData(:, 4);
sim5 = DesignData(:, 5);

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

plot(t, sim1, t, sim2, t, sim3, t, sim4, t, sim5);
title("Pressure Values for Each Simulation");
xlabel("Time (s)");
ylabel("Pressure (MPa)");
legend("Simulation 1", "Simulation 2", "Simulation 3", "Simulation 4", "Simulation 5");

%% Question 3: For-Loop Attempt (logical indexing attempt below)
clear;
clc;
close all;

load("HW6_PressureSensors.mat"); % load data from .mat file

bulkheadThreshold = 60; % MPa
cabinThreshold = 5; % MPa/s
warnings = 0; % set a warnings variable to be added to later for warning count

% for-loop for counting warnings (could be done with logical indexing but couldn't figure it out)
for i = 1:length(bulkhead) % iterate through every index of the bulkhead vector
    if (bulkhead(i) < bulkheadThreshold) % check for bulkhead values less than 60 MPa
        if (abs(cabin(i) - cabin(i-1)) > cabinThreshold*2) % check for delta cabin values greater than 10 MPa (since every measurement is taken 2 seconds apart and we need to know whether the cabin pressure drops by more than 5 MPa/s which is 10 MPa/2s)
            warnings = warnings + 1; % increment warnings every time the conditions are met
        end
    end
end

% give protocol instructions based on how many warnings were counted
if (warnings == 0)
    fprintf("No action required.\n");
elseif (warnings < 21)
    fprintf("There are %i warnings. Follow the POTENTIAL RISK protocol!\n", warnings);
else
    fprintf("There are %i warnings. Follow the PROBABLE RISK protocol!\n", warnings);
end

%% Question 3: Logical Indexing Attempt (happened after the for-loop attempt)
clear;
clc;
close all;

load("HW6_PressureSensors.mat");

bulkheadThreshold = 60; % MPa
cabinThreshold = 5; % MPa/s

cabinPressureRate = diff(cabin); % calculate the rate of MPa change every 2 seconds since measurements are taken every 2 seconds
cabinPressureRate = [0, cabinPressureRate]; % add a 0 to the beginning of the rate vector to shift the vector to the right so that the rate of the previous 2 seconds is compared to the current bulkhead pressure
cabinPressureRate(end) = []; % remove the last element of the rate vector so it's the same length as the bulkhead vector

warningIndices = bulkhead < bulkheadThreshold & abs(cabinPressureRate) > cabinThreshold*2; % returns 0s and 1s for every index depending on whether it's true or not
warnings = sum(warningIndices); % adding all of the warningIndices values together (will only add 1s since every other number will be 0)

if (warnings == 0)
    fprintf("No action required.\n");
elseif (warnings < 21)
    fprintf("There are %i warnings. Follow the POTENTIAL RISK protocol!\n", warnings);
else
    fprintf("There are %i warnings. Follow the PROBABLE RISK protocol!\n", warnings);
end