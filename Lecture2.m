% Shelley Wei
% ENGR 130
% Lecture 2
% 9/5/23

%% INPUT AND OUTPUT IN MATLAB
%% Practice 1
clear;
clc;
close all;

% ask user for age
age = input('Please enter your age in years: ');

% calculate target heart rate
THR = (220 - age) * 0.6;

% share results
fprintf('A person %i years old has a target heart rate of %.1f beats/min. \n', age, THR);

%% Practice 4
clear;
clc;
close all;

% Planck's constant in joule-seconds
h = 6.626e-34;

% mass of proton
m = 1.67e-27;

% speeds of protons in km/s
speed1 = 2.7e4/1000;
speed2 = 4.3e5/1000;

% deBroglie wavelengths in nm
lambda1 = h/(m*speed1*1e12);
lambda2 = h/(m*speed2*1e12);

% average wavelength
lambdaAvg = (lambda1 + lambda2)/2;

% display mass of proton
fprintf('Mass of proton: %.2e\n', m);

% display speeds
fprintf('\nSpeed of proton 1: %.2f km/s\n', speed1);
fprintf('Speed of proton 2: %.2f km/s\n', speed2);

% display wavelengths
fprintf('\nWavelength of proton 1: %.4e nm\n', lambda1);
fprintf('Wavelength of proton 2: %.4e nm\n', lambda2);

% display average wavelength of both
fprintf('\nAverage wavelength of both protons: %.4e nm\n', lambdaAvg);