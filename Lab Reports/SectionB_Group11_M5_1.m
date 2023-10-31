% Shelley Wei, Cindy Ning, Nikhil Misra, Edward Liu
% ENGR 130
% Module 5, Group 11
% Started 10/31/23
% Finished 10/31/23
% Due 11/6/23

% LAB 1
clear; clc; close all;

% declaring dt and the time vector
dt = 1/1024;

time = linspace(0, 1-dt, 1024);

numel(time);

% LAB 2
amp = [1 20 5 3 17 1.5];
freq = [12 17 20 5 15 5];

y_comp = getComposite(freq, amp, time);
plot(time, y_comp, "r");
title("Composite Signal Graph");
xlabel("Time (sec)");
ylabel("Midterm Grade for ENGR130 (unitless)"); % ~ Dr. Harper

% Functions
function  y = getSinusoid(f,A,t)
    % This function generates the y-value of a given sine function & time domain
    % Call Format: getSinusoid(f,A,t)
    % Input: 
    %    f - frequency
    %    A - amplitude
    %    t - time vector
    % Output: 
    %    y - the y-values of the sinusoid
    y = A*sin(2*pi*f.*t);
end

function composite = getComposite(f,A,t)
    % Generates the y-value for a given composite (sum of sine functions)
    % Call Format: getComposite(f,A,t)
    % Input: 
    %    f - frequency vector
    %    A - amplitude vector
    %    t - time vector
    % Output: 
    %    composite - the y-values of the composite
    if (length(f) ~= length(A))
        error("The length of the frequency and amplitude vector is different");
    end
          
    composite = 0;

    for i = 1:length(f)
       composite = composite + getSinusoid(f(i),A(i),t);
    end
end