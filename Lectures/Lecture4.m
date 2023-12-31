% Shelley Wei
% ENGR 130
% Lecture 4
% 9/19/23

%% CURVE FITTING BY REGRESSION
%% Quiz Testing
clear;
clc;
close all;

screws = 26;
nails = 8;
bolts = 15;

(screws > bolts + nails)

%% Practice 1
clear;
clc;
close all;

force = [0,0.982,1.964,2.946,3.928,4.910,5.892];
displacement = [0.001,0.0432,0.079,0.134,0.169,0.2012,0.2592];

plot(displacement, force, 'ro');
title("Displacement as a Result of Different Forces");
xlabel("Displacement (meters)");
ylabel("Force (Newtons)");

%% Determining a Spring Constant
% F = kx (Hooke's Law)
% the constant, k, is only constant over a certain range (over-stretching = damaging)

% Regression
% technicque for fitting a smooth curve to discrete data points
% basically fitting a polynomial with points

% ex) polyfit(x_data, y_data, order) <-- order for the order of the polynomial

%% Practice 2
clear;
clc;
close all;

force = [0,0.982,1.964,2.946,3.928,4.910,5.892];
displacement = [0.001,0.0432,0.079,0.134,0.169,0.2012,0.2592];

fit_coeff = polyfit(displacement, force, 1); % calculating coefficient of line from data points
fit_coeff(1); % k = slope = fit_coeff
plot(displacement, force, 'r');
title("Displacement as a Result of Different Forces");
xlabel("Displacement (meters)");
ylabel("Force (Newtons)");

%% Curve-Fitting Example (uhhh)
clear;
clc;
close all;

x = [1:7];
y = [3 23 25 15 9 5 9];
hold on;
plot(x, y,'r*');
coeff = polyfit(x,y,3); % 2nd order doesn't fit very well

curve_fit_x = 0:0.1:8;
curve_fit_y = polyval(coeff, curve_fit_x);
plot(curve_fit_x, curve_fit_y);
hold off;

%% Another Example (???)
clear;
clc;
close all;

force = [0,0.982,1.964,2.946,3.928,4.910,5.892];
displacement = [0.001,0.0432,0.079,0.134,0.169,0.2012,0.2592];

plot(displacement, force, 'r');
fit_coeff = polyfit(displacement, force, 1); % calculating coefficient of line from data points
fit_force(fit_coeff);
title("Displacement as a Result of Different Forces");
xlabel("Displacement (meters)");
ylabel("Force (Newtons)");

%% Practice 3
clear;
clc;
close all;

vX = 200; % m/s
x = 0;
y = 1000; % m
g = 9.81; % m/s
t = 0:0.1:10;

while (y < 185)
    t = t + 0.1;
    x = vX.*t;
    y = y - 0.5*g*t.^2;
end

plot(x, y);
xlabel("Horizontal Position (m)");
ylabel("Veritcal Position (m)");
title("Coordinates of Falling Box");