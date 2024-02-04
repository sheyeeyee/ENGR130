% Shelley Wei
% Christmas Gift for Dr. Harper
% Started 12/6/23
% Finished 12/17/23

%% Working Code
clear; clc; close all;

inText = fopen("ChristmasLetter.txt", "r"); % open text file for reading

letter = ""; % initialize letter variable to compile all words into

letter = fscanf(inText, "%c"); % scan characters of the text file to include spaces

letter1 = removeExtra(letter, '!'); % remove "!!!"
letter2 = removeExtra(letter1, '&'); % remove "&&&" %*** should be letter1, not letter
letter3 = removeExtra(letter2, '+'); % remove "+++" %*** should be letter2, not letter

readableLetter = fopen("ReadableChristmasLetter.txt", "w"); % open new file to put readable letter into

fprintf(readableLetter, "%c", letter3); % print readable letter into file

fclose(readableLetter); % close file

%% Functions
function letterNew = removeExtra(letterText, removeChar)
    numChar = length(letterText);
    remove = [removeChar, removeChar, removeChar];

    i = 1;
    count = 1; %*** need another counter

    while i <= numChar - count*3 %*** use count to decrease the number to check through
        if (strcmp(letterText(i:i+2), remove))
            %*** reverse the order of removing the characters otherwise you're removing the ones you want to keep
            letterText(i+2) = [];
            letterText(i+1) = [];
            letterText(i) = [];

            count = count + 1; %*** increment count here because only need to increment when characters are removed
        end
        i = i + 1; %*** incrememnt i outside of if-statement because need to check through every character
    end

    letterNew = letterText;
end
