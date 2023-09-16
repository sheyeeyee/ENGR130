% Shelley Wei
% ENGR 130
% Homework 4
% Started 9/15/23
% Finished 9//23
% Due 9/20/23

%% Question 2
clear;
clc;
close all;

% vectors for initial vitamin D, final vitamin D, and minutes of sun
D_init = [68.68 59.26 43.74 18.54 8.71 59.20 69.82 40.07 33.27 68.45 7.46 43.48 68.65 56.84 57.46 11.03 33.56 26.72 4.75];
D_final = [66.30 63.66 46.24 16.91 15.72 62.49 70.80 38.24 38.16 73.75 9.67 49.51 67.09 61.09 55.97 11.67 30.80 30.23 8.48];
sun = [147 40 146 78 263 175 266 120 48 90 105 175 172 106 258 33 203 86 220];

% calculate the (hopeful) increase in vitamin D for each participant
% store in a vector called diff
diff = D_final - D_init;

% compute the ratio of increase in vitamin D level to minutes of sunlight
% for each participant.  Store in a vector called ratio.
ratio = diff ./ sun;

% compute the average of these ratios; store in variable called avg
avg = mean(ratio);

% initialize counters for each category of vitamin D level to zero
defic = 0;
inadeq = 0;
adeq = 0;
excess = 0;

% use a loop and if structure to determine how many participants have
% final vitamin D levels in each of the 4 categories.
for i = 1:length(sun)
    if (D_final(i) < 13)
        defic = defic + 1;
    elseif (D_final(i) < 20)
        inadeq = inadeq + 1;
    elseif (D_final(i) < 50)
        adeq = adeq + 1;
    else
        excess = excess + 1;
    end
end

% fprintf("%i, %i, %i, %i\n", defic, inadeq, adeq, excess);

%% Question 3
clear;
clc;
close all;

% scores received from HW 4 file
score = [59, 70, 88, 95, 92, 76, 94, 87, 82, 91, 88, 65, 86, 93, 88, 96, 92, 87, 30, 80];
letterGrade = zeros;

numA = 0;
numB = 0;
numC = 0;
numD = 0;
numF = 0;

numLetterGrade = zeros;

for i = 1:length(score)
    if (score(i) < 60)
        letterGrade(i) = "F";
        fprintf("Student %i: Score %i, Grade F\n", i, score(i));
        numLetterGrade(5) = numLetterGrade(5) + 1;
    elseif (score(i) < 70)
        letterGrade(i) = "D";
        fprintf("Student %i: Score %i, Grade D\n", i, score(i));
        numLetterGrade(4) = numLetterGrade(4) + 1;
    elseif (score(i) < 80)
        letterGrade(i) = "C";
        fprintf("Student %i: Score %i, Grade C\n", i, score(i));
        numLetterGrade(4) = numLetterGrade(4) + 1;
    elseif (score(i) < 90)
        letterGrade(i) = "B";
        fprintf("Student %i: Score %i, Grade B\n", i, score(i));
        numB = numB + 1;
    elseif (score(i) < 100)
        letterGrade(i) = "A";
        fprintf("Student %i: Score %i, Grade A\n", i, score(i));
        numA = numA + 1;
    end
end

avgScore = mean(score);
fprintf("The average score for the class is %.1f\n", avgScore);

for (i = 1:)