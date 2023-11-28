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

rows = 20;

lastName = "";
firstName = "";
sacks = zeros(1, rows);
games = zeros(1, rows);

for i = 1:rows
    lastName(i) = fscanf(sackStats, "%s", 1);
    firstName(i) = fscanf(sackStats, "%s", 1);
    sacks(i) = fscanf(sackStats, "%f", 1);
    games(i) = fscanf(sackStats, "%i", 1);
end

sacksPerGame = sacks ./ games;

rankings = sortSacks(sacksPerGame);

numSacks = input("How many sacks does your favorite player have?\n");
numGames = input("How many games has your favorite player played?\n");

userSacksPerGame = numSacks / numGames;

for i = 1:rows
    % determine user's fav player's rank
    
end

fprintf("Your player would rank %i out of 21 players.\n", rank);

userPlayer = fopen("Homework\HW13_answer.txt", "w");
fprintf(userPlayer, "Your favorite player has sacked %i times in %i games. On average, they've sacked %f times per game.\n", numSacks, numGames, userSacksPerGame);
fclose(userPlayer);

%% Functions
function ranked = sortSacks(sacksGame)
    % Sorts the sacks per game from most to least and returns the sorted data in a vector (ranking the players)
    % Call format: sortSacks(sacksPerGame)
    % Input
    %   sacksPerGame: vector of sacks per game for respective players
    % Output
    %   sortedStats: sorted vector of sacks per game
    
    rows = length(sacksGame);
    
    for i = 1:rows-1 % subtract 1 because element at current index will be compared to the element at the following index, so i can't go past the length of the vector
        if (sacksGame(i) < sacksGame(i+1))
            temp = sacksGame(i); % create a temporary variable to store the current element so that it can be moved to the following index after the following element is moved to the current index
            sacksGame(i) = sacksGame(i+1); % set the element at the current index equal to the element at the following index since it's greater than the one at the current index
            sacksGame(i+1) = temp; % set the element at the following index equal to the element at the current index since it's smaller than the one at the following index
        end
    end

    ranked = sacksGame % set the output equal to the sorted vector
end

function userRank = rankUserPlayer(userSacksGame, sacksGame)
% Determines where the user's favorite player ranks in the given set of players
% Call format: rankUserPlayer(userSacksGame)
% Input
%   userSacksGame: the calculated value of sacks per game of the user's player
% Output
%   userRank: the rank of the user's player among the given set of players

rows = length(sacksGame);
    
    for i = 1:rows-1 % subtract 1 because element at current index will be compared to the element at the following index, so i can't go past the length of the vector
        if (sacksGame(i) < sacksGame(i+1))
            temp = sacksGame(i); % create a temporary variable to store the current element so that it can be moved to the following index after the following element is moved to the current index
            sacksGame(i) = sacksGame(i+1); % set the element at the current index equal to the element at the following index since it's greater than the one at the current index
            sacksGame(i+1) = temp; % set the element at the following index equal to the element at the current index since it's smaller than the one at the following index
        end
    end

end