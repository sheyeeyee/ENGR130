% Shelley Wei
% ENGR 130
% Lecture Preparation 4
% Started 9/23/23
% Finished 9/23/23
% Due 9/26/23

%% PART 1: IMPORTING AND EXPORTING .MAT FILES
% Note: .MAT files hold workspace variables
%% Loading .MAT Files
clear;
clc;
close all;

load('sample_file.mat'); % puts all stored variables into workspace
    % can also just open the .mat file from file explorer

load('sample_file.mat', 'var1', 'var2'); % loads only the specific variables listed

%% Practice 1
clear;
clc;
close all;

load('handel.mat'); % the composer
sound(y); % hallelujah

%% Saving .MAT Files
clear;
clc;
close all;

save('new_file.mat'); % saves (exports) .MAT file (workspace)

save('new_file.mat', 'var1', 'var2'); % saves specific workspace variables


%% Saving .MAT Demonstration
clear
clc;
close all;

% define variables
numbers = [1, 2, 3, 4];
first_line = 'This is my text variable.';

%% save all variables
save('C:\Users\shell\OneDrive\文档\MATLAB\ENGR130\Lecture Preparation and Practice\LecturePrep5_sample_file_1.mat');

%% save only one variable
save('C:\Users\shell\OneDrive\文档\MATLAB\ENGR130\Lecture Preparation and Practice\LecturePrep5_sample_file_2.mat', 'numbers');

%% Practice 2.1
clear;
clc;
close all;

altitudes1 = [1, 2, 3, 5, 10]; % create a vector for altitudes/1000 so I don't have to keep typing so many zeros
altitudes1k = altitudes1 * 1000; % multiple all altitudes by 1000 to get the actual altitude
kelvin = [288, 281, 269, 256, 223]; % create a vector for temp at each alt
alt_temps = [altitudes1k', kelvin']; % create matrix for altitudes and temp

save('C:\Users\shell\OneDrive\文档\MATLAB\ENGR130\Lecture Preparation and Practice\LecturePrep5_alt_temps.mat', 'alt_temps'); % save the matrix to a .MAT file

%% Practice 2.2
clear;
clc;
close all;

load('C:\Users\shell\OneDrive\文档\MATLAB\ENGR130\Lecture Preparation and Practice\LecturePrep5_alt_temps.mat');

plot(alt_temps(:, 1), alt_temps(:, 2), 'o'); % plot the columns of the matrix (: for every row, then the second # is the column #)
xlabel("Altitude (m)");
ylabel("Temperature (K)");
title("Temperature at Different Altitudes");

%% PART 2: IMPORTING AND EXPORTING .CSV FILES
% Note: useful for exporting to Excel, etc.
clear;
clc;
close all;

writematrix(a, 'my_file.csv'); % exports the matrix a to my_file.csv
    % other commands available for data types other than matrices

%% Importing .CSV Files
clear;
clc;
close all;

vec = readmatrix('my_file.csv'); % imports my_file.csv into variable vec
    % can also open .CSV file from file explorer

%% Example
% Save a .CSV file
clear;
clc;
close all;

c = 0:5:500;
writematrix(c, 'C:\Users\shell\OneDrive\文档\MATLAB\ENGR130\Lecture Preparation and Practice\LecturePrep5_sample_data.csv');

%% Load a .csv file
clear;
clc;
close all;

d = readmatrix('C:\Users\shell\OneDrive\文档\MATLAB\ENGR130\Lecture Preparation and Practice\LecturePrep5_sample_data.csv');

%% Practice 3
clear;
clc;
close all;

x = readmatrix('C:\Users\shell\OneDrive\文档\MATLAB\ENGR130\Lecture Preparation and Practice\LecturePrep5_xdata.csv');
y = readmatrix('C:\Users\shell\OneDrive\文档\MATLAB\ENGR130\Lecture Preparation and Practice\LecturePrep5_ydata.csv');

plot(x, y); % plotted a heart :)