% Shelley Wei
% ENGR 130
% Lecture Preparation 8
% Started 10/14/23
% Finished 10/14/23
% Due 10/17/23

%% Calling a Function
clear;
clc;
close all;

sin(0.5)
sin_of_angle_a = sin(0.5);

%% Function Format
% function [output variables] = functionName(input variables)
%     block comments
%     operations using input variables
%           - can call other functions
%           - output variables defined in function body
% end


%% Example 1A
clear;
clc;
close all;

% squareIt(15);
% n = 4;
n = input("Please enter a number: \n");
nSquared = squareIt(n);
fprintf("The value of %i squared is %i.\n", n, nSquared);

% function definitions must be at the end of a script so function calls must be before the function definition
function squareVal = squareIt(num) % squareVal's and num's scope is in the function
    % This function calculates the square of a number
    % Format of call: square(num)
    % Input
    %     num: number to be squared
    % Output
    %     squareVal: square of the number
    squareVal = num * num;
end