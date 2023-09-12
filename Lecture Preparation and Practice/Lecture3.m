% Shelley Wei
% ENGR 130
% Lecture 3
% 9/12/23

%% COMPARISONS AND SELECTION STRUCTURES
%% Algorithm Practice
clear;
clc;
close all;

num = input("Please input a positive number: ");
if (num < 0)
    fprintf("Unfortunately, the number you inputted is not positive, so we will make it positive for you.\n");
    num = abs(num);
end

sqrtNum = sqrt(num);

fprintf("\nInputted positive number: %i\nSquare root of your number: %f\n", num, sqrtNum);

%% Practice 1
clear;
clc;
close all;

randomInt = randi(10); % or randi([1,10],1) which is [imin, imax],n, n being the dimensions of the matrix

num = input("Please input a number between 1 and 10: ");

if (num < randomInt)
    fprintf("Your number, %i, is less than %i, the randomly generated number.\n", num, randomInt);
elseif (num == randomInt)
    fprintf("Your number, %i, is equal to %i, the randomly generated number.\n", num, randomInt);
else
    fprintf("Your number, %i, is greater than %i, the randomly generated number.\n", num, randomInt);
end

%% Practice 1.5
clear;
clc;
close all;

randomInt = randi(10); % or randi([1,10],1) which is [imin, imax],n, n being the dimensions of the matrix

num = input("Please input a number between 1 and 10: ");

if (num > 10 || num < 1)
    error("You failed to input a valid number. Try again next time.");
else
    if (num < randomInt)
        fprintf("Your number (%i) is less than the randomly generated number (%i).\n", num, randomInt);
    elseif (num == randomInt)
        fprintf("Your number (%i) is equal to the randomly generated number (%i).\n", num, randomInt);
    else
        fprintf("Your number (%i) is greater than the randomly generated number (%i).\n", num, randomInt);
    end
end

%% Practice 2
clear;
clc;
close all;

letter = input('Please enter the letter "x": ', 's');

if (letter ~= 'x')
    error('You failed to enter the letter "x". Try again next time.');
end

%% Practice 4
clear;
clc;
close all;

grades = zeros;

for i = 1:5
    grades(i) = input("Please enter one of your homework grades: ");
end

% avg = sum(grades)/length(grades);

% loop to drop grade... unnecessary
for i = 1:4
    if (grades(1) > grades(1+i))
        grades(1+i) = 0;
    end
end

% adjAvg = (sum(grades) - min(grades))/4;
adjAvg = sum(grades)/4

fprintf("Student 1 Raw Score: %.2f, ", avg);
fprintf("Adjusted Score: %.2f, HW Grade ", adjAvg);
if (adjAvg <= 100 && adjAvg >= 90)
    fprintf("A\n");
elseif (adjAvg >= 80)
    fprintf("B\n");
elseif (adjAvg >= 70)
    fprintf("C\n");
elseif (adjAvg >= 60)
    fprintf("D\n");
else
    fprintf("F\n");
end