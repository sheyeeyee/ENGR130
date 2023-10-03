%% Fixing "Roommate's" Code

%housekeeping
clear;
clc;
close all;

%given
g = 9.81;
t = 1;

%ask user for initial height value
y_0 = ('What is the initial height?');
currY = y_0;
i = 1;
times = zeros(10);

%determine vertical position values
% y_vals = y_O - 0.5*g*t^2;
y_vals = zeros(10);

%calculate position values until it reaches the ground
% while(y ~= 0)
while (currY >= 0)
    % y_vals = y_O - 0.5*g*t^2;
    y_vals(i) = y_0 - 0.5*g*t^2;

    currY = y_vals(i);
    times(i) = t;

    t = t + 0.1;
    i = i + 1;
end

%plot the data
plot(t, y_vals, "*");