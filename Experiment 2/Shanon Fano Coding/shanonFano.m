% Name :Nenavath Dhanush Rathod
% BT23ECE120

% Shannon-Fano Coding
clear all;
close all;
clc;
% Symbols and probabilities
symbols = {'A','B','C','D','E'};
prob = [0.4 0.2 0.2 0.1 0.1];

% Sort probabilities in descending order
[prob, idx] = sort(prob, 'descend');
symbols = symbols(idx);

% Initialize codes
codes = strings(1, length(symbols));

% Shannon-Fano recursive function
function codes = shannon_fano(prob, symbols, prefix, codes)
    if length(prob) == 1
        codes(strcmp(symbols{1}, symbols)) = prefix;
        return;
    end
    
    total = sum(prob);
    acc = 0;
    split = 0;
    
    for i = 1:length(prob)
        acc = acc + prob(i);
        if acc >= total/2
            split = i;
            break;
        end
    end
    
    codes = shannon_fano(prob(1:split), symbols(1:split), strcat(prefix,"0"), codes);
    codes = shannon_fano(prob(split+1:end), symbols(split+1:end), strcat(prefix,"1"), codes);
end

% Generate codes
codes = shannon_fano(prob, symbols, "", codes);

% Display result
disp('Symbol    Probability    Code');
for i = 1:length(symbols)
    fprintf('%s          %.2f          %s\n', symbols{i}, prob(i), codes(i));
end
