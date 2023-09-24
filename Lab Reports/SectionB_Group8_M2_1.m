% Hannah Dietrich, Jack Rudofsky, Shelley Wei, Brendan Wilhelmsen
% ENGR 130
% Module 2 Lab
% Started 9/19/23
% Finished 9/21/23
% Due 9/25/23

%% LAB 1: READING TURBIDITY SIGNALS
%% 2. Connect your Arduino
%% 3. LED circuit (Shelley)
clear;
clc;
close all;

a = arduino(); % initializing arduino

timePeriod = input("Please input an amount of time you'd like the LED to be on and off: ");

for i = 1:4
    writeDigitalPin(a, 'D8', 1); % writeDigitalPin(<arduino name>, 'pin', <on/off>)
    pause(timePeriod); % leave the LED on for the amount of time the user wants
    writeDigitalPin(a, 'D8', 0);
    pause(timePeriod); % turn the LED off for the amount of time the user wants
end

%% 4. Testing your turbidity sensor (Shelley)
clear;
clc;
close all;

a = arduino();
voltage_1 = readVoltage(a, 'A0'); % around 4.222 (highest)
voltage_2 = readVoltage(a, 'A0'); % around 0.1222 (lowest)

%% LAB 2: COLLECTING AND ANALYZING TURBIDITY DATA
%% 1. Connected the Arduino button circuit (Hannah)
clear;
clc;
close all;

a = arduino();
readDigitalPin(a, 'D7'); % checking if button is pressed or not (1 means pressed, 0 means not pressed)

%% 2. Write a script to collect voltage data from the sensor (Jack)
clear;
clc;
close all;

a = arduino();
voltage_vector = [];
for i = 1:100
    if readDigitalPin(a, 'D7') == 1 % technically don't need to check if it's equal to 1 since the condition itself returning 1 means that the if-statement will run
        break; % for this if-statement to work, the button must be pressed for at least 1 second to match the loop's rerun period
    end
    voltage_vector(i) = readVoltage(a, 'A0'); % at each successive position of the vector, read a new voltage value from the turbidity sensor
    pause(1); % run the loop every second
end

% 3. Convert your voltage data to Nephelometric Turbidity Units
ntu_vector = -260 .* voltage_vector.^2 + 1800 .* voltage_vector - 3000; % dummy equation to calculate turbidity in NTU
mean_voltage = mean(voltage_vector); % calculate the mean of the voltage values
mean_ntu = mean(ntu_vector); % calculate the mean of the turbidity values