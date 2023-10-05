%housekeeping
clear;
clc;
close all;

%initial conditions and constants
v_x = 200; % horizontal velocity
y_o = 1000; %initial height
y_f = 0;  %final height
g = 9.8;    

% putting initial values into vectors and loop
t = 0;
idx = 0;
x(1) = 0;
y(1) = y_o;

% calculate x and y coordinates as payload drops
% until parachute is deployed
while (y(idx) ~= y_f)
    idx = idx+1;
    t = t + .1;
    x(idx) = v_x*t;
    y(idx) = y_o - .5*g*t^2;
end

% check horizontal distance and display appropriate message
if x(idx) > 2800
    fprintf('The distance of %.2f is in Zone 3.\n');
if x(idx) > 1400
    disp('%.2f is in Zone 2.\n', x(idx));
else
    disp('The chute will deploy in Zone 1.\n');
end