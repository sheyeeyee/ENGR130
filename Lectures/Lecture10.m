% Shelley Wei
% ENGR 130
% Lecture 10
% 11/7/23

%% "Random" Numbers?"
clear; clc; close all;

for k = 1:5
    y(k) = randi(10);
end

% basically, someone generated a list of random numbers and that is used every time, which is kind of impractical

%% Varying the "Random" Numbers
% change the start point on the list
clear; clc; close all;

rng('shuffle'); % creates a seed based on the current time (the seed is shuffle)
% seed once per homework problem

for k = 1:5
    y(k) = randi(10);
end

%% Modular Coding
% The Big Wheel
clear; clc; close all;

rng("shuffle");

fprintf("Welcome to the Big Wheel!\n\n");

cash = zeros(1, 3);

for i = 1:3
    cash(i) = spinWheel();

    if (cash(i) == max(cash)) % if leading, ask if they want to spin again
        opt = input("Would you like to spin again?\n (Y for Yes, N for No)\n", 's');
    end

    if (opt == "Y" || cash(i) < max(cash))
        cash(i) = addTwo(cash(i), spinWheel());
        opt = "N";
    end
end

declareWinner(cash);

%% Functions
function [randCash] = spinWheel()
    % Spins a wheel of sections representing consecutively aggregated $0.05
    % Call format: randCash;
    % Input
    %   none
    % Output
    %   randCash: random number between 0.05 and 1.00, multiple of 0.05
    
    increment = 0.05;
    randCash = increment * randi(20);

    fprintf("You spun $%.2f!\n", randCash);
end

function [tot] = addTwo(tot, new)
    % Prints the player's total cash and checks if the total is greater than $1.00
    % Call format: addTwo(tot, new)
    % Input
    %   tot: first spin value
    %   new: second spin value
    % Output
    %   tot: final value for combined spins
    
    tot = tot + new;
    fprintf("Your new total is $%.2f.\n", tot);
    
    if (tot > 1)
        tot = 0;
        fprintf("Sorry, you exceeded $1.00 and lose all your money.\n");
    end
end

function declareWinner(cashAmount)
    % Declares the winner based on who has the most cash under $1.00
    % Call format: declareWinner(cashAmount)
    % Input
    %   cashAmount: vector of wealth of each player
    % Output
    %   none

    [winningCash, winner] = max(cashAmount);
    fprintf("\nPlayer %i wins with $%.2f!", winner, winningCash);
end