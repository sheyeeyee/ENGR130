% Shelley Wei
% ENGR 130
% Lecture Preparation 4
% Started 9/16/23
% Finished 9/16/23
% Due 9/19/23

%% GRAPHING DATA
%% Plotting One Data Set
clear;
clc;
close all;

y_data = 1:2:100;
plot(y_data); % plotted against its own index values (in this case, x-axis is 1 to 50 and y-axis is 1 to 100)

%% Plotting Two Data Sets
clear;
clc;
close all;

% x-y data are vectors of equal length
    % the vector lengths must be equal length bc MATLAB is actually creating a scatterplot and connecting the dots
x_data = 1:0.1:5; % 1 to 5 in increments of 0.1
y_data = sin(x_data); % sin values
plot(x_data, y_data);

%% Plotting Vectors of Unequal Length
clear;
clc;
close all;

x_data = 1:5;
y_data = 1:10;
plot(x_data, y_data); % throws an error

%% Plotting Markers w/ No Line
clear;
clc;
close all;

% different line specifications (color, symbol, line type)
    % specs can be combined
x_data = 1:0.1:5;
y_data = sin(x_data);
plot(x_data, y_data, 'ro'); % r for red, o for circle marker, no line since no line specifier
plot(x_data, y_data, 'gs-'); % g for green, s for square, - for solid line

%% Practice 1
clear;
clc;
close all;

% vertical-axis variable vs. horizontal-axis variable
t = 0:0.2:20;
x = cos(2*pi*t);
plot(t, x, 'm--');

%% Labeling Plots
clear;
clc;
close all;

% xlabel(), ylabel(), title()
x_data = 1:4;
y_data = [1, 2, 5.5, 4];
plot(x_data, y_data, 'ro');
xlabel('Experiment number');
ylabel('Height, feet');
title('Maximum Height of Ball');

%% Multiple Figure Windows
clear;
clc;
close all;

% if you execute a plot, it's Figure 1 by default
    % executing another plot replaces Figure 1
    % use the figure() command
t = 0:0.1:10;
y1 = sin(t);
y2 = 2*sin(t);
figure(1);
plot(t, y1);
figure(2);
plot(t, y2);

%% Multiple Plots on One Figure
%% Option 1
clear;
clc;
close all;

t = 0:0.1:10;
y1 = sin(t);
y2 = cos(t);
plot(t, y1, t, y2); % just input x's and y's in sequence

%% Option 2
clear;
clc;
close all;

t = 0:0.1:10;
y1 = sin(t);
y2 = 0.5*sin(t);
y3 = 2*sin(t);

hold on % hold is a toggle
plot(t, y1);
plot(t, y2);
plot(t, y3);
hold off % remember to turn hold off!

%% Using a Legend
clear;
clc;
close all;

t = 0:0.1:10;
y1 = sin(t);
y2 = 0.5*sin(t);
y3 = 2*sin(t);

hold on % hold is a toggle
plot(t, y1);
plot(t, y2);
plot(t, y3);
hold off % remember to turn hold off!

legend('Data set 1', 'Data set 2', 'Data set 3'); % create the legend AFTER plotting

%% Practice 1.5
clear;
clc;
close all;

t = 0:0.2:20;
x = cos(2*pi*t);
v = sin(2*pi*t);

figure(1);
plot(t, x, 'm--');
title('Velocity of Mass Over Time');
xlabel('Time (s)');
ylabel('Velocity (m/s)');
figure(2);
plot(t, v, 'c-');
title('Velocity of Mass Over Time');
xlabel('Time (s)');
ylabel('Velocity (m/s)');

%% Practice 1.5.1
hold on;
plot(t, x, 'm--');
plot(t, v, 'c-');
hold off;

title('Velocity of Mass Over Time');
xlabel('Time (s)');
ylabel('Velocity (m/s)');
legend('Data set 1', 'Data set 2');