% Jorge Feijoo, Schuyler Moore, Stephan Norquist, Shelley Wei
% ENGR 130
% Module 2 Lab
% Started 10/17/23
% Finished 10//23
% Due 10//23

%% 1. Simulate the ball dropping
% 1b.
clear;
clc;
close all;

m = 1; % kg
y = 1; % m
vel = 0; % m/s
dt = 0.0001; % s (time increment)
t = 10; % s (total time for ball to fall/bounce)
tVector = 0:0.0001:10-0.0001;
k = 0; % N/m
c = 0; % N*s/m
g = 9.81; % m/s^2

for i = 2:t/dt
    if (y(i-1) > 0) % check if height at current time is greater than 0
        a = accel(m, g, k, y(i-1), c, vel); % calculate acceleration at current height
        y(i) = y(i-1) + vel*dt; % calculate current height and add to height vector
        vel = vel + a*dt; % calculate velocity at current height
    else % check if ball is hitting ground (when the height is less than or equal to 0)
        a = accel(m, g, 5000, y(i-1), 2, vel); % calculate acceleration while the ball hits the ground (while height <= 0)
        y(i) = y(i-1) + vel*dt; % calculate current height and add to height vector
        vel = vel + a*dt; % calculate velocity at current height
    end
end

% 1c.
plot(tVector, y);
title("Ball Motion Over Time (Dampened)");
xlabel("Time (s)");
ylabel("Ball Height (m)");

% 1d.
min_height = min(y);

% 1g.
comet(tVector, y, 0.01);

%% 1e.
% 1b.
clear;
clc;
close all;

m = 1; % kg
y = 1; % m
vel = 0; % m/s
dt = 0.0001; % s (time increment)
t = 10; % s (total time for ball to fall/bounce)
tVector = 0:0.0001:10-0.0001;
k = 0; % N/m
c = 0; % N*s/m
g = 9.81; % m/s^2

for i = 2:t/dt
    if (y(i-1) > 0) % check if height at current time is greater than 0
        a = accel(m, g, k, y(i-1), c, vel); % calculate acceleration at current height
        y(i) = y(i-1) + vel*dt; % calculate current height and add to height vector
        vel = vel + a*dt; % calculate velocity at current height
    else % check if ball is hitting ground (when the height is less than or equal to 0)
        a = accel(m, g, 5000, y(i-1), c, vel); % calculate acceleration while the ball hits the ground (while height <= 0)
        y(i) = y(i-1) + vel*dt; % calculate current height and add to height vector
        vel = vel + a*dt; % calculate velocity at current height
    end
end

% 1f.
plot(tVector, y);
title("Ball Motion Over Time (Undampened)");
xlabel("Time (s)");
ylabel("Ball Height (m)");

% 1g.
comet(tVector, y, 0.01);

%% 2. Try different c and k values
%% 1st set of k and c values
clear;
clc;
close all;

m = 1; % kg
y = 1; % m
vel = 0; % m/s
dt = 0.0001; % s (time increment)
t = 10; % s (total time for ball to fall/bounce)
tVector = 0:0.0001:10-0.0001;
k = 0; % N/m
c = 0; % N*s/m
g = 9.81; % m/s^2

for i = 2:t/dt
    if (y(i-1) > 0) % check if height at current time is greater than 0
        a = accel(m, g, k, y(i-1), c, vel); % calculate acceleration at current height
        y(i) = y(i-1) + vel*dt; % calculate current height and add to height vector
        vel = vel + a*dt; % calculate velocity at current height
    else % check if ball is hitting ground (when the height is less than or equal to 0)
        a = accel(m, g, 8000, y(i-1), 2, vel); % calculate acceleration while the ball hits the ground (while height <= 0)
        y(i) = y(i-1) + vel*dt; % calculate current height and add to height vector
        vel = vel + a*dt; % calculate velocity at current height
    end
end

plot(tVector, y);
title("Ball Motion Over Time (Dampened)");
xlabel("Time (s)");
ylabel("Ball Height (m)");

%% 2nd set of k and c values
clear;
clc;
close all;

m = 1; % kg
y = 1; % m
vel = 0; % m/s
dt = 0.0001; % s (time increment)
t = 10; % s (total time for ball to fall/bounce)
tVector = 0:0.0001:10-0.0001;
k = 0; % N/m
c = 0; % N*s/m
g = 9.81; % m/s^2

for i = 2:t/dt
    if (y(i-1) > 0) % check if height at current time is greater than 0
        a = accel(m, g, k, y(i-1), c, vel); % calculate acceleration at current height
        y(i) = y(i-1) + vel*dt; % calculate current height and add to height vector
        vel = vel + a*dt; % calculate velocity at current height
    else % check if ball is hitting ground (when the height is less than or equal to 0)
        a = accel(m, g, 5000, y(i-1), 4, vel); % calculate acceleration while the ball hits the ground (while height <= 0)
        y(i) = y(i-1) + vel*dt; % calculate current height and add to height vector
        vel = vel + a*dt; % calculate velocity at current height
    end
end

plot(tVector, y);
title("Ball Motion Over Time (Dampened)");
xlabel("Time (s)");
ylabel("Ball Height (m)");

%% 3rd set of k and c values
clear;
clc;
close all;

m = 1; % kg
y = 1; % m
vel = 0; % m/s
dt = 0.0001; % s (time increment)
t = 10; % s (total time for ball to fall/bounce)
tVector = 0:0.0001:10-0.0001;
k = 0; % N/m
c = 0; % N*s/m
g = 9.81; % m/s^2

for i = 2:t/dt
    if (y(i-1) > 0) % check if height at current time is greater than 0
        a = accel(m, g, k, y(i-1), c, vel); % calculate acceleration at current height
        y(i) = y(i-1) + vel*dt; % calculate current height and add to height vector
        vel = vel + a*dt; % calculate velocity at current height
    else % check if ball is hitting ground (when the height is less than or equal to 0)
        a = accel(m, g, 5000, y(i-1), 10, vel); % calculate acceleration while the ball hits the ground (while height <= 0)
        y(i) = y(i-1) + vel*dt; % calculate current height and add to height vector
        vel = vel + a*dt; % calculate velocity at current height
    end
end

plot(tVector, y);
title("Ball Motion Over Time (Dampened)");
xlabel("Time (s)");
ylabel("Ball Height (m)");

%% Function Definitions
function acceleration = accel(m, g, k, y, c, vel)
    % Calculates acceleration of ball
    % Call format: accel(m, g, k, y, c, vel)
    % Input
    %   m: mass in kg
    %   g: gravity in m/s^2
    %   k: force constant of spring

    acceleration = (-m*g - k*y - c*vel) / m;
end