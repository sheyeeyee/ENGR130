% Shelley Wei
% ENGR 130
% Module 1 Lab 1
% 9/12/23

%% Repetition
clear;
clc;
close all;

% for loops
for count = 1:1:4
    fprintf("The count is %i.\n", count); % MATLAB automatically indents this line to make it clear that this is part of the loop
end

for count = 1:5 % MATLAB will assume increment by 1
    fprintf("I will not talk in class.\n");
end

%% Practice 1
clear;
clc;
close all;

for count = 0:3:12
    fprintf("The count is %i.\n", count);
end

for count = (0:4)*3
    fprintf("The count is %i.\n", count);
end

for count = linspace(0,12,3)
    fprintf("The count is %i.\n", count);
end

for count = 1:1:4
    fprintf("The count is %i.\n", 3*count);
end

vector = [3,4,6,1,7];
for count = 1:1:length(vector)
    fprintf("The count is %i.\n", vector(count));
end

% the following should be a while loop, not a for loop
% count = 0;
% for count <= 12
%     fprintf("The count is %i.\n", count);
%     count = count + 3;
% end

% turning a while loop into a for loop
count = 0;
while count <= 12
    fprintf("The count is %i.\n", count);
    count = count + 3;
end

%% Making Vectors w/ Loops
clear;
clc;
close all;

% Example
v = zeros; % What's the difference between this and eagle = 0? "X = zeros returns the scalar 0." Isn't just 0 a scalar too?
% v = 0;
for j = 1:4
    v(j) = j*2;
end
disp(v);

%% Nested for Loops
clear;
clc;
close all;

eagle = 0; % this doesn't preallocate eagle
for row = 1:4
    for col = 1:3
        eagle(row,col) = row^col;
    end
end
disp(eagle);

%% Example
clear;
clc;
close all;

v = [5,8,6,3,4,7];

% print every other number in the vector starting from 8
for count = 2:2:length(v)
    fprintf("%i\n", v(count))
end

%% while Loops
% indefinite: doesn't know how many times the loop will run before it ends
% (does not mean infinite)
%% Example
clear;
clc;
close all;

number = 0;

while (number < 5)
    fprintf("%i is an acceptable number.\n", number);
    number = input("Enter a number.\n");
end

fprintf("The end.\n");

%% Example
clear;
clc;
close all;

number = 0;

while (number < 5)
    fprintf("%i is an acceptable number.\n", number);
    number = number + 3;
end

fprintf("The end.\n");