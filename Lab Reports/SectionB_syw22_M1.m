% Shelley Wei
% ENGR 130
% Module 1 Lab
% Started 9/11/23
% Submitted 9/15/23
% Due 9/18/23

%% LAB 1: MATLAB VECTORS, MATRICES, INPUT AND OUTPUT
%% 1. Variable Operators
clear;
clc;
close all;

r1 = 80;
r2 = 10;
r3 = 15;
rVector = [r1, r2, r3];
rT = 1 / sum(1 ./ rVector); % divide a scalar by a vector; requires ./ rather than just /, or MATLAB won't know how to do it

%% 2. Matrices
clear;
clc;
close all;

a2 = (1:5); % integer values 1 through 5
b2 = [2, 3; 4, 9; 4, 11]; % 3x2 matrix
c2 = [a2(1), a2(3); a2(2), a2(3); a2(4), a2(5)]; % another 3x2 matrix
d2 = c2 + b2; % add c2 and b2
e2 = b2 - c2; % subtract c2 from b2
f2 = b2 .* c2; % multiply c2 and b2
g2 = max(c2); % max of each column in c2
h2 = max(c2'); % max of each row in c2
i2 = max(max(c2)); % max of c2
j2 = sum(sum(c2)); % sum of c2

%% 3. User input and output
clear;
clc;
close all;

ckWh = 0.066; % set a variable for the cost per kilowatt-hour to be clear about what the number means
x = input("Please enter the number of kilowatt hours (kWh) used this month: ");
c = ckWh * x;
fprintf("Your charge for %.2f kWh will be $%.2f.\n", x, c);

%% LAB 2: VECTORS AND LOOPS
%% 4. Vectors and Loops
clear;
clc;
close all;

n = 10; % number of integers in the vector (this variable will be used multiple times)
max = 100; % maximum value an integer can be

randomInt = randi(max,1,n); % create 1x10 vector of 10 random integers btwn 1 and 100
sumRandomInt = 0; % create sum variable to use in for loop later

 % use loop to add every integer of the vector randomInt to a variable that will eventually be the sum of all the integers
for i = 1:10
    sumRandomInt = sumRandomInt + randomInt(i);
end

x = sumRandomInt / n; % find the average of randomInt's values w/o function (n is used here again)
xM = mean(randomInt); % find the average of randomInt's values w/ function

sumRandomIntMinusAvg = 0; % create sum variable for numerator of the fraction in the std deviation formula

% use loop to add the difference between every data point and the average of all numbers in the randomInt vector squared to a variable that will eventually be the sum of all of it
for i = 1:10
    sumRandomIntMinusAvg = sumRandomIntMinusAvg + (randomInt(i) - x)^2;
end

s = sqrt(sumRandomIntMinusAvg / (n - 1)); % calculate std deviation of randomInt's values w/o function
stdDev = std(randomInt); % calculate std deviation of randomInt's values w/ function

% print and compare the hand-calculated and function-calculated values
fprintf("CALCULATIONS W/O BUILT-IN MATLAB FUNCTIONS\nAverage of ten random integers between 1 and 100: %.1f\nStandard deviation of the same set of random integers: %.1f\n", x, s);
fprintf("\nCALCULATIONS W/ THE BUILT-IN MATLAB FUNCTIONS mean() (AVERAGE) AND std() (STANDARD DEVIATION)\nAverage of ten random integers between 1 and 100: %.1f\nStandard deviation of the same set of random integers: %.1f\n", xM, stdDev);

%% 5. Vector Indices and Loops
clear;
clc;
close all;

userVector = input("Please input a vector of any length in the form [# # # ... #]: ");
% reverseVector = 0; % initialize a vector to be added to (no longer needed)

% for i = length(userVector):-1:1
%     reverseVector(i) = userVector(i)
% end

fprintf("Reversed inputted vector: ["); % start the vector bracket display outside of the loop so it isn't reprinted every iteration
for i = length(userVector):-1:2 % start at the end of the user's vector and end at the second index
    fprintf("%i ", userVector(i)); % how do you include the space??
end
fprintf("%i]\n", userVector(1)); % end the vector bracket display outside the loop so it isn't repeated every iteration (and the last index so that there is no space between that and the end bracket

% fprintf("The reverse of your inputted vector is: [%d]\n", reverseVector); (attempt at just displaying a vector without having to display each individual index...)

%% LAB 3: INTERFACING MATLAB WITH AN ARDUINO
clear;
clc;
close all;

a = arduino();

% writeDigitalPin(<arduino>, <pin>, <on/off>  <-- format for function

% turn the arduino LED on for 1 second and then back off
% writeDigitalPin(a, 'D13', 1);
% pause(1);
% writeDigitalPin(a, 'D13', 0);

% loop for turning LED on for 0.75s and off for 0.5s for 5 cycles
for i = 1:5
    writeDigitalPin(a, 'D13', 1);
    pause(0.75);
    writeDigitalPin(a, 'D13', 0);
    pause(0.5);
end

%% 6. Conditionals
clear;
clc;
close all;

windStrength = input("Please input a value for wind strength between 0 and 12 inclusive: ");

% check if the user's input is valid
if (windStrength > -1 && windStrength < 13) % if it's valid, print the corresponding statement about the wind strength
    if (windStrength == 0)
        fprintf("There is no wind.\n");
    elseif (windStrength < 7)
        fprintf("There is a breeze.\n");
    elseif (windStrength < 10)
        fprintf("This is a gale.\n");
    elseif (windStrength < 12)
        fprintf("It is a storm.\n");
    else
        fprintf("Hello, hurricane!\n");
    end
else % if the user's input isn't valid, throw and error depending on whether the value is too small or too large
    if (windStrength < 0) % if the user, for some reason, input a negative value
        error("The wind can't be that weak!");
    else % if the user input a huge value (greater than 12)
        error("The wind can't be that strong!");
    end
end