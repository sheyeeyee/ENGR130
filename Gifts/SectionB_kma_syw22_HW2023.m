% Shelley Wei
% Christmas Gift for Dr. Harper
% Started 12/6/23
% Finished 12//23

%% OBJECTIVE
% Unveil the Christmas letter!

%% CODE
clear; clc; close all;

inText = fopen("ChristmasLetter.txt", "r"); % open text file for reading

letter = ""; % initialize letter variable to compile all words into

letter = fscanf(inText, "%c"); % scan characters of the text file to include spaces

letter1 = removeExtra(letter, '!') % remove "!!!"
letter2 = removeExtra(letter1, '&'); % remove "&&&"
letter3 = removeExtra(letter2, '+'); % remove "+++"

%% Functions
function letterNew = removeExtra(letterText, removeChar)
    numChar = length(letterText);
    i = 1;

    while i <= numChar - i*3
        if (letterText(i) == removeChar && letterText(i+1) == removeChar && letterText(i+2) == removeChar)
            letterText(i+2) = [];
            letterText(i+1) = [];
            letterText(i) = [];

            i = i + 1;
        end
    end

    letterNew = letterText
end