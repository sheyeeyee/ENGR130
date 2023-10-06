% Shelley Wei
% ENGR 130
% Homework 6
% Started 10/4/23
% Submitted 10/6/23
% Due 10/11/23

%% Question 1
clear;
clc;
close all;

% initial conditions and constants
v_x = 200; % horizontal velocity
y_o = 1000; % initial height
y_f = 185;  % final height %*** previously y_f = 0, but the prompt asks to analyze the path up until the package reaches 185m, not 0m
g = 9.8;

% putting initial values into vectors and loop
t = 0;
idx = 1; %*** previously idx = 0, but MATLAB array indices start at 1, so the x and y vectors that refer to the index at idx were not able to find that index
x(1) = 0;
y(1) = y_o;

% calculate x and y coordinates as payload drops
% until parachute is deployed
while (y(idx) >= y_f) %*** previously y(idx) ~= y_f but the y value never equals 185m, it skips over it since the y values are calculated at intervals
    idx = idx+1;
    t = t + .1;
    x(idx) = v_x*t;
    y(idx) = y_o - .5*g*t^2;
end

% check horizontal distance and display appropriate message
if x(idx) > 2800
    fprintf('The distance of %.2f meters is in Zone 3.\n', x(idx)); %*** not really a functional error but didn't include units so unclear what the statement is about
elseif x(idx) > 1400 %*** was previously just "if" instead of "elseif" so the if-statement above wasn't paired with the two successive conditional statements
    fprintf('%.2f meters is in Zone 2.\n', x(idx)); %*** previously used disp() function but disp() can't use format specifiers
else
    fprintf('The chute will deploy in Zone 1 at a distance of %.2f meters.\n', x(idx)); %*** not a functional error but didn't state the x distance and also need to change to fprintf to do so
end

%% Question 2 Prep
clear;
clc;
close all;

watts = 1:20;
save('Homework\watts.mat', 'watts');

%% Question 2
clear;
clc;
close all;

% Read in power data
load('watts.mat'); %*** previously read(), but the function to load a file with data is load(), also you can't set a variable equal to a file since load is for loading a file
P = watts; %*** set P equal to the vector in the file

% Calculate average and standard deviation.
avg = sum(P)/length(P);
stdev = sqrt(sum((P-avg).^2)/length(P)); %*** square root function is sqrt, not sqrrt

% Determine minimum power needed
powMin = avg - stdev;

% Print values to screen
fprintf('Average: %.2f watts', avg); %*** avg is not a string variable, it's a number (probably float)
fprintf('\nStandard Deviation: %.2f watts', stdev);
fprintf('\nMinimum Power Requirement: %.2f watts\n', powMin); %*** forgot to include comma to separate between printed string and format specifier variable

% Create wind speed vector
wind = [5:1:13];

% Declare variables
rho = 1.225;
A1 = 10; %*** this variable is used later and was named A1 instead of A, so this variable should be initialized as A1 (or vice versa where the variable is used as A later in line 73)
A2 = 70;
A3 = 150;

% Determine power of each wind turbine given the wind speeds
Pow1 = (1/6)*rho*A1.*(wind.^3);
Pow2 = (1/6)*rho*A2.*(wind.^3);
Pow3 = (1/6)*rho*A3.*(wind.^3);

% Plot power vs. speed
plot(wind, Pow1, 'r', wind, Pow2, 'b-*', wind, Pow3, 'g--'); %*** previously graph's x and y were switched

% Label plot
title('Power Generation for Three Wind Turbines');
xlabel('Wind Speed (m/s)');
ylabel('Power (watts)');
legend("A = 10 m^2", "A = 70 m^2", "A = 150 m^2"); %*** forgot to include quotes around labels for legend