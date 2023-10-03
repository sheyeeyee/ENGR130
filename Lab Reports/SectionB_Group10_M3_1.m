% Jorge Feijoo, Schuyler Moore, Stephan Norquist, Shelley Wei
% ENGR 130
% Module 2 Lab
% Started 10/3/23
% Finished 10//23
% Due 10/9/23

%% LAB 1: MEASURING SIGNALS WITH THE OSCILLOSCOPE
%% 3. Arduino signal analysis
clear;
clc;
close all;

% Set up Arduino
A = arduino();

% Turn the light on & off at a frequency of 1 Hz over a period of 30 seconds.
for i = 1:30
    writeDigitalPin(A, "D8", 1);
    pause(0.5);
    writeDigitalPin(A, "D8", 0);
    pause(0.5)
end

%% LAB 2: PIEZOELECTRIC FILM
%% 2. Process CSV data