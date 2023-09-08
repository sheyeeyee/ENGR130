% Shelley Wei
% ENGR 130
% Lecture Preparation 2
% Started 9/8/23
% Finished 9/8/23
% Due 9/12/23

%% COMPARISON AND SELECTION STRUCTURES
%% Comparisons
clear;
clc;
close all;

a = 5;
b = 6;
a > b
a < b
a <= b
a >= b
a == b
a ~= b

%% Multiple Conditions
clear;
clc;
close all;

x = -1;
y = -2;
z = 3;
x < y < z % this returned logical 1 even though x isn't less than y
    % this is because MATLAB first checked the comparison btwn x and y,
    % then compared the result of the x and y comparison and z, and since 
    % y < z, it returned true

x1 = -3;
y1 = -2;
z1 = -1;
x1 < y1 < z1 % this returned logical 0 even though x1 < y1 < z1
    % this is because MATLAB first checked if x1 < y1, which returns 1
    % because it's true, then the returned value is checked with z1, and 
    % 1 ~< -1

% To avoid the issues above, use logical operators!
%% Logical Operators
% & operator
    % all conditionals must be true for the entire statement to be true
% | operator
    % one conditional must be true for the entire statement to be true
    % both conditionals must be false for the entire statement to be false

%% Conditionals
clear;
clc;
close all;

% if (condition)
    % action(s)
% end
% x = 5;
x = 6;

if (x == 5) % if x ~= 5, nothing happens
    fprintf('x is 5\n');
end

%% Testing
clear;
clc;
close all;

x = 4;
y = 10;
z = 15;

if (x < z+y-x) % wow... you don't need parenthesis
    fprintf('print\n')
end