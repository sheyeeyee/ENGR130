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
c = 0; % N*s/m
k = 0; % N/m
g = 9.81; % m/s^2

for i = 1:t/dt
    if (y(t) > 0)
        a = accel(m, g, k, y(t), c, vel);
        y = [y, y + vel*dt];
        vel = vel + a*dt;
    else % ball hits ground
        a = accel(m, g, 5000, y(t), 2, vel);
        y = [y, y + vel*dt];
        vel = vel + a*dt;
    end
end

% 1c.
plot(t, y);
title("Ball Motion Over Time");
xlabel("Time (s)");
ylabel("Ball Height (m)");

% 1d.
min_height = min(y);

function acceleration = accel(m, g, k, y, c, vel)
    % Calculates acceleration of ball
    % Call format: accel(m, g, k, y, c, vel)
    % Input
    %   m: mass in kg
    %   g: gravity in m/s^2
    %   k: force constant of spring

    acceleration = (-m*g - k*y - c * vel) / m;
end

%% 2. Try different c and k values