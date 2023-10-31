% Shelley Wei
% ENGR 130
% Lecture Preparation 9
% Started 10/29/23
% Finished 10/29/23
% Due 10/31/23

%% Function Memory Example
clear;
clc;
close all;

dog = 10;
dog = whatIsDog(dog);
fprintf("The value of dog is %i.\n", dog);

%% Functions w/ Matrix Input
%% Example 1
clear;
clc;
close all;

base = 5;
height = 8;
areaCalc = triArea(base, height);
fprintf("The area of a right triangle with base length %i and height %i is %i.\n", base, height, areaCalc);

%% Vector Inputs?
clear;
clc;
close all;

base = [5 3 7];
height = [2 3 2];
areaCalc = triArea(base, height);
fprintf("The area of a right triangle with base length %i and height %.1f is %i.\n", base, height, areaCalc);

%% Max Function
clear;
clc;
close all;

myVector = [1 7 3 0 9 5 2 6 8 2 4];
[greatest, maxIdx] = max(myVector)

%% Practice: Two-Output Function
clear;
clc;
close all;

inVec = [1 2 3 4 5 6 7 8 9 0];
sevens(inVec);

%% Functions
function dog = whatIsDog(dog)
    % Takes in teh value of dog, reassigns it to 5 and prints value
    % Format of call: whatIsDog(dog)
    % Input: value of dog
    % Output: value of dog
    dog = 5;
    fprintf("The value of dog is %i.\n", dog);
end

function area = triArea(base, height)
    area = 0.5 .* base .* height; % robust bc can take vector inputs
end

function [avg, n] = myAverage(dataIn)
    n = length(dataIn);
    total = 0;
    
    for i = 1:n
        total = total + dataIn(i);
    end
    avg = total/n;
end

function [less7, great7, eq7] = sevens(inVector)
    less7 = 0;
    great7 = 0;
    eq7 = 0;

    for i = 1:length(inVector)
        if (inVector(i) < 7)
            less7 = less7 + 1;
        elseif (inVector(i) > 7)
            great7 = great7 + 1;
        else
            eq7 = eq7 + 1;
        end
    end

    fprintf("The number of values less than 7 is %i, greater than 7 is %i, and equal to 7 is %i.\n", less7, great7, eq7);
end