% Shelley Wei
% ENGR 130
% Homework 13
% Started 11/21/23
% Submitted 11//23
% Due 11/29/23

%% Question 1
clear; clc; close all;

% bring in data from file and reorganize it into two vectors
% call the new vector of floating point numbers float_vec
% call the new vector of integers int_vec
% note that you will need more lines than the number of blank lines
%   that the file starts with
% use a file ID of in_data because it will keep MATLAB
%    grader happy

in_data = fopen("UnknownNumbers.txt", "r"); % open file

formatters = "%f %i %f %i"; % initialize variable for the formatters
size = [4, 10]; % initialize variable for size of the data in file

allData = fscanf(in_data, formatters, size); % scan all of the data at once in a 4x10 matrix

float_matrix = [allData(1, :); allData(3, :)]; % move floats to float matrix
int_matrix = [allData(2, :); allData(4, :)]; % move integers to integer matrix

% turn matrices into row vectors
float_vec = float_matrix(:)';
int_vec = int_matrix(:)';

fclose(in_data); % close file

% find the number of elements in each new vector.
% call the number of floating point elements num_float.
% call the number of integer elements num_int.

% find length of vectors
num_float = length(float_vec);
num_int = length(int_vec);

%% Question 2
clear; clc; close all;

sackStats = fopen("HW13_SackLeaders.txt", "r");

fscanf(sackStats, "%s", 4);

strFormatters = "%s %s";
floatIntFormatters = "%f %i";
strSize = [2, 20];

names = fscanf(sackStats, strFormatters, strSize)
% lastName = fscanf(sackStats, strFormatters, 2);

rows = 20;

for i = 1:rows
    lastName(i) = fscanf(sackStats, "%s", 1);
    firstName(i) = fscanf(sackStats, "%s", 1);
    sacks(i) = fscanf(sackStats, "%f", 1);
    games(i) = fscanf(sackStats, "%i", 1);
end

% sacksPerGame = sacks ./ games;