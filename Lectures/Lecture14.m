% Shelley Wei
% ENGR 130
% Lecture 14
% 12/5/23

%% Practice 1
clear; clc; close all;

year = [1950:1999,1900:1916]; % year vector with errors

goodYears = year(year > 1949); % collect correct years
bugYears = year(year < 1950); % collect incorrect years
correctedList = [goodYears, bugYears+100]; % combine originally correct and corrected incorrect years

%% Practice 2
clear; clc; close all;

vMeas = [1:5];
fMeas = [1, 3.6, 8.5, 15, 26];

coeff = polyfit(vMeas, fMeas, 2);
fFit = polyval(coeff, vMeas);

hold on;
plot(vMeas, fMeas, "o");
plot(vMeas, fFit);
hold off;

title("Analyzing Force in a Gas Pipeline");
xlabel("Velocity (ft/s)");
ylabel("Force (lb)");
legend("Measured Data", "Quadratic Fit");

%% Practice 3
clear; clc; close all;

numWords = 43;

% initializing counter variables
less = 0;
four = 0;
more = 0;
count = 0;

% get input phrase
inFile = fopen("Lecture14_book.txt", "r");

% compile all words into vector
for k = 1:numWords
    in{k} = fscanf(inFile, "%s", 1);
end

fclose(inFile); % close file

for i = 1:length(in)
    w = in{i};
    if (strlength(w) < 4)
        less = less + 1;
        count(i) = 1;
    elseif (strlength(w) == 4)
        four = four + 1;
        count(i) = 0;
    else
        more = more + 1;
        count(i) = 1;
    end
end

out = in(count == 1);

fprintf("Four: %i\nLess: %i\nMore: %i\n", four, less, more);

outFile = fopen("Lectures\Lecture14_smallBook.txt", "w");

for k = 1:length(out)
    fprintf(outFile, "%s ", out{k});
end

fclose(outFile);