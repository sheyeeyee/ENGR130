% Shelley Wei
% ENGR 130
% Midterm Exam Practice Packet
% 10/6/23

%% 4
clear;
clc;
close all;

z = [(1:2:9)', (2:2:10)']

%% 5
clear;
clc;
close all;

x = [5 8 11];
z = x - 3

%% 6
clear;
clc;
close all;

A = [1:4; 5:8; 9:12];
B = [A(1, 3), A(1, 4); A(2, 3), A(2, 4)]

%% 7
clear
clc;
close all;

smiley = randn(3)
sumManual = 0;

for i = 1:length(smiley)
    for j = 1:length(smiley')
        sumManual = sumManual + smiley(i, j);
    end
end

sumManual
sumEz = sum(sum(smiley))

%% 8
clear;
clc;
close all;

paint = 0;

while (paint <= 16)
    paint = paint + 5;
    disp(paint);
end

%% 10
clear;
clc;
close all;

for i = 0:80
    fprintf("%.1f\n", i*0.1);
end

%% 12
clear;
clc;
close all;

P = [2:2:20];
Q = P - 1
R = [P;Q]
R_sq = R.^2
S = R(2, 1:3)

%% 13
clear;
clc;
close all;

guess = input("Guess a letter.\n", 's');

while true
    if (guess == "s" || guess == "S")
        fprintf("Congrats! You guessed the right letter!\n");
        break;
    elseif (guess == "t" || guess == "T" || guess == "r" || guess == "R")
        guess = input("Close! Try again.\n", 's');
    else
        guess = input("Eh... you're not very close. Try again!\n", 's');
    end
end

%% 16
clear;
clc;
close all;

values = [1 2 4 4 5 6 6 7 8];

avg = mean(values);
lessThanAvg = values(values < avg);
greaterThanAvgIdx = find(values > avg);