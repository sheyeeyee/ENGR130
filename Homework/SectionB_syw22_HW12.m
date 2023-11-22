% Shelley Wei
% ENGR 130
% Homework 12
% Started 11/14/23
% Submitted 11/21/23
% Due 11/22/23

%% Problem 2
clear; clc; close all;

rng('shuffle');

num_orange = 150; % number of oranges

% velocity limits
a = 20;
b = 30;
c = 25;
d = 45;

% the calculations in the two lines below contain no errors - promise!
x_vel = a + (a + b) * rand([num_orange, 1]); % m/s; constant horizontal velocity
y_vel = c + (c + d) * rand([num_orange, 1]); % m/s; initial vertical velocity

made_it = 0; % initialize counter for number of oranges that hit the pile

figure();
hold on; %*** forgot hold on

for n = 1:num_orange
    % call the user-defined function
    made_it = made_it + orange_flight(x_vel(n), y_vel(n)); %*** iterate the variable for number of oranges made into the compost
end

hold off

fprintf('%i oranges will make the compost pile.\n', made_it); %*** trying to print how many make the compost pile, not how many missed

%% Problem 3
clear; clc; close all;

% Problem Statement
    % Shrek Quote Generator
    %   Be entertained by random quotes from Shrek movies (all of which are
    %   absolute gems to this world and deserve to be praised forever because
    %   of their artistry and elegance).
    %   
    %   The code first introduces the first Shrek movie with the beginning
    %   of the movie script, then asks the user which character they would
    %   like to see quotes from. After that, a random quote is generated
    %   from the corresponding character, and the user is asked whether
    %   they'd like to see another quote. 

%% Code w/ Errors
clear; clc; close all;

% introducing Shrek movie
fprintf("'Once upon a time there was a lovely princess. But she had an enchantment upon her of a fearful sort which \n\ncould only be broken by love's first kiss. She was locked away in a castle guarded by a terrible fire-breathing \ndragon. Many brave knights had attempted to free her from this dreadful prison, but none prevailed. She waited in \nthe dragon's keep in the highest room of the tallest tower for her true love and true love's first kiss.' \n\nSHREK: \n(laughs) Like that's ever gonna happen. What a load of -- \n(toilet flush)\n");

fprintf("\nSomebody once told me the world was gonna roll me. I ain't the sharpest tool in the sheeed... (music note)\n(All Star continues playing in the background)\n\nShrek Quotes!\n");

rng('shuffle'); % initialize rng based on current time

% initialize the number of quotes from each character
numShrekQuotes = 3;
numDonkeyQuotes = 6;
numFionaQuotes = 2;
numFarqQuotes = 2;

% create a boolean as to whether the user wants to generate/regenerate a quote or not for the while-loop condition (implemented further at the end  of the while-loop)
regen = 2;

% while-loop for generating quotes from respective characters
while (regen == 3)
    % ask user for character
    character = input("What character would you like to see a quote from? Select the corresponding number.\n    1) Shrek    2) Donkey    3) Fiona    4) Lord Farquaad\n");

    % conditionals for the different characters
    if (character == 1)
        % generate quote number based on number of quotes available for character
        quoteIndex = randi(numFionaQuotes);
        fprintf("\nSHREK: ");

        if (quoteIndex == 1)
            fprintf("\nWhat are you doing in my swamp??\n");
        elseif (quoteIndex == 2)
            fprintf("\nOgres are like onions. Ogres have layers, onions have layers.\n");
        elseif (quoteIndex == 3)
            fprintf("\nDo you think he's compensating for something?\n");
        end
    elseif (character == 2)
        quoteIndex = randi(numDonkeyQuotes);
        fprintf("\nDONKEY: ");

        if (quoteIndex == 1)
            fprintf("\nI like that boulder. That is a nice boulder.\n");
        else
            fprintf("\nAll right, all right. Don't get all slobbery. No one likes a kiss ass.\n");
        end
    elseif (character == 3)
        quoteIndex = randi(numFionaQuotes);
        fprintf("\nFIONA: ");

        if (quoteIndex == 1)
            fprintf("\nHey, wait. What are you doing? You should sweep me off my feet out yonder window and down a rope onto your valiant steed.\n");
        else
            fprintf("\n(sings progressively higher pitched notes until bird that sings along with her explodes...)\n");
        end
    elseif (character == 5)
        quoteIndex = randi(numFarqQuotes);
        fprintf("LORD FARQUAAD: ");

        if (quoteIndex == 1)
            fprintf("\nThe muffin man?... Yes, I know the muffin man who lives on Drury Lane.\n");
        else
            fprintf("\nOh, that is so sweet. You don't have to waste good manners on the ogre. It's not like it has feelings.\n");
        end
    end

    % ask user if they'd like to regenerate a quote to determine whether while-loop continues or not
    regen = input("\nWould you like to read another random Shrek quote? Select the corresponding number.\n    1) Yes    2) No\n");
end

%% Code w/o Errors
clear; clc; close all;

