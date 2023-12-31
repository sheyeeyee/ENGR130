% Shelley Wei
% ENGR 130
% Lecture 13
% 11/28/23

%% Character Vectors
clear;
clc;

wiz = 'Albus Dumbledore' % stored as multiple elements bc each character is counted (single quotes for char)

check_w_size = size(wiz)
check_w_length = length(wiz)

%% Strings
clear;
clc;

my_string = "twine" % stored as one element so the size is 1x1 and length is 1 (double quotes for str)

check_twine = size("twine") % same as my_string
check_size = size(my_string)
check_length = length(my_string)

%% Practice 1 - Ranking with Characters & Strings

clear;
clc;

name_1 = 'Henry Jones, Jr.'; % 16
name_2 = "Indy"; % 1
init_1 = 'H'; % 1
init_2 = "IJ"; % 1
x = 'Junior'; % 6


A = length(init_1);                 % A = 1
B = length(init_2);                 % B = 1
C = length(x) - length(name_2);     % C = 6 - 1 = 5
D = length(name_1);                 % D = 16

fprintf(' A:  %i, B:  %i, C:  %i, D:  %i\n\n', A, B, C, D);


%%  Run above using size

E = size(init_1); % why is this a 1x0 matrix?
F = size(init_2);
G = size(x) - size(name_2);
H = size(name_1);

fprintf(' E:  %i, F:  %i, G:  %i, H:  %i\n', E, F, G, H);

%% Extract a character vector from a string by using { } brackets

clear;
clc;

my_string = "Susi Lab is the place to be!"; % this is a 1 x 1 string scalar

ans1 = my_string(1) % traditional indexing pulls the whole string

ans2 = my_string{1} % curly bracket indexing makes a single-cell character vector %%%% does the 1 mean 1 row?

ans3 = my_string{1}(2:10) % can index a curly bracket to pull separate characters

% We will come back to this section...

ans4 = my_string{1}(10:end)

new_string = strcat("think[box] ", ans4)

%% Some helpful functions when using Characters and Strings!

% strlength returns the number of characters in the string
clear;
clc;

test_string = "This is a test.";

test_length = length(test_string)
test_size = size(test_string)
test_strlength = strlength(test_string)

%% 

% strcat will join characters or strings (concatenate)
clear;
clc;

strcat("HARRY ","POTTER") % note the space character included here bc str
strcat('Ron ', 'Weasley') % but character white space will be dropped bc char
%%

% strtrim will remove both leading and trailing blanks
clear;
clc;

strtrim ("     Goodbye blank characters!     ")

%% 

% strcmp will compare two strings and return a logical operator denoting if the strings are identical or not.
clear;
clc;

word1 = 'wand'
word2 = 'WAND'
word3 = "wand"


% for strcmp the entire character array must be identical (case matters bc ASCII)
comp1 = strcmp(word1, word2)

% you can compare char arrays and strings and they'll be the same (spaces count too in both char and str)
comp2 = strcmp(word1, word3)

%% 

% split divides a string at any white space character
% (i.e. space, tab, or new line)
clear;
clc;

phrase = "It was a dark and stormy night."
words = split(phrase)

disp(words(5)) % displays the 5th word

%%
% strfind(string, substring): finds all occurrences of the substring within the string; returns a vector of the indices of the beginning 
% of the strings, or an empty vector if the substring is not found
clear;
clc;

strfind("abcde", 'd')

strfind("abcdefghi", "ef")

strfind("abcdabceabcdabcdddd", "ab")

strfind("abcd", "e")

%%
% strrep(string, oldsubstring, newsubstring): finds all occurrences of  the old substring within the string, and replaces with the new substring
% the old and new substrings can be different lengths
clear;
clc;

strrep("abcdefg", "e", "x")

%count(string, substring): counts the number of occurrences of a 
%substring within a string
count("abcdabceabcdabcdddd", "d")


%% Practice 2, Part 1
clear;
clc;

word1 = 'hello';
word2 = "sasdfasdfasdjfs";

compoundWord = strcat(word1, word2);

fprintf("%s, %s, %s", word1, word2, compoundWord);

%% Practice 2, Part 2
clear;
clc;

quote = "Why am I the only one in Mr. Schmidt's office hours?";

words = split(quote);

reverse = "";

for i = length(words):-1:1
    reverse = [reverse, words(i)];
end

%% Practice 3
clear; clc; close all;

data = fopen("Lecture13_Students2.txt", "r");

row = 9;
col = 4;

headers = "";

student = "";
id = 0;
house = "";
gpa = 0;

for i = 1:col
    headers(i) = fscanf(data, "%s", 1);
end

for i = 1:row
    student(i) = fscanf(data, "%s", 1);
    id(i) = fscanf(data, "%i", 1);
    house(i) = fscanf(data, "%s", 1);
    gpa(i) = fscanf(data, "%f", 1);
end

for i = 1:row
    if (house(i) == 'G')
        fprintf("%s\n", student(i));
    end
end

for i = 1:row
    if (gpa(i) >= 3.5)
        fprintf("%s\n", student(i));
    end
end

% if name starts with H or C