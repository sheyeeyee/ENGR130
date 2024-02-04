% Shelley Wei
% ENGR 130
% Student-Generated Debugging Practice
% 12/19/23

%% 1) Tylenol Dosages
% The code is supposed to allow pharmacologists calculate the dosage of Tylenol in a person's body at a given time. 
% It is also supposed to check whether this dosage exceeds the daily threshold of Tylenol that is advised. 
% The code uses the following equation to calculate the daily dosage: 
%   Dosage at a given time = amount of drug taken at the beginning*(0.5 ^(time since the drug was taken/half-life of the drug))  

%Finding the amount of tylenol present in a body after some time and 
%plotting it on a curve 
clc; clear; close all;  

%Asking the user to input values for the amount of tylenol and the amount 
%of time that has passed 
amt = input ('Please input the amount of tylenol you have consumed today (in mg)\n');
time = input ('Please input the time that has passed since you took tylenol (in  min)\n');

%calculating the half life of tylenol 
half_life = 2*60;  

%calculating the dosage at the user's given time 
dosage = (amt) * (0.5 ^ (time/half_life));  

%using an if loop to determine whether the dosage is above or below the 
%threshold 
if dosage >= 4000    
    fprintf ('You have exceeded the maximum amount of tylenol for today. Liver damage is possible!\n') 
else    
    alt_dosage = 4000 - dosage; %calculating the dosage that can be taken if its under the threshold
    fprintf ('You are within the limit - you have %.2f mg of tylenol in your body right now and can consume %.2f mg of tylenol in the next 24h\n', dosage, alt_dosage);
end  

%plotting the dosage vs time in order to visualize the point and the %corresponding threshold 
plot (time, dosage, 'k*');
xlabel ('Time (min)'); 
ylabel ('Amount of Tylenol (mg)'); 
yline(4000); %drawing a line to depict the threshold 
ylim([0 100]); %limiting the y axis so that you can see the threshold and values

%% 2) National Park Visits
% The code was written in order to provide the user of the script knowledge about National Park visitation over the years. 
% The code should accomplish asking the user what they want to know about National Parks visitation, then returning the answer to their question.  
clear; clc; close all;  

% National Park Data Taken from Website (1904 to 2022) 
parkAttendance = [120690 140954 30569 32935 42768 60899 173416 194207 198334 216853 209693 314299 326506 453498 436222 781178 1022091 1101697 1136949 1364024 1527999 1900499 2162640 2465058 2703753 3010912 3038935 3217674 3551885 3255684 6095201 7435659 11749790 14838640 16019483 15141032 16410148 20487633 8891495 6383513 7723790 10855548 20918012 24258527 26294795 29124837 32706172 36613178 41804313 45679754 47967800 48891000 53872100 58220600 58466800 62834000 71586000 78933900 88548300 101959800 109190300 118662500 129282100 135414200 145449500 159103500 168135100 151265400 163156569 166572300 168686500 188085700 215359800 209370600 221127705 205369795 220463211 238592669 244924579 243619396 248785509 263441808 281094850 287244998 282451441 269399837 255581467 267840999 274694549 273120925 268636169 269564307 265796163 275236335 286762265 287130879 285891275 279873926 227299880 266230290 276908337 273488751 272623980 275581547 274852949 285579941 281303769 278939216 282765682 273630895 292800082 307247252 330971689 330882751 318211833 327516619 237064332 297115406 311985998];  

% Create a vector of years from 1904 to 2022 
years = linspace(1904,2022,119);

% Display options to user and ask for input 
option = input('\nWelcome to the National Park Program! \nEnter the number corresponding to the action you want to take... \n1) View a graph of National Park Attendance \n2) Ask about a specific year \n3) Ask about the year with the greatest and least attendance \n');  

% Follow the users input 
if option == 1
    % The user asked to see a graph 
    % Graph park attendance over the years open 
    maxAttendance = max(parkAttendance);
    plot(years,parkAttendance);
    hold on;
    xlim([1904, 2022]);
    ylim([0, maxAttendance + maxAttendance/10]);
    xlabel('Park Years')
    ylabel('Yearly Park Attendance')      
    title('National Park Visitation over the Years')       
    % Add a point to the graph when the parks had the highest visitation      
    maxYear = years(parkAttendance == maxAttendance);      
    plot(maxYear, maxAttendance, 'r*');       
    
    % Create a fit to model the increasing attendance of National Parks      
    p = polyfit(years, parkAttendance, 2);
    horizontalValues = linspace(min(years), max(years), 119);      
    verticalFit = polyval(p, horizontalValues);      
    plot(years, verticalFit);  
elseif option == 2        
    % The user wants to ask about a specific year      
    % Ask the user what year      
    userYear = input('\nWhat year would you like to know about? We have data from 1904 to 2022 \n');       
    
    % Display the information for that year      
    fprintf('In %i there were %i people who visited the National Parks \n', userYear, parkAttendance(years == userYear));  
elseif option == 3  
    % The user asked what year the National Parks had the greatest attendance 
    % Find the max attendance and what year that happened      
    maxAttendance = max(parkAttendance);      
    maxYear = years(parkAttendance == maxAttendance);  
    % Display info      
    fprintf('The greatest yearly visitation of the National Parks was %i people in %i', maxAttendance, maxYear);
