% Shelley Wei
% ENGR 130
% Lecture 6 Falling Example
% 10/3/23

%% Fixing "Roommate's" Code
clear;
clc;
close all;

% given
g = 9.81;
t = 0;

% ask user for initial height value
y_0 = input('What is the initial height in meters?\n');
currY = y_0;

times = 0; % initialize time vector

% determine vertical position values
% y_vals = y_O - 0.5*g*t^2;
y_vals = 0; % initialize height vector

i = 1; % initialize index for loop

% calculate position values until it reaches the ground
% while(y ~= 0)
while (currY >= 0)
    % y_vals = y_0 - 0.5*g*t^2;
    y_vals(i) = y_0 - 0.5*g*t^2;

    currY = y_vals(i); % re-initializing current Y value
    times(i) = t; % store time values in vector

    % t = t + 1;
    t = t + 0.1; % increment time by 0.1s
    i = i + 1; % increment index
end

% plot the data
plot(times, y_vals, "*");
xlabel("Time (s)");
ylabel("Height (m)");
title("Height of falling object over time");