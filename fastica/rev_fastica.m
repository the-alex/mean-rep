function [comp_signals] = rev_fastica(MS)

epsilon = 0.000001;
sig_size = size(MS(1, :), 1); % length of signals
n = 2; % Number of signals

% Whiten the data
MS(1, :) = MS(1, :) - mean(MS(1, :));
MS(1, :) = MS(1, :) / std(MS(1, :));
MS(2, :) = MS(2, :) - mean(MS(2, :));
MS(2, :) = MS(2, :) / std(MS(2, :));


% Random weight matrix (and past version for iteration)
weights = randn(n, 1);
weights = weights/norm(weights,2);
last_weights = randn(n, 1);
last_weights = last_weights/norm(last_weights, 2);

G = @(x) 1 ./ (1 + exp(-x)); % sigmoid function
DG = @(x) exp(x) ./ ((exp(x) + 1) .^ 2); % d/dx sigmoid function

while abs(abs(last_weights'*weights)-1) > epsilon
    last_weights = weights;
    weights = MS*G(weights'*MS)'/sig_size - sum(DG(weights'*MS))*weights/sig_size; % SGD Update Step
    weights = weights/norm(weights, 2);
end

comp_signals = weights'*MS;
end