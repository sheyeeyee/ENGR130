% Shelley Wei
% ENGR 130
% SI Session Week 2
% 9/10/23

%% Summary Problems
%% 1
clear;
clc;
close all;
% Create 2 vectors: one that goes from 0 to 1 in a step size to be
% determined by the user and another vector that goes from 0 to 1 with an
% equally spaced number of values to be determined by the user.
vector1StepSize = input('Input a number between 0 and 1: \n');
vector1 = [0:vector1StepSize:1]

vector2NumberofNumbers = input('Input a whole number greater than 0: \n');
vector2 = linspace(0,1,vector2NumberofNumbers)

%% 2
clear;
clc;
close all;
% A local pet store has hired you to assist with cataloging their inventory
% of pets. According to the store records, there are currently 16 dogs
% which cost $50 each, 12 cats of $40 each, 82 birds at $30 each, and 212
% fish at $20 each. Make a vector called Inventory and a vector called
% Prices with items in the same order.
inventory = ["dogs","cats","birds","fish"];
prices = [50,40,30,20];
totalPets = [16,12,82,212];

    % a
    financialTotal = totalPets .* prices;
    data = [totalPets;prices;financialTotal];
    % b
    petType = input('Please input the respective number for which pet group you would like to see data on: \n 1) Dogs\n 2) Cats\n 3) Birds\n 4) Fish\n');
    fprintf('%i %s in stock, $%i each\n', data(1,petType), inventory(petType), data(2,petType));

%% 3
clear;
clc;
close all;

k = 9e9;
q1 = input("Please input a point charge value in Coulombs to calculate an electric force using Coulomb's Law: \n");
q2 = input("Please input another point charge value in Coulombs: \n");
r = input("Please input a distance in meters between the two point charges in meters: \n");

force = k*q1*q2/(r^2);

fprintf("\nElectric force: %.2E N\nPoint value charge 1: %.2E C\nPoint value charge 2: %.2E C\nDistance between charges: %.2E meters\n", force, q1, q1, r);

%% Test Your Understanding
%% 2
clear;
clc;
close all;

pi1 = cos(pi/4)^2;
pii = sin(pi/4)^2;
piii = pi1 + pii

%% 3
clear;
clc;
close all;

my_vector = (0:2:20);
my_value = my_vector(5);

%% 4
row_number = input('What row would you like?\n');
column_number = input("What column would you like?\n");
the_matrix = [1 0 0; 0 1 0; 0 0 1];
requested_number = the_matrix(column_number, row_number);

fprintf('Your number is %i\n',requested_number);