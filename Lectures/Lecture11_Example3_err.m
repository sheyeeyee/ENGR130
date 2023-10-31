%% Rock, Paper, Scissors
clear; close all; clc

%User input to start the loops
play_again = input("Want to play? Answer Y or N (in CAPS)\n",s); 

%Allows the game to be replayed based on user's choice
while play_again == "Y"
  
[wins, losses, draws] = game();

% resetting variable that replays the loop
play_again = input("Want to play again? Answer Y or N\n",s);

end 

%display when game ends
disp("Thanks for Playing!")
fprintf('You won %d time(s), lost %d time(s), and had %d draw(s)!\n',wins,losses,draws)

function [wins, loses, draws] = game()
%Plays rock, paper, scissors game between computer and user
%Inputs: none
%Outputs: number of wins, loses, and draws for all games played
%Format of call: [wins, loses, draws] = game()

%Creating computers play
options = ["ROCK","PAPER","SCISSORS"]; %creates options for the computer
index = 1; %picks a random integer index from 1 to 3 
computer_output = options(index); %uses index to choose from options

%Setting Up Score Counters
loses=0;
wins=0;
draws=0;

%Asking for response
your_play = input("ROCK, PAPER, or SCISSORS? (must type in all caps)\n",'s');
fprintf('The Computer Plays: %s\n ',computer_output)
pause(n)

if computer_output == your_play
    disp("DRAW!")
    pause(n)
    draws=draws+1;
elseif computer_output == "ROCK" && your_play~="PAPER"
    disp("You lose!")
    loses = loses+1;
    pause(n)
elseif computer_output=="SCISSORS" && your_play~="ROCK"
        disp ("You lose!")
        loses = loses+1;
        pause(n)
elseif computer_output=="PAPER" && your_play~="SCISSORS"
    disp("You lose!")
    loses = loses+1;
    pause(n)
else
    disp("You win!")
    wins = wins+1;
    pause(n)
end

end




