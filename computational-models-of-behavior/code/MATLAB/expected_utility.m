% =========================================================================
% Expected Utility Theory (EUT) Implementation in MATLAB
% Description: Computes the expected utility of a set of outcomes given
% their associated probabilities and a utility function.
% =========================================================================

function EU = expected_utility(outcomes, probabilities, utility_function)
    % Computes the Expected Utility given a set of outcomes and probabilities.
    %
    % Parameters:
    %   - outcomes: Vector of possible outcomes.
    %   - probabilities: Vector of corresponding probabilities.
    %   - utility_function: Function handle for the utility function.
    %
    % Returns:
    %   - EU: Expected Utility value.

    % Validate input dimensions
    if length(outcomes) ~= length(probabilities)
        error('Outcomes and probabilities must have the same length.');
    end
    
    % Default utility function (identity) if not provided
    if nargin < 3
        utility_function = @(x) x; % Default: Linear utility function
    end
    
    % Compute Expected Utility
    EU = sum(probabilities .* arrayfun(utility_function, outcomes));
end

% =========================== Main Execution ===============================
if ~isdeployed  % Ensures it runs only in script mode, not as a deployed function
    % Define outcomes and probabilities
    outcomes = [100, 0];  % Winning $100 or nothing
    probabilities = [0.5, 0.5];  % 50% chance of each

    % Compute expected utility using a linear utility function (default)
    EU_default = expected_utility(outcomes, probabilities);
    fprintf('Expected Utility (Linear Utility): %.2f\n', EU_default);

    % Compute expected utility using a nonlinear utility function
    utility_function = @(x) sqrt(x); % Example: Risk-averse utility function
    EU_risk_averse = expected_utility(outcomes, probabilities, utility_function);
    fprintf('Expected Utility (Risk-Averse): %.2f\n', EU_risk_averse);
end
