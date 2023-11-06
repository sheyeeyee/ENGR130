% Shelley Wei
% ENGR 130
% Homework 10
% Started 11/1/23
% Submitted 11/5/23
% Due 11/8/23

%% Question 1
clear; clc; close all;

vec = [1 2 3 4 1]; % test vector
[a, b] = mode_analysis(vec); % function has 2 outputs

%% Question 2
clear; clc; close all;

numTerms = input("Please input an integer greater than 2 for the number of terms in the Fibonacci sequence:\n"); % Fib sequence must start w/ at least 0 and 1
fibonacci_gen_info(numTerms);

%% Question 3
clear; clc; close all;

load("HW10_heights.mat");

[maxH, hundCm, greatestHeight] = heightAnalysis(species_A_heights, species_B_heights, species_C_heights); % function has 3 outputs

fprintf("Maximum Height of Species:\n A: %.2f cm\n B: %.2f cm\n C: %.2f cm\n", maxH(1), maxH(2), maxH(3));
fprintf("\nTime for Species to Pass 100 cm in Height:\n A: %i days\n B: %i days\n C: %i days\n", hundCm(1), hundCm(2), hundCm(3));
fprintf("\nSpecies with Greatest Height Overall:\n Species %s\n", greatestHeight);

%% Functions
% 1
function [values, indices] = mode_analysis(vec)
    % Finds the mode of the vector and the indices of the vector where the values equal the mode
    % Call format: mode_analysis(vector);
    % Inputs
    %   vec: the set of numbers that the mode will be extracted from
    % Outputs
    %   values: the mode value of the vector
    %   indices: the indices of the vector where the values equal the mode
    
    values = mode(vec); % find the mode
    indices = []; % create vector for indices
    j = 1; % set a counter for indices vector
    
    % for-loop for finding indices of mode in vector
    for i = 1:length(vec)
        if (vec(i) == values) % check if value at current index equals mode
            indices(j) = i; % indices value at j equals the index of the value equal to the mode in vec
            j = j + 1; % iterate j
        end
    end
end

% 2
function fibonacci_gen_info(value)
    [fibSeq, fibSum] = fibLengthSum(value); % call function and set equal to outputs bc function has 2 outputs
    fibPrint(fibSeq, fibSum); % function has no outputs
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

    fibSeq = [0, 1]; % the fibonacci sequence always starts with 0 and 1

    if (value < 3) % checking if the user input is valid
        error("The Fibonacci Sequence must have at least two values. Please enter an integer greater than 2.");
    else % otherwise create the sequence
        % for-loop for adding sequential numbers of Fib seq
        for i = 3:value
            fibSeq(i) = fibSeq(i-2) + fibSeq(i-1); % set the value at the current index equal to the sum of the previous two values
        end
    end

    fibSum = sum(fibSeq); % use sum function to find the sum of all the numbers in the Fib seq
end

function fibPrint(fibSeq, fibSum)
    numTerms = length(fibSeq);
    fprintf("\nFibonacci Sequence Information:\n")
    fprintf(" Number of Terms: %i\n", numTerms);
    
    fprintf(" Sequence: ");
    % for-loop for printing the numbers in the seq
    for i = 1:numTerms-1
        fprintf("%i, ", fibSeq(i));
    end
    fprintf("%i\n", fibSeq(numTerms));

    fprintf(" Sum of Numbers in Sequence: %i\n", fibSum);
end

% 3
function [maxHeights, HundDay, greatestHeight] = heightAnalysis(aHeights, bHeights, cHeights)
    % Returns maximum height reached by each species, how many days it takes
    % each species to pass a height of 100 cm, and the letter corresponding to
    % the species that reaches the greatest height at any time
    % Call format: heightAnalysis(aHeights, bHeights, cHeights)
    % Input
    %   aHeights: heights of species A
    %   bHeights: heights of species B
    %   cHeights: heights of species C
    % Output
    %   maxHeight: maximum height of each species
    %   HundDay: how many days it takes each species to pass 100 cm in height
    %   greatestHeight: the letter corresponding to the species that reaches
    %   the greatest height at any time
    
    maxHeights = [max(aHeights), max(bHeights), max(cHeights)];
    HundDay = zeros(1, 3);
    greatestHeight = "";

    % for-loop for each species
    for i = 1:length(aHeights)
        if (aHeights(i) >= 100)
            HundDay(1) = i - 1; % subtract 1 from i for number of days it took for plant height to pass 100 cm
            break; % stop finding heights greater than or equal to 100 cm after the first time
        end
    end
    for i = 1:length(bHeights)
        if (bHeights(i) >= 100)
            HundDay(2) = i - 1; % subtract 1 from i for number of days it took for plant height to pass 100 cm
            break; % stop finding heights greater than or equal to 100 cm after the first time
        end
    end
    for i = 1:length(cHeights)
        if (cHeights(i) >= 100)
            HundDay(3) = i - 1; % subtract 1 from i for number of days it took for plant height to pass 100 cm
            break; % stop finding heights greater than or equal to 100 cm after the first time
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