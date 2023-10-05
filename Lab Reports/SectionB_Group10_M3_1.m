% Jorge Feijoo, Schuyler Moore, Stephan Norquist, Shelley Wei
% ENGR 130
% Module 2 Lab
% Started 10/3/23
% Finished 10/5/23
% Due 10/9/23

%% LAB 1: MEASURING SIGNALS WITH THE OSCILLOSCOPE
%% 3. Arduino signal analysis
clear;
clc;
close all;

% 3b
% set up Arduino
A = arduino();

% turn the light on & off at a frequency of 1 Hz over a period of 30 seconds
for i = 1:30
    writeDigitalPin(A, "D8", 1);
    pause(0.5);
    writeDigitalPin(A, "D8", 0);
    pause(0.5)
end

%% LAB 2: PIEZOELECTRIC FILM
%% 2. Process CSV data
clear;
clc;
close all;

% 2a
piezoKnock = readmatrix('SectionB_Group10_M3_1.csv'); % importing data from oscilloscope

piezoKnock = piezoKnock(4:1667, :); % removing NaN values from original data

% important values (different voltage values, which are in column 2 of the data)
[piezoKnockMin, minIdx] = min(piezoKnock(:, 2)); % finding the minimum voltage and the index of it to plot later
[piezoKnockMax, maxIdx] = max(piezoKnock(:, 2)); % finding the maximum voltage and the index of it to plot later
piezoKnockMean = mean(piezoKnock(:, 2)); % finding the mean voltage to plot later

% 2b
hold on;
plot(piezoKnock(:, 1), piezoKnock(:, 2), "k"); % actual data
plot(piezoKnock(maxIdx), piezoKnockMax, "bo"); % max point
plot(piezoKnock(minIdx), piezoKnockMin, "rsquare"); % min point
yline(piezoKnockMean, "--magenta"); % mean
hold off;

% labels
legend("Voltages from Knocks", "Maxmimum Voltage", "Maximum Voltage", "Mean Voltage");
xlabel("Time (s)");
ylabel("Voltage");
title("Piezoelectric Voltage Data from Knocks")