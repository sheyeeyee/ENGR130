% Shelley Wei
% ENGR 130
% Lecture Preparation 12
% Started 11/20/23
% Finished 11/20/23
% Due 11/21/23

%% FILE INPUT AND OUTPUT
% save, load, readmatrix aren't as flexible with importing/exporting data as we would like
% - save and load only work with files that include the same type of variable througout or .mat files
% - readmatrix can't read text

%% More Flexible File Creation
% fprintf allows us to provide an output of different types of variables
% - fopen (open file and get file ID)
% - fprintf (write info to file)
% - fclose (stop communication btwn MATLAB and file)

%% Example: Writing a File
clear; clc; close all;

name = input("What is your name?\n", 's');
num = input("What is your favorite integer?\n");

out_file = fopen("C:\Users\shell\Documents\MATLAB\ENGR130\Lecture Preparation\LecturePrep12_records.txt", "w"); % open file for writing
fprintf(out_file, "%s has a favorite integer of %i.\n", name, num);
fclose(out_file); % close file

fprintf("%s has a favorite integer of %i.\n", name, num); % print to command window

%% Example: Reading a File
clear; clc; close all;

fID = fopen("C:\Users\shell\Documents\MATLAB\ENGR130\Lecture Preparation\LecturePrep12_in.txt", "r");
x = fscanf(fID, "%f", 2); % store 2 floating point values in x
y = fscanf(fID, "%f", [2, 3]);
fclose(fID);