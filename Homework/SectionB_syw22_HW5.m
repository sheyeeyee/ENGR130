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

figure(1); % create one figure
plot(tVector, hVector);
xlabel("Time (s)");
ylabel("Height of Rocket (m)");
title("Rocket Height Over Time");

figure(2); % create another figure
plot(tVector, vVector);
xlabel("Time (s)");
ylabel("Velocity of Rocket (m)");
title("Rocket Velocity Over Time");

%% Question 3
clear;
clc;
close all;

% constants
g = 9.8; % m/s^2
y0 = 1000; % m
tStep = 0.1; % s

% variables
vX = 200; % m/s
x = 0;
y = y0;
t = 0;

% vectors
xVector = [];
yVector = [];

while (y >= 185)
    % compiling x and y values into vectors for plot
    xVector = [xVector, x];
    yVector = [yVector, y];

    % increase time
    t = t + tStep;

    % calculating x and y values over time
    x = vX*t;
    y = y0 - 0.5*g*t^2;
end

hold on;
plot(xVector, yVector, '--');
xlabel("Horizontal Position of Package");
ylabel("Vertical Position of Package");
title("Position of Package of Humanitarian Aid Supplies After Dropped from Plane");

% randX = [];
% y10 = [];
x10 = [];
y10 = [];

for i = 1:10:100
    x10 = [x10, xVector(i)];
    y10 = [y10, yVector(i)];
end
% tried to get random coordinates, but unnecessary
% for i = 1:10
%     randIndex = randi(129);
%     randX = [randX, xVector(randIndex)];
%     randY = [randY, yVector(randIndex)];
% end

plot(x10, y10, 'ro');

linearCoeff = polyfit(x10, y10, 1); % find coefficients of best-fit line
linearFitX = x10(1:10); % x values of random coords (indices of the x10 vector)
linearFitY = polyval(linearCoeff, x10); % y values of random coords (depends on x values)
plot(linearFitX, linearFitY, 'p-');

quadCoeff = polyfit(x10, y10, 2); % find coefficients of best-fit quadratic
quadFitX = x10(1:10); % the x10 vector needs to be sorted from smallest to largest
quadFitY = polyval(quadCoeff, x10);
plot(quadFitX, quadFitY);
hold off;

legend("Package Position", "10 Selected Points", "Linear Best Fit", "Quadratic Best Fit");