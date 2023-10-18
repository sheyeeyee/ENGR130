% Jorge Feijoo, Schuyler Moore, Stephan Norquist, Shelley Wei
% ENGR 130
% Module 2 Lab
% Started 10/17/23
% Finished 10//23
% Due 10//23

%% 1. Simulate the ball dropping
% 1b.
clear;
clc;
close all;

m = 1; % kg
y = [1]; % m
vel = 0; % m/s
dt = 0.0001; % s (time increment)
t = 10; % s (total time for ball to fall/bounce)
k = 0; % N/m
c = 0; % N*s/m
g = 9.81; % m/s^2

for i = 1:t/dt
    if (y(i) > 0)
        a = accel(m, g, k, y(i), c, vel);
        vel = vel + a*dt;
        y = [y, y + vel*dt]; % apparently there are too many y values, something's wrong with the calculations
    else % ball hits ground
        a = accel(m, g, 5000, y(i), 2, vel);
        vel = vel + a*dt;
        y = [y, y + vel*dt];
    end
end

% 1c.
plot(t, y);
title("Ball Motion Over Time");
xlabel("Time (s)");
ylabel("Ball Height (m)");

% 1d.
min_height = min(y);

% 1g.
comet(t, y, 0.01);

%% 2. Try different c and k values
%% 1st set of k and c values
m = 1; % kg
y = [1]; % m
vel = 0; % m/s
dt = 0.0001; % s (time increment)
t = 10; % s (total time for ball to fall/bounce)
k = 8000; % N/m
c = 2; % N*s/m
g = 9.81; % m/s^2



%% 2nd set of k and c values
m = 1; % kg
y = [1]; % m
vel = 0; % m/s
dt = 0.0001; % s (time increment)
t = 10; % s (total time for ball to fall/bounce)
k = 5000; % N/m
c = 4; % N*s/m
g = 9.81; % m/s^2



%% 3rd set of k and c values
m = 1; % kg
y = [1]; % m
vel = 0; % m/s
dt = 0.0001; % s (time increment)
t = 10; % s (total time for ball to fall/bounce)
k = 5000; % N/m
c = 10; % N*s/m
g = 9.81; % m/s^2



%% Function Definitions
function acceleration = accel(m, g, k, y, c, vel)
    % Calculates acceleration of ball
    % Call format: accel(m, g, k, y, c, vel)
    % Input
    %   m: mass in kg
    %   g: gravity in m/s^2
    %   k: force constant of spring

    acceleration = (-m*g - k*y - c * vel) / m;
end