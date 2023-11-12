% Shelley Wei
% ENGR 130
% Homework 11
% Started 11/9/23
% Submitted 11/12/23
% Due 11/15/23

%% Question 1
clear; clc; close all;

numTickets = input("How many lottery tickets would you like to buy?\n");

winChance = numTickets / 99999 * 100; % calculate win percentage
fprintf("You have a %.3f%% chance of winning the lottery!\n", winChance);

ranTicketNum = buy(numTickets); % store numbers for all purchased tickets in vector

% ranTicketNum(1) = 10000; % sanity check

if (numTickets > 1)
    fprintf("Ticket Numbers:\n");
else
    fprintf("Ticket Number:\n");
end

for i = 1:numTickets
    fprintf("   %05i\n", ranTicketNum(i)); % data format %05i means to have leading zeros
end

winningNumber = win();
% winningNumber = 10000; % sanity check

zeroOrOne = winOrNot(numTickets, ranTicketNum, winningNumber);

if (zeroOrOne == 1)
    fprintf("\nYou won the lottery with Ticket #%5i!\n", winningNumber);
else
    fprintf("\nUnfortunately, you did not win the lottery. Try again next time!\n");
end

%% Question 2
clear; clc; close all;

playerMoney = 10;
fprintf("You currently have $%i. For each spin, you can either win or lose $2. Wager wisely...", playerMoney);

playAgainBool = 1; % 1 means play again, 2 means don't

% while-loop for continuous spins depending on player's balance or if player wants to quit
while playAgainBool == 1
    numberSpins = input("\nHow many times would you like to spin?\n");
    randLetters = spinSlot(numberSpins, playerMoney);
    playerMoney = printSpin(randLetters, playerMoney);
    playAgainBool = playAgain(playerMoney);
end

% return balance at the end of the game
if (playerMoney > 0)
    fprintf("Great decision-making! You ended with $%i.\n", playerMoney);
else
    fprintf("You ended with $%i. Bad luck or bad decision-making?\n", playerMoney);
end

%% Functions
%% Question 1
function randNum = buy(num)
    % Buys lottery ticket(s) that has randomly generated 5-digit number assigned to it/them
    % Call format: buy(numTicket)
    % Input
    %   numTicket: number of tickets bought
    % Output
    %   randNum: randomly generated 5-digit number associated with ticket
    
    randNum = randperm(100000, num) - 1; % randperm generates unique integer numbers so there will be no duplicate tickets

    % attempt at generating unique ticket numbers before knowing about randperm
    % digits = zeros(1, 5);
    % randNum = [];
    % 
    % for i = 1:num
    %     for j = 1:length(digits)
    %         digits(j) = randi(10) - 1;
    %     end
    % 
    %     temp = polyval(digits, 10); % creates a polynomial that sums the multiplication of each coefficient (digits) by 10 to decreasing powers
    % 
    %     check = 0;
    % 
    %     for k = 1:length(randNum)
    %         if (temp == randNum(k))
    %             % num = num + 1;
    %             check = 1;
    %             break;
    %         end
    %     end
    % 
    %     if (check == 0)
    %         randNum = [randNum, temp];
    %     end
    % end
    % % disp(randNum); % sanity check
end

function winNum = win()
    % Randomly generates the winning lottery number
    % Call format: win()
    % Input
    %   none
    % Output
    %   winNum: winning lottery number
    
    digits = zeros(1, 5); % create a vector of length five for each digit in the ticket number

    % for-loop for generating 5 integers from 0 to 9 for the winning ticket
    for i = 1:length(digits)
        digits(i) = randi(10) - 1; % generates random integer btwn 0 and 9 by setting the max to 10 so numbers are generated from 1 to 10, then shifting those numbers down 1 to generate integers btwn 0 and 9
    end

    winNum = polyval(digits, 10); % creates a polynomial that sums the multiplication of each coefficient (digits) by 10 to decreasing powers

    fprintf("\nWinning Ticket: %5i\n", winNum); % print the winning ticket number to the screen regardless of whether the player has the winning ticket or not
end

function yayOrNay = winOrNot(num, ticketNumbers, winNum)
    % Checks whether a player's lottery ticket is the winning ticket
    % Call format: winOrNot();
    % Input
    %   numTickets: number of tickets a player has
    %   ticketNumbers: the ticket numbers associated with the tickets
    %   winNum: winning ticket number
    % Output
    %   yayOrNay: acts a boolean that returns 1 if player has winning ticket, 0 if not
    
    % for-loop to check if any of the player's tickets match the winning ticket
    for i = 1:num
        if (ticketNumbers(i) == winNum)
            yayOrNay = 1;
            break;
        else
            yayOrNay = 0;
        end
    end
