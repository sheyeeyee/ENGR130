% Shelley Wei
% ENGR 130
% Final Exam Practice Packet
% 12/18/23

%% 8
clear; clc; close all;

a = 1:20
b = linspace(20, 1, 20)
c = a ./ b 
e = 1:length(c)

for d = 1:length(b)
    e(d) = e(d) * 5; 
end

figure(1) 
plot(b, a) 
figure(2) 
plot(c, a) 
figure(3) 
plot(d, a) 
figure(4) 
plot(e, a)

%% 11
clear; clc; close all;
%  In one line, ask the user to enter how many seconds the object will fall
% and store the result in the variable “period”
period = input("How many seconds will the object fall for?\n");

%  Display the number of seconds entered
fprintf('Number of free fall seconds: %i\n', period);

g = 9.81;   % value of acceleration due to gravity in m/s

%  Use a loop to create a matrix of distance fallen for each second of free fall

%  Initialize the loop counter, "sec"
sec = 1;

while (sec <= period)
    %  Calculate the distance fallen at this time point using distance = 1/2gt^2
    dist = 0.5*g*sec^2;
    
    %  Write each time and corresponding distance to the matrix "Isaac"
    Isaac(1, sec) = sec;
    Isaac(2, sec) = dist;

    sec = sec + 1;
end 

%  Plot the distance fallen as a function of time using the values in Isaac
plot(Isaac(1,:), Isaac(2,:));

%% 12
% Astronomers are using a new space telescope to conduct a random survey of locations in space.  
% 
% They will describe these locations with three coordinates: 
% • An azimuthal angle (how far below or above the horizon), phi, ranging from -90 to +90 degrees. 
% • A polar angle, theta, ranging from 0 to 360 degrees 
% • A radius, r, ranging from 0 to 100 light-years. 
% 
% Write code to generate and store the coordinates for the first 100 random locations the telescope will be focused at.  
% Then the code should choose one of those locations at random and display to the screen which observation it will be and what the coordinates are, like so: 
% The coordinates for observation #12 are phi = -56.774226 deg, theta = 66.640887 deg, and r = 43.512060 ly. 

clear; clc; close all;

phi = [];
theta = [];
r = [];

phiVal = 90 - (-90) + 1;
thetaVal = 360 + 1;
rVal = 100 + 1;

locations = 100;

for i = 1:locations
    phi(i) = phiVal * rand - 90;
    theta(i) = thetaVal * rand;
    r(i) = rVal * rand;
end

randLocation = randi(100, 1);

randPhi = phi(randLocation);
randTheta = theta(randLocation);
randR = r(randLocation);

fprintf("The coordinates for observation #%i are phi = %f deg, theta = %f deg, and r = %f ly.\n", randLocation, randPhi, randTheta, randR);