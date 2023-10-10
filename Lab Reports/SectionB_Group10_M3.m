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

% 3b.
% set up Arduino
a = arduino();

% turn the light on & off at a frequency of 1 Hz over a period of 30 seconds
for i = 1:30
    writeDigitalPin(a, "D8", 1);
    pause(0.5);
    writeDigitalPin(a, "D8", 0);
    pause(0.5)
end

%% LAB 2: PIEZOELECTRIC FILM
%% 2. Process CSV data
clear;
clc;
close all;

% 2a.
piezoKnock = readmatrix('SectionB_Group10_M3_1.csv'); % importing data from oscilloscope

piezoKnock = piezoKnock(4:1667, :); % removing NaN values from original data

% important values (different voltage values, which are in column 2 of the data)
[piezoKnockMin, minIdx] = min(piezoKnock(:, 2)); % finding the minimum voltage and the index of it to plot later
[piezoKnockMax, maxIdx] = max(piezoKnock(:, 2)); % finding the maximum voltage and the index of it to plot later
piezoKnockMean = mean(piezoKnock(:, 2)); % finding the mean voltage to plot later

% 2b.
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
title("Piezoelectric Voltage Data from Knocks");

%% LAB 3: DETECTING KNOCKS
% 3. Write a knock sensor script in MATLAB
clear;
clc;
close all;

% 3a.
a = arduino();
voltages = [];
timeList = 1:40; % 4 Hz means 4 readings per second, so over 10 seconds there will be 40 readings

for index = timeList
    voltages(index) = readVoltage(a, 'A1');
    disp(voltages(index)); % sanity check
    pause(0.25); % pause for 0.25 seconds between each reading which means 4 readings per second
end

disp(voltages); % sanity check

% 3b.
hold on;
plot(timeList, voltages);
xlabel("Time in quarter-seconds");
ylabel("Voltages in volts");
title("Voltages of Knocks Over Time");
  
% 3c.
thresh = 0.06;
plot(timeList(voltages >= thresh), voltages(voltages >= thresh), "ro");
yline(thresh, "--");

%% 3e.
a = arduino();
voltages = [];
timeList = 1:40;

thresh = 0.06;

countKnock = 0;
firstKnock = 1;

for index = timeList
    voltages(index) = readVoltage(a, 'A1');
    if (voltages(index) >= thresh) & (firstKnock == 1) % checking for the first time the voltage goes beyond threshold since each knock is an up-down peak
        countKnock = countKnock + 1;
        firstKnock = 0; % set this to 0 to indicate that the voltage passed the threshold for the first time during a knock
    elseif (voltages(index) <= thresh) & (firstKnock == 0) % checking for when voltage goes back down below the threshold so we know that the knock has ended and the next one can be counted
        firstKnock = 1;
    end
    disp(voltages(index)); % sanity check
    pause(0.25);
end
fprintf("The number of knocks recorded is %i.\n", countKnock);