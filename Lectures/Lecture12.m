% Shelley Wei
% ENGR 130
% Lecture 12
% 11/21/23

%% Practice 1
clear; clc; close all;

studentInfo = fopen("Lectures\Lecture12_Student_info.txt");

for i = 1:10
    studentID(i) = fscanf(studentInfo, "%i", 1); % read first column
    schoolYear(i) = fscanf(studentInfo, "%i", 1); % read next column
    gpa(i) = fscanf(studentInfo, "%f", 1); % read next column
end

fclose(studentInfo);

%% Excess Data
clear; clc; close all;

% save into an unused variable
junk = fscanf(inData, '%s', 4);

% scan, but don't keep
fscanf(inData, '%s', 4);

%% Practice 2
clear; clc; close all;

col = 4;

stations = fopen("Lectures\Lecture12_Stations.txt");
fscanf(stations, "%s", 4);

i = 1;

stationName = [""];

while (fscanf(stations, "%s", 1) ~= "#")
    % stationName(i) = fscanf(stations, "%s", 1);
    hrs(i) = fscanf(stations, "%f", 1);
    up(i) = fscanf(stations, "%i", 1);
    down(i) = fscanf(stations, "%i", 1);

    i = i + 1;
end

fclose(stations);