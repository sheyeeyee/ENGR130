% Shelley Wei
% ENGR 130
% Homework 8
% Started 10/19/23
% Submitted 10//23
% Due 11/1/23

%% Question 2
clear;
clc;
close all;

numDice = input("How many die do you need to roll at once?\n"); % ask user for number of die
numSides = input("How many sides are there on the die?\n"); % asks user for number of sides for the die

roll = randRoll(numDice, numSides); % "rolls" die by calling function

fprintf("Dice Roll: %i\n", roll); % print the sum of the numbers rolled by the die

%% Question 3
clear;
clc;
close all;

x = 6;

my_fact(x);

%% Function for Question 2
function randDice = randRoll(fNumDice, fNumSides) % naming inputs differently from variables above to prevent confusion
    % Rolls dice (generates random integers for number of die) and returns the total value of rolled die
    % Call format: randRoll(numDice, numSides)
    % Input
    %   fNumDice: number of die
    %   fNumSides: number of sides for the die
    % Output
    %   total value of rolled die

    dice = zeros(1, fNumDice); % create vector with size based on number of die

    % for-loop for assigning random numbers to each dice
    for i = 1:fNumDice
        dice(i) = randi(fNumSides, 1);
    end
    % disp(dice); % sanity check
    randDice = sum(dice); % add the values of the die together
end

%% Function for Question 3
function factorial = my_fact(num)
    % Calculates the factorial of a given positive integer
    % Call format: my_fact(num)
    % Input
    %   num: integer for factorial to be calculated based on
    % Output
    %   no output
    
    % assuming that 0 is not a positive integer
    initFactorial = 1; % initialize factorial to be incremented on
    
    % for-loop for re-equaling initial factorial to itself times the next integer between 1 and the given integer
    for i = 1:num
        initFactorial = initFactorial * i;
    end
    
    factorial = initFactorial; % set the output equal to the calculated factorial from for-loop
end