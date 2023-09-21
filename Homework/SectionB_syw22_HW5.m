% Shelley Wei
% ENGR 130
% Homework 5
% Started 9/20/23
% Submitted 9//23
% Due 9/26/23

%% Question 1
clear;
clc;
close all;

% Input data
x = [0.124,  0.745,  1.391,  2.195,  2.789,  3.638,  4.121,  5.001, 5.671,  6.479,  6.916,  8.127,  8.533,  9.06, 10.186]; %  a vector of x values
y = [0.078,  0.439,  0.768,  0.982,  0.984,  0.755,  0.520, -0.001, -0.521, -0.821, -0.933, -0.923, -0.807, -0.503,  0.116]; % a vector of y values

% Calculate the polynomial coefficients here
% Complete the line below, replacing ... with the appropriate code
p = polyfit(x, y, 4); % How am I supposed to know that it's 4th degree? Am I supposed to test that?

% Create a vector of 100 equally-spaced values between 0.124 and 10.186,
% replacing ... with the appropriate code
x_fit = linspace(0.124, 10.186, 100);

% Complete the line below, replacing ... with the appropriate code
y_fit = polyval(p, x_fit);      % evaluate x_fit using the polynomial you generated earlier
    
% Plot the fitted data and the original data on the same axes
plot(x_fit, y_fit, '-', x, y, 'o');
legend('Fitted data', 'Original data');
title('Practice with Data Fitting');
xlabel('x (units unknown)');
ylabel('y (units unknown)');

%% Question 2
clear;
clc;
close all;

% constants
g = 9.8; % m/s^2
v0 = 140; % m/s
tStep = 0.075; % s

% variables
h = 0; % m
v = v0;
t = 0;

% vectors
tVector = [];
vVector = [];
hVector = [];

while (h >= 0)
    % the length of these vectors increases by 1 every iteration because the vector is re-equal to itself plus the following value generated from the loop
    tVector = [tVector, t];
    vVector = [vVector, v];
    hVector = [hVector, h];

    t = t + tStep; % update time
    v = v0 - g*t; % calculate new velocity
    h = v0*t - 0.5*g*t^2; % calculate new height
end

plot(tVector, hVector);
plot(tVector, vVector);