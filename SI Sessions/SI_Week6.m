% Shelley Wei
% ENGR 130
% SI Session Week 6
% 10/8/23

%% Summary Problems
%% 1
clear;
clc;
close all;

Nth_fibonacci = 10;
fib_array = [0, 1];
for count = 2:Nth_fibonacci %*** starting index incorrect since 1-1=0 and 0 isn't an index; fibonacci spelled incorrectly
    fib_array = [fib_array, fib_array(count) + fib_array(count - 1)]; %*** no end bracket...
end
fib_array(end);

%% 2
clear;
clc;
close all;

n = [5, 10, 15]
S = zeros(1, length(n));
i = 1;
while i < length(n)
    k = 1;
    while k <= n(i)
        % accumulate the sum for the i-th value of vector n and summing over values of k
        S(i) = (S(i + 1) + (-1)^(k - 1)) / (2 * k - 1) %*** parenthesis for numerator
        k = k + 1;
    end
    i = i + 1;
end