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
y = 1; % m
vel = 0; % m/s
dt = 0.0001; % s
t = 1:0.0001:10;
c = 0; % N*s/m
k = 0; % N/m
g = 9.81; % m/s^2
acc = (-m*g - k*y - c * vel) / m;

for i = t
    if (y > 0)
        y = y + vel*dt;
        vel = vel + acc*dt;
    else
        c = 2;
        k = 5000;
        y = y + vel*dt;
        vel = vel + acc*dt;
    end
end

plot(t, y);

%% 2. Try different c and k values