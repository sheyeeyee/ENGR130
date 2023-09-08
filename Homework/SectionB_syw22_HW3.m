% Shelley Wei
% ENGR 130 Homework 3
% Started 9/6/23
% Finished 9/8/23
% Due 9/13/23

%% Question 2
clear;
clc;
close all;

%Make a variable g to store the value of g.
g = 9.8;

%Make a vector with the three lengths of pendulum, in meters, in the order
%stated in the problem. Name the vector length
length = [.062, .248, .993];

%Make a vector with the corresponding number of pendula.
%Name the vector in_stock
in_stock = [200, 45, 126];

%Calculate the period of each length pendulum one at a time, but store in
%one vector, named T
period1 = 2*pi*sqrt(length(1)/g);
period2 = 2*pi*sqrt(length(2)/g);
period3 = 2*pi*sqrt(length(3)/g);
T = [period1, period2, period3]

%In one calculation, find the total length of the wires for each pendulum
%size. Store the result in a vector called tot_length
tot_length = length .* in_stock

%Find the total wire length of all pendula in stock WITHOUT using any
%built-in functions. Store the result in a variable named total_1.
total_1 = tot_length(1) + tot_length(2) + tot_length(3)

%Use a built-in function to find the total wire length of all
%pendula in stock. Store the result in a variable named total_2.
total_2 = sum(tot_length)

%Check the above two calculations by taking the difference between them.
%Store the result in a variable named check
check = total_1 - total_2

%% Question 3
% the following housekeeping commands also mean that only the last section
% will be displayed if you try to run all sections (since these commands
% will clear anything that happened before them)
clear;
clc;
close all;

% Planck's constant in joule-seconds
h = 6.626e-34;

% masses of particles in vector mass in kg
mass = [1.6726e-27, 1.6726e-27, 1.6749e-27, 1.6749e-27, 6.6447e-27];

% speeds of protons in vector speed (m/s)
speed = [2.7e4, 4.3e5, 1.5e4, 3.6e5, 8.6e5];

% deBroglie wavelengths in nm (convert from m to nm)
lambda = h./(mass.*speed)*1e9; % scientific notation always has to have a number/variable before it, no operations, otherwise MATLAB will think "e" is a variable
% lambda = h./(mass.*speed)e9; <-- this wouldn't work
% lambda = h./(mass.*speed)*e9; <-- this wouldn't work

fprintf('The minimum possible deBroglie wavelength is %.4f nm.\n', min(lambda));
fprintf('For this set, the average deBroglie wavelength is %.4f nm.\n', sum(lambda)./length(lambda)); % can't use size() bc vectors are matrices and size gives dimensions even if it's 1x#

deviceNum = input('What is the number of the device that you would like to know about?\n');
fprintf('Here are the details for device %i:\n', deviceNum);
fprintf('   Mass of particle: %.2E kg\n', mass(deviceNum)); % the display is case sensitive to scientific notation (so if you put a lowercase e for the data type, it would show lowercase e for scientific notation)
fprintf('   Speed of particle: %.2f km/s\n', speed(deviceNum)/1e3); % converting m/s to km/s
fprintf('   deBroglie wavelength: %.4f nm\n', lambda(deviceNum));