% Shelley Wei
% ENGR 130
% Homework 14
% Started 11/28/23
% Submitted 12//23
% Due 12/6/23

%% Question 1
clear; clc; close all;

in_phrase = "yo this code is so cool";
out_phrase = myFunction(in_phrase);

%% Question 2
clear; clc; close all;

starData = fopen("HW14_Stars.txt", "r");

stars = 21;
col = 4;

headers = fscanf(starData, "%s", 4);

name = "";
dist = [];
specType = "";
appMag = [];

for i = 1:stars
    name(i) = fscanf(starData, "%s", 1);
    dist(i) = fscanf(starData, "%f", 1);
    specType(i) = fscanf(starData, "%s", 1);
    appMag(i) = fscanf(starData, "%f", 1);
end

[numK, perK] = specK(specType, stars);
fprintf("The number of stars with spectral type K is %i and the percent of stars with spectral type K is %.2f%%\n", numK, perK);

[farthest, closest] = farClose(dist, stars);

farStar = name(find(dist == farthest));
closeStar = name(find(dist == closest));
fprintf("The farthest star from Earth is %s. The closest is %s.\n", farStar, closeStar);

%% Functions
% Question 1
function [encoded] = myFunction(message)
    words = split(message); % split the message into a vector of elements, each word being an element
    long = length(words); % create a variable for the length of the vector
    
    % ease of coding for adding to end of words later
    ay = "ay";
    bro = "bro";
    sis = "sis";
    
    encoded = []; % initialize encoded variable to be a blank vector
    
    % for-loop for checking the words against conditions and seeing what rules apply
    for i = 1:long
        currWord = words(i); % for ease of coding, just setting the current word as the currWord variable
        currChar = currWord{1}(1); % for ease of coding, just setting the first character of the word to the currChar variable

        if (currChar == "y") % word begins w/ y
            currWord = currWord{1}(2:end); % remove the first character of the word from the beginning of the word
            currWord = strcat(currWord, currChar, ay); % add the first character of the word and "ay" to the end
            % currWord = string(currWord);
        elseif (currChar == "a" || currChar == "e" || currChar == "i" || currChar == "o" || currChar == "u") % word begins w/ vowel
            currWord = strcat(currWord, sis); % add "sis" to the end of the word
        else % word begins w/ consonant
            currWord = currWord{1}(2:end); % remove the first character of the word from the beginning of the word
            currWord = strcat(currWord, currChar, bro); % add the first character of the word and "bro" to the end
        end
        encoded = [encoded, currWord]; % for every iteration, add currWord to the end of the encoded vector
    end
end

% Question 2
function [countK, percentK] = specK(spec, numStars)
    % comment block
    
    countK = 0;
    
    % MEANINGFUL FOR-LOOP
    for i = 1:numStars
        if (spec(i) == "K")
            countK = countK + 1;
        end
    end
    
    percentK = countK / numStars * 100;
end

function [far, close] = farClose(distances, numStars)
    % comment block

    closeTemp = min(distances);
    distances(find(closeTemp)) = [];
    far = max(distances);
    close = min(distances);
end

function absoluteMag = absoluteMagnitude(appMag)
end