% Shelley Wei
% ENGR 130
% Lecture Preparation 2
% 9/1/23

%% INPUT AND OUTPUT IN MATLAB
%% Input
%% Input Method 1: Command Window
    % - Memory is shared by command window and script file so data can be
    % interchanged
%% Input Method 2: Input Command
    % input()
        % - Prompts user for input
        % - Can only take one value and assign to variable
            % Either numeric or text (requires more effort)
                % Numeric Input
                    % Three pieces of info needed
                        % Variable name
                        % input() command
                        % Prompt to user
                    % Example
                        ageEx = input('Enter the age of the birthday child.\n');
                            % \n means new line like Java, C++, etc.
                % Character Input
                    % Include 's' after prompt to indicate input is text
                    % Example
                        choice = input('Donut?\n','s');
                            % 's' short for "string of characters"
                            % Make sure the prompt is clear... what is this
                            % input() prompt asking for?
%% Practice 1
    % Write a script that asks the user for their first name and age. Assign
    % each value to a variable.
    firstName = input("What's your name?\n",'s');
    age = input('How old are you?\n');

%% Output
%% Output Method 1: No Semicolon
    gold = 72
    % Result will print in Command Window
%% Output Method 2: disp()
    % Displays value of variable (numbers of text)
    % Example
        gold2 = 72;
        element = 'Gold';
        disp(gold2); % stored numeric variable displayed
        disp(element); % stored text variable displayed
        disp('material'); % exact text displayed
%% Output Method 3: fprintf()
    % Most powerful option
        % Format: fprintf('text and formats', variables/values to insert)
    % Example
        % How can we output "My favorite element is __. Its atomic number
        % is __ and its atomic weight is __ AMUs." where we fill in the
        % blanks using values stored in variables?
        number = 10;
        element2 = 'neon';
        weight = 20.18;

        fprintf('My favorite element is %s. Its atomic number is %i and its atomic weight is %f AMUs.\n', element, number, weight)