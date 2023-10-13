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
clear;
clc;
close all;

a = arduino();
voltages = []; % voltage vector to keep track of voltages throughout trial runs
timeList = 1:40; % amount of times for-loop will run later, which translates into seconds

thresh = 0.06; % voltage threshold for knock

countKnock = 0; % knock counter
firstKnock = 1; % knock counter condition

for index = timeList
    voltages(index) = readVoltage(a, 'A5');
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

%% Final Code
clear;
clc;
close all;

a = arduino();

% pins
piezoPin = 'A5';
buzzPin = 'D6';
redPin = 'D9';
bluePin = 'D11';
greenPin = 'D10';

% note frequencies
cNote = 1046.50;
ebNote = 1244.51;
gNote = 1567.98;

thresh = 0.06;

countKnock = 0;
firstKnock = 1;

voltages = [];

% user interaction
lightOrBuzz = input("Please indicate whether you'd like to use the light feature or buzz feature by inputting the respective number: \n  1) Buzz\n  2) Light\n");
senseTime = input("\nPlease input how many seconds you'd like the knock sensor to be active for: \n");

for i = 1:(senseTime*4)
    voltages(i) = readVoltage(a, piezoPin);
    if (lightOrBuzz == 1)
        if (voltages(i) >= thresh) & (firstKnock == 1) % checking for the first time the voltage goes beyond threshold since each knock is an up-down peak
            countKnock = countKnock + 1;
            firstKnock = 0; % set this to 0 to indicate that the voltage passed the threshold for the first time during a knock
            
            playTone(a, buzzPin, cNote, 1); % play C
            pause(0.1);
            playTone(a, buzzPin, cNote, 0); % play C
            pause(0.1);
        elseif (voltages(i) < thresh && voltages(i) >= 0.02) & (firstKnock == 1) % checking for the first time the voltage goes beyond threshold since each knock is an up-down peak
            playTone(a, buzzPin, ebNote, 1); % play E flat
            pause(.1);
            playTone(a, buzzPin, ebNote, 0); % play E flat
            pause(0.1);
        elseif (voltages(i) <= thresh) & (firstKnock == 0) % checking for when voltage goes back down below the threshold so we know that the knock has ended and the next one can be counted
            firstKnock = 1;
            
            % G will play once the piezoelectric film is unpressed (this was a slightly unintended feature, but it works well as it basically signals how long the film is being pressed for)
            playTone(a, buzzPin, gNote, 1); % play G
            pause(0.1);
            playTone(a, buzzPin, gNote, 0); % play G
            pause(0.1);
        end
    end
    
    % code for RGB LED doesn't work as expected (the LED sometimes emits a blend of colors instead of the separate ones)
    if (lightOrBuzz == 2)
        if (voltages(i) >= thresh) & (firstKnock == 1) % checking for the first time the voltage goes beyond threshold since each knock is an up-down peak
            countKnock = countKnock + 1;
            firstKnock = 0; % set this to 0 to indicate that the voltage passed the threshold for the first time during a knock
            
            writeDigitalPin(a, redPin, 1); % emit red
            pause(0.1);
            writeDigitalPin(a, redPin, 0); % turn off red
            pause(0.1);
        elseif (voltages(i) < thresh && voltages(i) >= 0.02) & (firstKnock == 1) % checking for the first time the voltage goes beyond threshold since each knock is an up-down peak
            writeDigitalPin(a, bluePin, 1); % emit blue
            pause(0.1);
            writeDigitalPin(a, bluePin, 0); % turn off blue
            pause(0.1);
        elseif (voltages(i) <= thresh) & (firstKnock == 0) % checking for when voltage goes back down below the threshold so we know that the knock has ended and the next one can be counted
            firstKnock = 1;
            
            writeDigitalPin(a, greenPin, 1); % emit green
            pause(0.1);
            writeDigitalPin(a, greenPin, 0); % turn off green
            pause(0.1);
        end
    end
    disp(voltages(i)); % sanity check
    pause(0.25);
end

fprintf("The number of knocks recorded is %i.\n", countKnock); % sanity check