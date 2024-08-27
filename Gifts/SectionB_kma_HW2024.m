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

fclose(inText);     %***   Not an error that this was missing, but good practice to include

letter1 = removeExtra(letter, '!'); % remove "!!!"
letter2 = removeExtra(letter1, '&'); % remove "&&&"  %***input new version of letter
letter3 = removeExtra(letter2, '+'); % remove "+++"  %*** also input new version

readableLetter = fopen("ReadableChristmasLetter.txt", "w"); % open new file to put readable letter into

fprintf(readableLetter, "%c", letter3); % print readable letter into file

fclose(readableLetter); % close file

%% Functions
function letterNew = removeExtra(letterText, removeChar)
    numChar = length(letterText);
    remove = [removeChar, removeChar, removeChar];

    i = 1;

    j = 1;  %*** need another counter to keep track of removals
    while i <= numChar - j*3   %***  subtract 3 * # of times removals happened
        
        if (strcmp(letterText(i:i+2), remove))
            letterText(i) = [];
            letterText(i) = [];  %***indices need to still be i since a ...
            letterText(i) = [];  %*** ...character was removed each time
            j = j+1;    %***new counter for removals
        end
        
         i = i + 1;    %***moved incrementation outside of if statement
    end

    letterNew = letterText;
end