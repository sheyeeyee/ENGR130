% Hannah Dietrich, Jack Rudofsky, Shelley Wei, Brendan Wilhelmsen
% ENGR 130
% Module 2 Lab
% Started 9/26/23
% Finished 9//23
% Due 10/2/23

%% LAB 3: Sensor Calibration and Filter Design
%% 1. Construct the Arduino button circuit
clear;
clc;
close all;

a = arduino();
voltage = readVoltage(a, 'A0')

%% 2. Calibrate your sensor
% re-run for each NTU
clear;
clc;
close all;

a = arduino();

voltages = [];

for i = 1:40
    voltages(i) = readVoltage(a, 'A0');
    pause(0.25);
end

mean_voltage = mean(voltages)

%% Plotting sensor data
clear;
clc;
close all;

mean_voltages = [4.1819, 3.9077, 3.8541, 3.3757];
ntu_values = [0, 250, 500, 1000];

hold on;
plot(ntu_values,mean_voltages,'o');
p = polyfit(ntu_values, mean_voltages, 2);
y = polyval(p, ntu_values);
plot(ntu_values, y);
hold off;

title("Mean Voltages of Turbidity Sensor of Different NTU Values of Water");
xlabel("NTU Values");
ylabel("Mean Voltages");

fprintf("NTU = %.2ev^2 + %.2ev + %.2f\n", p(1), p(2), p(3));