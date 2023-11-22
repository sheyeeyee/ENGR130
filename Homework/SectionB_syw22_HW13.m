% Shelley Wei
% ENGR 130
% Homework 13
% Started 11/21/23
% Submitted 11//23
% Due 11/29/23

%% Question 1
clear; clc; close all;


%% Question 2
clear; clc; close all;

rows = 20;

sackStats = fopen("Homework\HW13_SackLeaders.txt");

fscanf(sackStats, "%s", 4);

for i = 1:rows
    firstName(i) = fscanf(sackStats, "%s", 1);
    lastName(i) = fscanf(sackStats, "%s", 1);
    sacks(i) = fscanf(sackStats, "%f", 1);
    games(i) = fscanf(sackStats, "%i", 1);
end

sacksPerGame = sacks ./ games;