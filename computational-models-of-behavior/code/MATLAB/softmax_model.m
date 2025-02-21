% =========================================================================
% Softmax Decision Model Implementation in MATLAB
% Description: Computes Softmax probabilities for a set of Q-values, modeling
% probabilistic choice behavior in reinforcement learning and decision-making.
% =========================================================================

function P = softmax(Q_values, beta)
    % Computes the Softmax probabilities for a set of Q-values.
    %
    % Parameters:
    %   - Q_values: Vector of action values (expected rewards)
    %   - beta: Temperature parameter (default: 1.0)
    %
    % Returns:
    %   - P: Softmax probabilities for each action

    if nargin < 2
        beta = 1.0; % Default temperature
    end
    
    % Compute exponentiated values (subtract max for numerical stability)
    exp_values = exp(beta * (Q_values - max(Q_values)));
    
    % Normalize to get probabilities
    P = exp_values / sum(exp_values);
end

% =========================== Main Execution ===============================
if ~isdeployed  % Ensures it runs only in script mode, not as a deployed function
    % Define Q-values (e.g., expected rewards for different actions)
    Q_values = [5, 8, 7];  % Example: Q-values for Pizza, Burgers, Sushi
    
    % Compute Softmax probabilities with default beta = 1.0
    probabilities = softmax(Q_values);
    
    % Display results
    fprintf('Softmax Probabilities:\n');
    for i = 1:length(Q_values)
        fprintf('Q-value: %.2f -> Probability: %.4f\n', Q_values(i), probabilities(i));
    end
end
