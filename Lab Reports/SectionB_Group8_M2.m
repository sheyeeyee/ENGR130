% Hannah Dietrich, Jack Rudofsky, Shelley Wei, Brendan Wilhelmsen
% ENGR 130
% Module 2 Lab
% Started 9/19/23
% Finished 9//23
% Due 9/25/23

%% LAB 1: READING TURBIDITY SIGNALS
%% 2. Connect your Arduino
%% 3. LED circuit
clear;
clc;
close all;

a = arduino(); % initializing arduino

timePeriod = input("Please input an amount of time you'd like the LED to be on and off: ");

for i = 1:4
    writeDigitalPin(a, 'D8', 1); % writeDigitalPin(<arduino name>, 'pin', <on/off>)
    pause(timePeriod);
    writeDigitalPin(a, 'D8', 0);
    pause(timePeriod);
end

%% 4. Testing your turbidity sensor
clear;
clc;
close all;

a = arduino();
voltage_1 = readVoltage(a, 'A0'); % around 4.222 (highest)
voltage_2 = readVoltage(a, 'A0'); % around 0.1222 (lowest)