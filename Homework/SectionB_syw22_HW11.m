% Shelley Wei
% ENGR 130
% Homework 10
% Started 11/9/23
% Submitted 11//23
% Due 11/15/23

%% Question 1
clear; clc; close all;

numTickets = input("How many lottery tickets would you like to buy?\n");
ranTicketNum = buy(numTickets); % store numbers for all purchased tickets in vector

% ranTicketNum(1) = 10000; % sanity check

if (numTickets > 1)
    fprintf("Ticket Numbers:\n");
else
    fprintf("Ticket Number:\n");
end

for i = 1:numTickets
    fprintf("   %05i\n", ranTicketNum(i)); % data format %05 means to have zeros in front of digits after the thousands, hundreds, tens, so on
end

winningNumber = win();
% winningNumber = 10000; % sanity check

zeroOrOne = winOrNot(numTickets, ranTicketNum, winningNumber);

if (zeroOrOne == 1)
    fprintf("\nYou won the lottery with Ticket #%05i!\n", winningNumber);
else
    fprintf("Unfortunately, you did not win the lottery. Try again next time!\n");
end

%% Question 2
clear; clc; close all;

playerMoney = 10;

randLetters = spinSlot(7, playerMoney);
printSpin(randLetters, playerMoney);

%% Functions
% Question 1
function randNum = buy(num)
    % Buys lottery ticket(s) that has randomly generated 5-digit number assigned to it/them
    % Call format: buy(numTicket)
    % Input
    %   numTicket: number of tickets bought
    % Output
    %   randNum: randomly generated 5-digit number associated with ticket
    
    digits = zeros(1, 5);
    randNum = [];
    
    for i = 1:num
        for j = 1:length(digits)
            digits(j) = randi(10) - 1;
        end
        
        temp = polyval(digits, 10); % creates a polynomial that sums the multiplication of each coefficient (digits) by 10 to decreasing powers

        check = 0;

        for k = 1:length(randNum)
            if (temp == randNum(k))
                % num = num + 1;
                check = 1;
                break;
            end
        end

        if (check == 0)
            randNum = [randNum, temp];
        end
    end
    % disp(randNum); % sanity check
end

function winNum = win()
    % Randomly generates the winning lottery number
    % Call format: win()
    % Input
    %   none
    % Output
    %   winNum: winning lottery number
    
    digits = zeros(1, 5);

    for i = 1:length(digits)
        digits(i) = randi(10) - 1;
    end

    winNum = polyval(digits, 10); % creates a polynomial that sums the multiplication of each coefficient (digits) by 10 to decreasing powers
end

function yayOrNay = winOrNot(num, ticketNumbers, winNum)
    % Checks whether a player's lottery ticket is the winning ticket
    % Call format: winOrNot();
    % Input
    %   numTickets: number of tickets a player has
    %   ticketNumbers: the ticket numbers associated with the tickets
    %   winNum: winning ticket number
    % Output
    %   yayOrNay: returns 1 if player has winning ticket, 0 if not
    
    for i = 1:num
        if (ticketNumbers(i) == winNum)
            yayOrNay = 1;
            break;
        else
            yayOrNay = 0;
        end
    end
end

% Question 2
function slotLetters = spinSlot(numSpins, money)
    % Generates letters A, B, or C corresponding to 1, 2, or 3 for each reek for each spin
    % Call format: spinSlot(numSpins)
    % Input
    %   numSpins: number of slot spins
    % Output
    %   letters: letters generated for all spins
    
    if (money > 1)
        slotLetters = zeros(1, 3);
    
        for i = 1:numSpins
            for j = 1:3
                letter(j) = randi(3);
            end
            slotLetters(i, :) = letter;
        end
    end
end

function printSpin(spinLetters, money)
% comment block
    [row, col] = size(spinLetters);
    
    fprintf("Here are your spins: ");
    
    for i = 1:row
        for j = 1:col
            if (mod(j, 3) == 1)
                if (spinLetters(i, j) == 1)
                    fprintf("\nA ");
                elseif (spinLetters(i, j) == 2)
                    fprintf("\nB ");
                else
                    fprintf("\nC ");
                end
            else
                if (spinLetters(i, j) == 1)
                    fprintf("A ");
                elseif (spinLetters(i, j) == 2)
                    fprintf("B ");
                else
                    fprintf("C ");
                end
            end
            
            if (mod(j, 3) == 0)
                if (j == 1 && spinLetters(i, j) == 1 && spinLetters(i, j+1) == 1 && spinLetters(i, j+2) == 1)
                    money = money + 2;
                    fprintf("\nYou won $2!\n");
                    break;
                else
                    money = money - 2;
                    fprintf("\nYou lost $2!\n");
                end
                fprintf("You now have $%i left.\n", money);
            end
        end
        if (money == 0)
            fprintf("You have no money left!\n");
            break;
        end
    end
end