% Shelley Wei
% Christmas Gift for Dr. Harper
% Started 12/6/23
% Finished 12//23

%% OBJECTIVE
% Unveil the Christmas letter!

%% CODE
clear; clc; close all;

% starting point
inText = fopen("ChristmasLetter.txt", "r");

letter = "";
i = 1;

while (fscanf(inText, "%s", 1) ~= "#")
    letter(i) = fscanf(inText, "%s", 1);
    i = i + 1;
end

% remove "!!!"

% remove "&&&"


% remove "+++"