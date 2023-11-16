% Shelley Wei
% ENGR 130
% Homework 12
% Started 11/14/23
% Submitted 11//23
% Due 11/22/23

%% Problem 2
clear; clc; close all;

rng('shuffle');

num_orange = 150; % number of oranges

% velocity limits
a = 20;
b = 30;
c = 25;
d = 45;

% the calculations in the two lines below contain no errors - promise!
x_vel = a + (a + b) * rand([num_orange, 1]); % m/s; constant horizontal velocity
y_vel = c + (c + d) * rand([num_orange, 1]); % m/s; initial vertical velocity

made_it = 0; % initialize counter for number of oranges that hit the pile

figure();
hold on; %*** forgot hold on

for n = 1:num_orange
    % call the user-defined function
    made_it = made_it + orange_flight(x_vel(n), y_vel(n)); %*** iterate the variable for number of oranges made into the compost
end

hold off

fprintf('%i oranges will make the compost pile.\n', made_it); %*** trying to print how many make the compost pile, not how many missed

%% Problem 3
clear; clc; close all;

% Problem Statement

%% Code w/ Errors
clear; clc; close all;

%% Code w/o Errors


%% Functions
% Problem 2
function [compost] = orange_flight(vx, vy) %*** switch x and y velocity
    % This function takes the initial velocity of an orange, calculates its
        % final x location, and plots the orange's flight path
    % Format of Call: orange_flight(x_vel(n), y_vel(n))
    % Input: Horizontal velocity & initial vertical velocity for the specific
        % orange
    % Output: logical (1 if the orange landed in the compost pile, 0 if it
        % didn't)
    
    % constants:
    g = -9.81; % m/s^2
    dt = 0.25; % m/s    
    compost_dist = 500; % m; distance to the compost pile
    m = 200; % g; mass of orange
    xi = 0; % m; inital horizontal distance
    yi = 50; % m; initial height
    t = 0; % s; time vector
    x = xi; % x position vector
    y = yi; % y position vector
    
    idx = 1; % counter
    compost = 0; % counter for oranges that make it in
    
    while y(idx) >= 0
        % while the orange is in flight 
        idx = idx + 1;
        t(idx) = t(idx-1) + dt;
        x(idx) = xi + vx*t(idx);
        y(idx) = yi + vy(1)*t(idx) + 0.5*g*t(idx)^2;
    end
    
    if x(idx) >= compost_dist %*** should be greater than or equal to for oranges that make it into the compost, not just equal to
        % if the orange misses the compost pile [IGNORE]
        compost = compost + 1;
    else
        % if the orange MAKES IT INTO the compost pile [IGNORE]
        plot(x, y, '*'); %*** switch x and y
        title('Flights of Oranges that Missed the Compost Pile');
        xlabel('horizontal distance (m)');
        ylabel('height (m)'); %*** forgot quotes around y-axis label
    end
end %*** forgot to end function