% introducing Shrek movie
fprintf("'Once upon a time there was a lovely princess. But she had an enchantment upon her of a fearful sort which \n\ncould only be broken by love's first kiss. She was locked away in a castle guarded by a terrible fire-breathing \ndragon. Many brave knights had attempted to free her from this dreadful prison, but none prevailed. She waited in \nthe dragon's keep in the highest room of the tallest tower for her true love and true love's first kiss.' \n\nSHREK: \n(laughs) Like that's ever gonna happen. What a load of -- \n(toilet flush)\n");

fprintf("\nSomebody once told me the world was gonna roll me. I ain't the sharpest tool in the sheeed... (music note)\n(All Star continues playing in the background)\n\nShrek Quotes!\n");

rng('shuffle'); % initialize rng based on current time

% initialize the number of quotes from each character
numShrekQuotes = 3;
numDonkeyQuotes = 2; %*** there are only 2 Donkey quotes, not 6
numFionaQuotes = 2;
numFarqQuotes = 2;

% create a boolean as to whether the user wants to generate/regenerate a quote or not for the while-loop condition (implemented further at the end  of the while-loop)
regen = 1; %*** regen should start with a value of 1 so that the while-loop can run

% while-loop for generating quotes from respective characters
while (regen == 1) %*** regen should only equal 1 or 2 because that is what the user should input
    % ask user for character
    character = input("What character would you like to see a quote from? Select the corresponding number.\n    1) Shrek    2) Donkey    3) Fiona    4) Lord Farquaad\n");

    % conditionals for the different characters
    if (character == 1)
        % generate quote number based on number of quotes available for character
        quoteIndex = randi(numShrekQuotes); %*** should be numShrekQuotes, not numFionaQuotes
        fprintf("\nSHREK: ");

        if (quoteIndex == 1)
            fprintf("\nWhat are you doing in my swamp??\n");
        elseif (quoteIndex == 2)
            fprintf("\nOgres are like onions. Ogres have layers, onions have layers.\n");
        elseif (quoteIndex == 3)
            fprintf("\nDo you think he's compensating for something?\n");
        end
    elseif (character == 2)
        quoteIndex = randi(numDonkeyQuotes);
        fprintf("\nDONKEY: ");

        if (quoteIndex == 1)
            fprintf("\nI like that boulder. That is a nice boulder.\n");
        else
            fprintf("\nAll right, all right. Don't get all slobbery. No one likes a kiss ass.\n");
        end
    elseif (character == 3)
        quoteIndex = randi(numFionaQuotes);
        fprintf("\nFIONA: ");

        if (quoteIndex == 1)
            fprintf("\nHey, wait. What are you doing? You should sweep me off my feet out yonder window and down a rope onto your valiant steed.\n");
        else
            fprintf("\n(sings progressively higher pitched notes until bird that sings along with her explodes...)\n");
        end
    elseif (character == 4) %*** there are only 4 characters, the last character is the 4th one
        quoteIndex = randi(numFarqQuotes);
        fprintf("LORD FARQUAAD: ");

        if (quoteIndex == 1)
            fprintf("\nThe muffin man?... Yes, I know the muffin man who lives on Drury Lane.\n");
        else
            fprintf("\nOh, that is so sweet. You don't have to waste good manners on the ogre. It's not like it has feelings.\n");
        end
    end

    % ask user if they'd like to see another quote to determine whether while-loop continues or not
    regen = input("\nWould you like to read another random Shrek quote? Select the corresponding number.\n    1) Yes    2) No\n");
end

%% Functions
% Problem 2
function [compost] = orange_flight(vx, vy) %*** switch x and y velocity
    % This function takes the initial velocity of an orange, calculates its
        % final x location, and plots the orange's flight path
    % Format of Call: orange_flight(x_vel(n), y_vel(n))
    % Input: Horizontal velocity & initial vertical velocity for the specific
        % orange
    % Output: logical (1 if the orange landed in the compost pile, 0 if it
        % didn't)
    
    % constants:
    g = -9.81; % m/s^2
    dt = 0.25; % m/s    
    compost_dist = 500; % m; distance to the compost pile
    m = 200; % g; mass of orange
    xi = 0; % m; inital horizontal distance
    yi = 50; % m; initial height
    t = 0; % s; time vector
    x = xi; % x position vector
    y = yi; % y position vector
    
    idx = 1; % counter
    compost = 0; % counter for oranges that make it in
    
    while y(idx) >= 0
        % while the orange is in flight 
        idx = idx + 1;
        t(idx) = t(idx-1) + dt;
        x(idx) = xi + vx*t(idx);
        y(idx) = yi + vy(1)*t(idx) + 0.5*g*t(idx)^2;
    end
    
    if x(idx) >= compost_dist %*** should be greater than or equal to for oranges that make it into the compost, not just equal to
        % if the orange misses the compost pile [IGNORE]
        compost = compost + 1;
    else
        % if the orange MAKES IT INTO the compost pile [IGNORE]
        plot(x, y, '*'); %*** switch x and y
        title('Flights of Oranges that Missed the Compost Pile');
        xlabel('horizontal distance (m)');
        ylabel('height (m)'); %*** forgot quotes around y-axis label
    end
end %*** forgot to end function