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

% testing
% fprintf("%i, %i, %i, %i\n", defic, inadeq, adeq, excess);

%% Question 3
clear;
clc;
close all;

% scores received from HW 4 file
score = [59, 70, 88, 95, 92, 76, 94, 87, 82, 91, 88, 65, 86, 93, 88, 96, 92, 87, 30, 80];
letterGrade = ["A", "B", "C", "D", "F"];
numLetterGrade = [0, 0, 0, 0, 0];

% print each student's score/grade and count the number of students that earn each grade (same loop for the sake of saving space and preventing repetitive code)
for i = 1:length(score) % iterate through the number of scores/students (use length() so the for-loop can run for any number of students)
    if (score(i) < 60)
        fprintf("Student %i: Score %i, Grade F\n", i, score(i)); % display the student's score and letter grade
        numLetterGrade(5) = numLetterGrade(5) + 1; % for each student with this letter grade, add 1 to keep count to later calculate the percentage of students that earn each letter grade
    elseif (score(i) < 70)
        fprintf("Student %i: Score %i, Grade D\n", i, score(i));
        numLetterGrade(4) = numLetterGrade(4) + 1;
    elseif (score(i) < 80)
        fprintf("Student %i: Score %i, Grade C\n", i, score(i));
        numLetterGrade(3) = numLetterGrade(3) + 1;
    elseif (score(i) < 90)
        fprintf("Student %i: Score %i, Grade B\n", i, score(i));
        numLetterGrade(2) = numLetterGrade(2) + 1;
    elseif (score(i) < 100)
        fprintf("Student %i: Score %i, Grade A\n", i, score(i));
        numLetterGrade(1) = numLetterGrade(1) + 1;
    end
end

% calculate the average of all teh students' scores and display it
avgScore = mean(score);
fprintf("\nThe average score for the class is %.1f.\n", avgScore);

% calculate the percent of students earning each grade using the vector that counted the number of grades in the previous for-loop
percentLetterGrade = numLetterGrade / length(score) * 100;

% display the percentages of students earning each letter grade using a for-loop so the same code isn't written over and over again just to change the percent and letter grade
for i = 1:length(numLetterGrade)
    fprintf("%.1f percent of the class earned a(n) %s.\n", percentLetterGrade(i), letterGrade(i));
end