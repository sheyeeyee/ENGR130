% Shelley Wei
% ENGR 130
% Lecture 8
% 10/17/23

%% USER-DEFINED FUNCTIONS

% function [output variables] = functionName(input variables)
% body
% end

%% Example 1
clear;
clc;
close all;

radius = 5;
areaCalc = circleArea(radius);

fprintf("The area of a circle of radius %.2f is %.2f.\n", radius, areaCalc);

%% Example 2
clear;
clc;
close all;

b = 5;
h = 8;
areaCalc = rTriangleArea(b, h);

fprintf("The area of a right triangle of base length %.2f and height %.2f is %.2f.\n", b, h, areaCalc);

%% Example 3
clear;
clc;
close all;

a = 5;
b = -8;
c = 3;

root = oneRoot(a, b, c);

%% Example 4
clear;
clc;
close all;

num = input("Please enter an integer:\n");
sumRand = randNumGen(num);

fprintf("The sum of %i random integers between 1 and 10 is %i.\n", num, sumRand);

%% functions
% if you want to run the function in the workspace, you have to run it with the file name and there can't be any code other than the function definition
function area = circleArea(radius)
    % This function calculates the area of a circle
    % Format of call: circleArea(radius)
    % Input
    %     radius: radius of circle
    % Output
    %     circleArea: area of circle
    area = pi*radius^2;
end

function area = rTriangleArea(base, height)
    % Calculates area of right triangle
    % Call format: rTriangleArea(base, height)
    % Input
    %   base: base of triangle
    %   height: height of triangle
    % Output
    %   rTriangleArea: area of right triangle
    area = 0.5 * base * height;
end

function quad = oneRoot(a, b, c)
    % Calculates one of the two roots of a quadratic function
    % Call format: oneRoot(a, b, c)
    % Input
    %   coefficients of quad function
    % Output
    %   one of the two roots
    quad = (-b + sqrt(b^2 - 4*a*c)) / (2 * a);
end

function rng = randNumGen(num)
    % Calculates the sum of a given number of integers between 1 and 10
    % Call format: randNumGen(num)
    % Input
    %   user input number of numbers
    % Output
    %   sum of all the integers
    rng = sum(randi([1 10], 1, num));
end