end

%% Question 2
function slotLetters = spinSlot(numSpins, money)
    % Generates letters A, B, or C corresponding to 1, 2, or 3 for each reek for each spin, as well as whether the player has enough money
    % for the number of spins they want
    % Call format: spinSlot(numSpins)
    % Input
    %   numSpins: number of slot spins
    % Output
    %   letters: letters generated for all spins
    
    if (money > 1) % first check if the player has enough money to spin as a safeguard (this check occurs in a later function as well)
        diffLetters = 3;
        slotLetters = zeros(numSpins, diffLetters); % create a matrix of all the spins
        letter = zeros(1, 3); % create an array that will reset every spin
    
        % for-loop for generating numbers that correspond to letters
        for i = 1:numSpins
            for j = 1:diffLetters % 3 numbers (letters) to generate
                letter(j) = randi(diffLetters); % anywhere between 1 and 3, the numbers corresponding to letters
            end
            slotLetters(i, :) = letter; % adding each spin to the overall matrix of spins
        end
        
        % check if the player has enough money for the number of spins they want
        if (money < numSpins*2)
            numSpins = money/2; % calculate the number of spins they can afford
            if (numSpins > 1)
                fprintf("\nYou only have enough money for %i spins.\n", numSpins);
            else
                fprintf("\nYou only have enough money for %i spin.\n", numSpins);
            end
        end
    end
end

function money = printSpin(spinLetters, money)
    % Prints the slots spun, money won or lost, and whether the player has
    % enough money to spin more
    % Call format: printSpin(spinLetters, money)
    % Inputs
    %   spinLetters: letters generated from spinSlot function
    %   money: player money before set of spins
    % Output
    %   money: player money after set of spins

    [row, col] = size(spinLetters); % get the number of rows and columns from the matrix of letters that need to be generated
    
    fprintf("\nHere are your spins: ");
    
    % for-loop for assigning letters to number values generated in previous function and also checking whether they got the winning combination
    for i = 1:row
        for j = 1:col
            % first letter
            if (j == 1)
                if (spinLetters(i, j) == 1)
                    fprintf("\n[A] ");
                elseif (spinLetters(i, j) == 2)
                    fprintf("\n[B] ");
                else
                    fprintf("\n[C] ");
                end
            % second letter
            elseif (j == 2)
                if (spinLetters(i, j) == 1)
                    fprintf("[A] ");
                elseif (spinLetters(i, j) == 2)
                    fprintf("[B] ");
                else
                    fprintf("[C] ");
                end
            % third letter
            else
                if (spinLetters(i, j) == 1)
                    fprintf("[A]\n");
                    
                    % since the last letter is A, check if the previous two letters are also A for the winning combination
                    if (spinLetters(i, j-1) == 1 && spinLetters(i, j-2) == 1)
                        money = money + 2;
                        fprintf("Winner Winner Chicken Dinner! You won $2!\n");
                    else
                        money = money - 2;
                        fprintf("You lost $2! Better luck next time...\n");
                    end
                elseif (spinLetters(i, j) == 2)
                    fprintf("[B]\n");

                    money = money - 2;
                    fprintf("You lost $2! Better luck next time...\n");
                else
                    fprintf("[C]\n");

                    money = money - 2;
                    fprintf("You lost $2! Better luck next time...\n");
                end

                fprintf("You have $%i left.\n", money); % print balance
            end
        end

        if (money == 0)
            fprintf("\nOh no, you have no money left! You are out of spins.\n");
            break; % break out of the for-loop so spins won't keep going and money won't keep being subtracted past $0
        end
    end
end

function playOrNay = playAgain(money)
    % Asks the player if they want to play again if they have enough money
    % Call format: playAgain(money)
    % Inputs
    %   money: player money
    % Outputs
    %   playOrNay: acts as a boolean for whether the player wants to play again or not

    % check if the player has at least $2 for at least another spin
    if (money > 1)
        playOrNay = input("\nWould you like more spins? Press 1 or 2 to proceed.\n 1. Yes    2. No\n");
    else
        playOrNay = 2; % set equal to 2 meaning that the player doesn't want to play again, end the game
    end
end