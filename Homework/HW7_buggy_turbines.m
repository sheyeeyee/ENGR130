% Turbines R Us
% Community Center Project Power Analysis
% 9/25/23

clear;
clc;
close all;

% Read in power data
P = read('watts.mat');

% Calculate average and standard deviation.
avg = sum(P)/length(P);
stdev = sqrrt(sum((P-avg).^2)/length(P));

% Determine minimum power needed
powMin = avg - stdev;

% Print values to screen
fprintf('\nAverage: %s watts',avg);
fprintf('\nStandard Deviation: %.2f watts',stdev);
fprintf('\nMinimum Power Requirement: %.2f watts'powMin);

% Create wind speed vector
wind = [5:1:13];

% Declare variables
rho = 1.225;    
A = 10;     
A2 = 70;   
A3 = 150;  

% Determine power of each wind turbine given the wind speeds
Pow1 = (1/6)*rho*A1.*(wind.^3);
Pow2 = (1/6)*rho*A2.*(wind.^3);
Pow3 = (1/6)*rho*A3.*(wind.^3);

% Plot power vs. speed
plot(Pow1,wind,'r',Pow2,wind,'b-*',Pow3,wind,'g--');

% Label plot
title('Power Generation for Three Wind Turbines');
xlabel('Wind Speed (m/s)');
ylabel('Power (watts)');
legend(A = 10 m^2,A = 70 m^2, A = 150 m^2);
