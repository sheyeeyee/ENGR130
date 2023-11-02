% Shelley Wei
% ENGR 130
% Lecture 8
% 10/17/23

%% Example
clear; clc; close all;

helloWorld;

%% Practice Problem 2
clear; clc; close all;

fib(3);

%% Functions
function helloWorld
    % Prints "Hello world!" to the command line
    % Call format: helloWorld();
    % Input: none
    % Output: none
    fprintf("Hello world!\n");
end

function [fibonacci, sumFib] = fib(number)
    fibNumber = 0;
    nextFib = 1;

    for i = 1:number
        if (number == 1)
            fibNumber = 0;
        elseif (number == 2)
            fibNumber = [0, 1];
        else
            fibNumber = fibNumber + nextFib;
            nextFib = nextFib(i-2) + nextFib(i-1);
        end
    end

    sumFib = sum(fibNumber);
    fprintf("Number of terms in fibonacci sequence: %i\nSum of fibonacci numbers: %i\n", number, sumFib);
end