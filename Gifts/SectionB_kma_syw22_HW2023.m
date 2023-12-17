% Shelley Wei
% Christmas Gift for Dr. Harper
% Started 12/6/23
% Finished 12/17/23

%% OBJECTIVE
% Unveil the Christmas letter!

%% CODE
clear; clc; close all;

inText = fopen("ChristmasLetter.txt", "r"); % open text file for reading

letter = ""; % initialize letter variable to compile all words into

letter = fscanf(inText, "%c"); % scan characters of the text file to include spaces

letter1 = removeExtra(letter, '!'); % remove "!!!"
letter2 = removeExtra(letter1, '&'); % remove "&&&"
letter3 = removeExtra(letter2, '+'); % remove "+++"

disp(letter3); % display the readable letter

%% Functions
function letterNew = removeExtra(letterText, removeChar)
    numChar = length(letterText);
    remove = [removeChar, removeChar, removeChar];

    i = 1;
    count = 1;

    while i <= numChar - count*3
        if (strcmp(letterText(i:i+2), remove))
            letterText(i+2) = [];
            letterText(i+1) = [];
            letterText(i) = [];

            count = count + 1;
        end
        i = i + 1;
    end

    letterNew = letterText;
end