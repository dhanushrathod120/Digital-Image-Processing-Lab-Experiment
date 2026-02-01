% Name : Nenavath Dhanush Rathod
% BT23ECE120

% Arithmetic Encoding
clear all;
close all;
clc;

% Input message and probabilities

symbols = ['A','B','C','D','E'];
prob = [0.3 0.4 0.05 0.05 0.2];
message = 'DABEDCA';

% Compute cumulative probability

cum_prob = [0 cumsum(prob)];
low = 0;
high = 1;

% Arithmetic Encoding Process

for i = 1:length(message)
    % Find symbol index
    idx = find(symbols == message(i));
    range = high - low;
    high = low + range * cum_prob(idx+1);
    low  = low + range * cum_prob(idx);
    fprintf('After symbol %c : Low = %.6f , High = %.6f\n', ...
            message(i), low, high);
end

% Final encoded value (any value in [low, high])

encoded_value = (low + high) / 2;
fprintf('\nArithmetic Encoded Value = %.6f\n', encoded_value);
