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
letter2 = removeExtra(letter, '&'); % remove "&&&"
letter3 = removeExtra(letter, '+'); % remove "+++"

readableLetter = fopen("ReadableChristmasLetter.txt", "w"); % open new file to put readable letter into

fprintf(readableLetter, "%c", letter3); % print readable letter into file

fclose(readableLetter); % close file

%% Functions
function letterNew = removeExtra(letterText, removeChar)
    numChar = length(letterText);
    remove = [removeChar, removeChar, removeChar];

    i = 1;

    while i <= numChar - i*3
        if (strcmp(letterText(i:i+2), remove))
            letterText(i) = [];
            letterText(i+1) = [];
            letterText(i+2) = [];
        
            i = i + 1;
        end
    end

    letterNew = letterText;
end