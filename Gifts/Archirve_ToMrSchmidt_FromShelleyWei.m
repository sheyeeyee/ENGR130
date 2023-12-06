% Shelley Wei
% Christmas Gift for Mr. Schmidt
% Started 11/30/23
% Finished 12//23

clear; clc; close all;

fprintf("Welcome to the Phooshe (Phish and Goose) Translator!\nThis translator takes in a message and converts all f's into ph's and o's into oo's.\n");

example = "Why am I the only one in Mr. Schmidt's office hours?";
exampleConvert = oo(example);

fprintf("\nExample:\n   Input Message: %s\n   Translated Message: %s\n", example, exampleConvert);

% msg = input("What message would you like to translate into Phoose (Phish and Goose)?\n", "s");

%% Functions
function moosg = oo(message)
    % comment block
    
    charMsg = message{1}(1:end);
    
    for (i = 1:length(charMsg))
        if (charMsg(i) == 'o')
            charMsg = [charMsg(1:i), 'o', charMsg(i+1,end)];
        end
        moosg = charMsg;
    end
end

function phsg = ph(message)
end