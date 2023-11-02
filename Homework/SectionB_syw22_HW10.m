% Shelley Wei
% ENGR 130
% Homework 10
% Started 11/1/23
% Submitted 11//23
% Due 11/8/23

%% Question 1
clear; clc; close all;

vec = [1 2 3 4 1];
[a, b] = mode_analysis(vec);

%% Question 2
clear; clc; close all;

numTerms = input("Please input a positive integer value for the number of terms in the Fibonacci sequence:\n");
fibonacci_gen_info(numTerms);

%% Question 3
clear; clc; close all;

load("HW10_heights.mat");

[maxH, HundCm, greatestHeight] = heightAnalysis(species_A_heights, species_B_heights, species_C_heights);

fprintf("");

%% Functions
% 1
function [values, indexes] = mode_analysis(vec)
    % Finds the mode of the vector and the indices of the vector where the values equal the mode
    % Call format: mode_analysis(vector);
    % Inputs
    %   vector: the set of numbers that the mode will be extracted from
    % Outputs
    %   m: the mode value of the vector
    %   indices: the indices of the vector where the values equal the mode
    
    values = mode(vec);
    indexes = [];
    j = 1;
    
    for i = 1:length(vec)
        if (vec(i) == values)
            indexes(j) = i;
            j = j + 1;
        end
    end
end

% 2
function fibonacci_gen_info(value)
end

function [fibSeq, fibSum] = fibLengthSum(value)
    % Returns the fibonacci sequence up to the term of the input integer as
    % well as the sum of all the numbers in that limited sequence
    % Call format: fibLengthSum(value)
    % Input
    %   value: integer value that determines the length of the limited fibonacci sequence
    % Outputs
    %   fibSeq: vector of limited fibonacci sequence
    %   fibSum: suum of the numbers of the limited fibonacci sequence

    fibSeq = []; % the fibonacci sequence starts at 0
    nextFib = 1; % the second number of the fib seq is 1

    if (number == 1)
        fibSeq = [0];
    elseif (number == 2)
        fibSeq = [0, 1];
    else
        fibSeq = [0, 1];
        for i = 3:number
            fibSeq(i) = fibSeq + nextFib;
            nextFib = nextFib(i-2) + nextFib(i-1);
        end
    end

    fibSum = sum(fibSeq);
end

function fibPrint(fibSeq, fibSum)
end

% 3
function [maxHeights, HundDay, greatestHeight] = heightAnalysis(aHeights, bHeights, cHeights)
    % Returns maximum height reached by each species, how many days it takes
    % each species to pass a height of 100 cm, and the letter corresponding to
    % the species that reaches the greatest height at any time
    % Call format: heightAnalysis(aHeights, bHeights, cHeights)
    % Input
    %   aHeights: heights of plants in A group
    %   bHeights: heights of plants in B group
    %   cHeights: heights of plants in C group
    % Output
    %   maxHeight: maximum height of each species
    %   HundDay: how many days it takes each species to pass 100 cm in height
    %   greatestHeight: the letter corresponding to the species that reaches
    %   the greatest height at any time
    
    maxHeights = [max(aHeights), max(bHeights), max(cHeights)];
    HundDay = zeros(1, 3);
    greatestHeight = "";

    % how do you stop the for loop after the first time it reaches over 100cm?
    for i = 1:length(aHeights) - 1
        if (aHeights(i) >= 100)
            HundDay(1) = i + 1;
        end
        if (bHeights(i) >= 100)
            HundDay(2) = i + 1;
        end
        if (cHeights(i) >= 100)
            HundDay(3) = i + 1;
        end
    end
    
    for i = 1:length(maxHeights)
        if (maxHeights(1) > maxHeights(2) && maxHeights(1) > maxHeights(3))
            greatestHeight = "A";
        elseif (maxHeights(2) > maxHeights(1) && maxHeights(2) > maxHeights(3))
            greatestHeight = "B";
        else
            greatestHeight = "C";
        end
    end
end