% Shelley Wei
% ENGR 130
% Homework 14
% Started 11/28/23
% Submitted 12//23
% Due 12/6/23

%% Question 1
clear; clc; close all;

in_phrase = "yo this code is so cool";
out_phrase = myFunction(in_phrase)

%% Question 2


%% Function
function [encoded] = myFunction(message)
    words = split(message);
    
    long = length(words);
    
    ay = "ay";
    bro = "bro";
    sis = "sis";
    
    encoded = [];
    
    for i = 1:long
        currWord = words(i);
        currChar = currWord{1}(1);
        if (currChar == "y") % beginning w/ y
            currWord = strcat(currWord, currChar, ay);
            currWord = currWord{1}(2:end);
        elseif (currChar == "a" || currChar == "e" || currChar == "i" || currChar == "o" || currChar == "u") % beginning w/ vowel
            currWord = strcat(currWord, sis);
        else % beginning w/ consonant
            currWord = strcat(currWord, currChar, bro);
            currWord = currWord{1}(2:end);
        end
        encoded = [encoded, currWord];
    end
end