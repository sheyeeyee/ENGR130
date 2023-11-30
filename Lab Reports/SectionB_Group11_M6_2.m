% Nikhil Misra, Edward Liu, Shelley Wei, Cindy Ning
% ENGR 130 Module 6 Report
% Section B
% 11/30/23

%% LAB 3
% 2) Calibrate the infrared sensor
clear; clc; close all;

dist = [6.7, 9, 14.4, 13.7];
volt = [1.19, 1.4, 2.25, 2.1];

functionVolt = readSensor(dist, volt);

hold on;
plot(dist, volt);
plot(dist, functionVolt);
hold off;

%% Functions
% LAB 3
function cm = readSensor(distance, voltage)
    % Takes in a sensor reading in volts and returns the corresponding distance of the puck from the fan in centimeters
    % Call format: readSensor(voltage)
    % Input
    %   voltage: the voltage reading from the sensor at the top of the tube on the fan
    % Output
    %   cm: the distance the puck is from the fan in centimeters
    
    coeff = polyfit(distance, voltage, 1);
    cm = polyval(coeff, distance);
end