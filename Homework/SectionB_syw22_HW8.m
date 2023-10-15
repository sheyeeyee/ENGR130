% Shelley Wei
% ENGR 130
% Homework 8
% Started 10/14/23
% Submitted 10/14/23
% Due 10/18/23

%% Question 2
clear;
clc;
close all;

load('HW8_gait_data.mat');

% Part 1
% sort cadences and strides in ascending order so the graph is readable
cadenceSort = sort(cadence);
strideSort = sort(stride_length);

% create a plot with cadences and strides
figure(1);
plot(strideSort, cadenceSort);
title("Relationship Between Stride Length and Stride Cadence");
xlabel("Stride Length (Average Length of Stride (cm)");
ylabel("Cadence (Average Number of Steps per Minute");

strideRange = max(stride_length) - min(stride_length); % the range() function only seems to work with integer values
fprintf("The range of stride lengths is approximately %.2f cm.\n", strideRange);

% Part 2
strideSegment = strideRange/8; % divide the range by 8 to get eight segments/groups
strideStdev = zeros(1,8); % create a vector of eight 0s to compile the stride lengths in the different deviations

% count how many patients have a stride length in each segment
for i = 1:length(strideSort)
    if (strideSort(i) <= strideSegment)
        strideStdev(1) = strideStdev(1) + 1;
    elseif (strideSort(i) <= strideSegment*2)
        strideStdev(2) = strideStdev(2) + 1;
    elseif (strideSort(i) <= strideSegment*3)
        strideStdev(3) = strideStdev(3) + 1;
    elseif (strideSort(i) <= strideSegment*4)
        strideStdev(4) = strideStdev(4) + 1;
    elseif (strideSort(i) <= strideSegment*5)
        strideStdev(5) = strideStdev(5) + 1;
    elseif (strideSort(i) <= strideSegment*6)
        strideStdev(6) = strideStdev(6) + 1;
    elseif (strideSort(i) <= strideSegment*7)
        strideStdev(7) = strideStdev(7) + 1;
    else
        strideStdev(8) = strideStdev(8) + 1;
    end
end

% create a second plot with std dev
figure(2);
bar(strideStdev);
title("Standard Deviation of Stride Lengths");
xlabel("Standard Deviation");
ylabel("Number of Stride Lengths per Standard Deviation");

% Part 3
strideTime = 60 ./ cadence; % calculate the time length of the avg stride by converting min to sec and reciprocating to get time/step instead of step/time
stanceSwing = stance + swing; % add stance and swing time
diff = abs(strideTime - stanceSwing); % create a vector for differences in time btwn avg stride time and stance + swing time

discrepant = diff(diff > 0.01); % find how many patients have discrepant data (their avg stride time and stance + swing time aren't the same)
disIdx = find(diff > 0.01); % find the indices of the patients with discrepant data (finding where the condition doesn't return 0)
disPatient = patient(disIdx); % find the patients at those indices

% forgot how to find elements at certain indices so just used for-loop, figured out how to use logical indexing later
% disPatient = [];
% 
% for i = 1:disIdx
%     disPatient = [disPatient, patient(disIdx)];
% end

% forgot how to find indices so just used for-loop, figured out how to use logical indexing later
% disIdx = [];
% 
% for i = 1:length(diff)
%     if (diff(i) > 0.1)
%         disIdx = [disIdx, i];
%     end
% end

fprintf("There are %i patients with discrepant data: \n", length(discrepant));

% display all patients with discrepant data
for i = 1:length(discrepant)
    fprintf("  Patient %i\n", disPatient(i));
end