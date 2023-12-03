% Shelley Wei
% ENGR 130
% Homework 14
% Started 11/28/23
% Submitted 11/30/23
% Due 12/6/23

%% Question 1
clear; clc; close all;

in_phrase = "yo this code is so cool";
out_phrase = myFunction(in_phrase);

%% Question 2
clear; clc; close all;

starData = fopen("HW14_Stars.txt", "r"); % open file for reading

stars = 21; % set a variable for the number of stars

headers = fscanf(starData, "%s", 4); % scan in the headers into a separate variable

% initialize the data vectors
name = "";
dist = [];
specType = "";
appMag = [];

% for-loop for iterating through every star and organizing respective data into respective vectors
for i = 1:stars
    name(i) = fscanf(starData, "%s", 1);
    dist(i) = fscanf(starData, "%f", 1);
    specType(i) = fscanf(starData, "%s", 1);
    appMag(i) = fscanf(starData, "%f", 1);
end

fclose(starData); % close file

[numK, perK] = specK(specType, stars); % use Function 1 to find the number of stars and percentage of stars with spec type K
fprintf("The number of stars with spectral type K is %i and the percentage of stars with spectral type K is %.3f%%.\n", numK, perK);

[furthest, closest] = farClose(dist, name); % use Function 2 to find the furthest and closest stars, excluding the sun
fprintf("The farthest star from Earth is %s. The closest is %s.\n", furthest, closest);

absMag = absoluteMagnitude(appMag, dist); % calculate the absolute magnitude of all of the stars using Function 3 and place into a vector

% ask user for the star they'd like to see more information on
userStar = input("\nPlease type the corresponding number to the star you would like to see information on.\n   1) Sol   2) Sirius   3) Canopus   4) Arcturus   5) AlphaCentauri   6) Vega   7) Capella\n   8) Rigel   9) Procyon   10) Achernar   11) Betelgeuse   12) Hadar   13) Altair   14) Aldebaran\n   15) Spica   16) Antares   17) Pollux   18) Fomalhaut   19) Deneb   20) Mimosa   21) Regulus\n");

[uName, uDist, uApp, uAbs] = userStarInfo(userStar, stars, name, dist, appMag, absMag); % use Function 4 to find the respective data for the user's star
fprintf("Name: %s\nDistance from Earth: %.3f parsecs\nApparent Magnitude: %.3f\nAbsolute Magnitude: %.3f\n", uName, uDist, uApp, uAbs);

starCalc = fopen("StarCalcs.txt", "w"); % open a new file to write data into

% for-loop for inputting all of the original star data into the file and adding in absolute magnitude data
for i = 1:stars
    fprintf(starCalc, "%s\t", name(i));
    fprintf(starCalc, "%f\t", dist(i));
    fprintf(starCalc, "%s\t", specType(i));
    fprintf(starCalc, "%f\t", appMag(i));
    fprintf(starCalc, "%f\n", absMag(i));
end

fclose(starCalc); % close the new file

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
% Function 1
function [countK, percentK] = specK(spec, numStars)
    % Counts the number of stars with spectral type K and calculates the percentage of stars with spectral type K
    % Call format: specK(spec, numStars)
    % Inputs
    %   spec: vector containing the spectral types of all stars
    %   numStars: number of stars
    % Outputs
    %   countK: number of stars with spectral type K
    %   percentK: percentage of stars with spectral type K
    
    countK = 0; % initialize count variable for number of stars with spec type K
    
    % MEANINGFUL FOR-LOOP
    for i = 1:numStars % iterate through the spectral types of all of the stars
        if (spec(i) == "K") % check if the spectral type is K
            countK = countK + 1; % if the spectral type is K, add 1 to the count of stars with spec type K
        end
    end
    
    percentK = countK / numStars * 100; % calculate the percentage of stars with spec type K using the count of stars with spec type K
end

% Function 2
function [far, close] = farClose(distances, names)
    % Find which stars are the furthest and closest (excluding the sun)
    % Call format: farClose(distances, numStars)
    % Input
    %   distances: vector containing the distances between the stars and Earth
    % Output
    %   far: the furthest star from Earth
    %   close: the closest star to Earth (excluding the sun)

    closeTemp = min(distances); % find the temporary minimum of the distances vector to find the closest star to Earth (which would be the sun)
    distances(find(closeTemp)) = []; % remove the sun's distance from the distances vector so that it is excluded
    names(find(closeTemp)) = []; % remove the sun from the names vector
    
    farDist = max(distances); % find the furthest star's distance from Earth
    closeDist = min(distances); % find the closest star's distance to Earth after removing the sun's distance from the distances vector
    
    far = names(find(distances == farDist)); % find the furthest star's name
    close = names(find(distances == closeDist)); % find the closest star's name
end

% Function 3
function absoluteMag = absoluteMagnitude(appMag, distances)
    % Calculates the absolute magnitude of the stars based on the apparent magnitudes and distances between the stars and Earth
    % Call format: absoluteMagnitude(appMag, distances)
    % Inputs
    %   appMag: vector of apparent magnitudes of the stars
    %   distances: vector of distances between the stars and Earth
    % Output
    %   absoluteMag: vector of absolute magnitudes of the stars
    
    absoluteMag = appMag - 5 * log10(distances) + 5; % use given formula to calculate absolute magnitude of all stars
end

% Function 4
function [n, d, app, abs] = userStarInfo(userStarNum, numStars, names, distances, appMags, absMags)
    % Finds the respective data of the user's star and outputs the data as variables
    % Call format: userStarInfo(userStarNum, numStars, names, distances, appMags)
    % Inputs
    %   userStarNum: the corresponding number to the user's star
    %   numStars: number of stars
    %   names: vector of names of all of the stars
    %   distances: vector of distances between all of the stars and Earth
    %   appMags: apparent magnitudes of all of the stars
    %   absMags: absolute magnitudes of all of the stars
    % Outputs
    %   n: user's star's name
    %   d: user's star's distance from Earth
    %   app: user's star's apparent magnitude
    %   abs: user's star's absolute magnitude
    
    i = 1; % initialize indexer variable for while-loop

    % MEANINGFUL WHILE-LOOP
    while i <= numStars % iterate until last star is gone through unless the i meets the user's star number
        if (i == userStarNum)
            n = names(i);
            d = distances(i);
            app = appMags(i);
            abs = absMags(i);
            break;
        end

        i = i + 1;
    end
end