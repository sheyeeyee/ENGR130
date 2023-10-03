% Shelley Wei
% ENGR 130
% Lecture Preparation 6
% Started 9/30/23
% Finished 9/30/23
% Due 10/2/23

%% Techniques to Avoid Software Bugs
% algorithms
% comments
% "Reese's pieces"
% write readable code

%% Algorithm for finding a minimum in a list of numbers
% List of values is given
% 1. Set the first value as the minimum
% 2. Look at the next value in the list (current value)
% 3. Check if the current value is smaller than the minimum
% 4. If it is, then set that as the minimum value
% 5. Repeat steps 3 and 4 until there are no more values to check
% 6. Print the minimum value to the screen

%% Reese's Pieces Approach
myVector = [9 10 34 7 21 53]; % create a test vector (values should be given already but we don't have them)

myMin = myVector(1); % 1

for i = 2:length(myVector)
    if (myVector(i) < myMin)
        myMin = myVector(i);
    end
end

fprintf("The minimum value is %i.\n", myMin);