end

%% 3) Tesla Data
clear; clc; close all;

% Given (raw) data - time is in seconds, velocity is in miles per hour
time = [0 1 2 2.249 3 4 4.5 5 5.758 6 6.35 7 8 8.652 9 10 11 11.194 12 12.6 13 13.376 14]; 
velocity_mph = [0 13 25 28 38 50 55.5 59.5 66 68 70 75 81 84 86 90.5 95 96.215 98 100 102 103.499 105];  

% Convert from miles per hour to meters per second (this is the correct conversion) 
velocity_meters_per_second = velocity_mph .* 0.44704;

% Determine the coefficients of a third order fit to the velocity (m/s) data vs.time 
coeff = polyfit(time,velocity_meters_per_second, 3);
fit_timeval = linspace(0,14,100);
fit_values = polyval(coeff, fit_timeval);

% Display the third order fit values as a function of t, or time 
fprintf('The third order fit can be represented by the equation %.2ft^3 - %.2ft^2 + %.2ft - %.2f, where "t" represents time.\n', coeff(1), -coeff(2), coeff(3), - coeff(4)) 
% Plot velocity vs. time from the raw data, as well as the third order fit vs. time, on the same graph, with appropriate title and labels 
figure(1) 
subplot(3,1,1) 
hold on 
plot(time,velocity_meters_per_second,'or') 
plot(fit_timeval,fit_values,'-k') 
hold off 
title('Velocity of Tesla Model 3 at Max Acceleration vs. Time') 
xlabel('Time (s)') 
ylabel('Velocity (mph)')  

% Location and southeast puts the legend in the bottom right corner of the graph 
legend('Measured Data', 'Third Order Fit', 'Location', 'southeast')  

% Calculate position of the car (in meters) using the idea of integration, and % calculate acceleration of the car (in meters per second squared) using derivatives. 
% This is based on the time values used for the third order fit, % not the original time data. It is assumed that the original position of the  % car is zero. 
for i = 1:length(fit_timeval)
    position(i) = (coeff(1) / 4 * fit_timeval(i).^4) + (coeff(2) / 3 * fit_timeval(i).^3) + (coeff(3) / 2 * fit_timeval(i).^2) + (coeff(4) * fit_timeval(i));   
    acceleration(i) = (coeff(1) * 3 * fit_timeval(i).^2) + (coeff(2) * 2 *   fit_timeval(i)) + (coeff(3)); 
end

% Plot position vs. time on the same figure, with appropriate title and labels 
subplot(3,1,2) 
plot(fit_timeval, position, '-k') 
title('Calculated Position of Tesla Model 3 vs. Time Using Third Order Fit    Values') 
xlabel('Time (s)') 
ylabel('Position (m)')  

% Plot acceleration vs. time on the same figure, with appropriate title and labels 
subplot(3,1,3) 
plot(fit_timeval,acceleration,'-k') 
title('Calculated Acceleration of Tesla Model 3 vs. Time Using Third Order Fit Values') 
xlabel('Time (s)')
ylabel('Acceleration (m/s^{2})')

%% 4) Sevens Out
clear; clc; close all; 
rng('shuffle');   % seed the generator  

% set the winning score and current score 
winning_score = 45; 
current_score = 0; 
num_turns = 0;  

% indicates whether the game should continue (0) or has been won (1) 
game_won = 0;  

% simulates the game 
while(game_won == 0)   
    num_turns = num_turns + 1;    

    % calls dice roll function 
    fprintf("\nRolling the dice...\n");   
    pause(1);   
    current_roll = roll_dice();    
    
    if (current_roll == 7)  % resets score if 7 is rolled     
        fprintf("You rolled 7! Score resets :(\n");     
        current_score = 0;   
    else % adds roll sum to score and prints out total score     
        current_score = current_score + current_roll;     
        fprintf("Your current score is %i.\n", current_score);   
    end    
    
    % if winning score has been reached, ends game   
    if(current_score >= winning_score)     
        game_won = 1;     
        fprintf("You won the game!\n");   
    end    
    
    % saves current score and number of turns in all_rolls vector   
    all_rolls(1, num_turns) = current_score;   
    all_rolls(2, num_turns) = num_turns; 
end  

fprintf("It took you %i turns to win the game!", num_turns);  

% plots total score over all turns with a line to show the winning score 
figure() 
plot(all_rolls(2,:), all_rolls(1,:), "-x"); 
yline(45); 
ylabel("Score"); 
xlabel("Turn Number"); 
xlim([1 num_turns]); 
ylim([0 50]);  

function score = roll_dice()  
    % function to simulate rolling two dice  
    % format of call: roll_dice()  
    % inputs: none  
    % outputs: score (sum of two dice)  
    
    % randomly generate dice values and print them out     
    die1 = randi(6);    
    die2 = randi(6);    
    fprintf("You rolled a %i and a %i.\n", die1, die2);     
    % return the sum of the dice    
    score = die1+die2; 
end