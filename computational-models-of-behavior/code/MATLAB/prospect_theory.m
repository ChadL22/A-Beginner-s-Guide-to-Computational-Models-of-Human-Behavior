% =========================================================================
% Prospect Theory Implementation in MATLAB
% Description: Computes the subjective value of outcomes under Prospect
% Theory, including probability weighting.
% =========================================================================

function V = prospect_theory_value(x, alpha, beta, lambda)
    % Computes the subjective value of an outcome under Prospect Theory.
    %
    % Parameters:
    %   - x: Outcome (positive for gains, negative for losses)
    %   - alpha: Sensitivity parameter for gains (default: 0.88)
    %   - beta: Sensitivity parameter for losses (default: 0.88)
    %   - lambda: Loss aversion coefficient (default: 2.25)
    %
    % Returns:
    %   - V: Subjective value of the outcome

    if nargin < 3
        alpha = 0.88;
        beta = 0.88;
        lambda = 2.25;
    end
    
    if x >= 0
        V = x^alpha;  % Gains
    else
        V = -lambda * (-x)^beta;  % Losses
    end
end

function w = probability_weighting(p, gamma)
    % Computes the probability weighting function under Prospect Theory.
    %
    % Parameters:
    %   - p: Probability (0 <= p <= 1)
    %   - gamma: Probability distortion parameter (default: 0.61)
    %
    % Returns:
    %   - w: Transformed probability

    if nargin < 2
        gamma = 0.61;
    end
    
    w = p^gamma / ((p^gamma + (1 - p)^gamma)^(1/gamma));
end

% =========================== Main Execution ===============================
if ~isdeployed  % Ensures it runs only in script mode, not as a deployed function
    % Define example outcomes (gain/loss)
    gain = 100;
    loss = -100;

    % Compute Prospect Theory value for gains and losses
    V_gain = prospect_theory_value(gain);
    V_loss = prospect_theory_value(loss);
    
    fprintf('Prospect Theory Value of Gain ($100): %.2f\n', V_gain);
    fprintf('Prospect Theory Value of Loss (-$100): %.2f\n', V_loss);

    % Example: Probability weighting function
    prob = 0.5; % 50% probability
    weighted_prob = probability_weighting(prob);
    
    fprintf('Weighted Probability of 50%%: %.2f\n', weighted_prob);
end
