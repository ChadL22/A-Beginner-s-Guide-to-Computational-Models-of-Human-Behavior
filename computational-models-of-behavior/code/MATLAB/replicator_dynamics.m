% =========================================================================
% Replicator Dynamics Implementation in MATLAB
% Description: Simulates Replicator Dynamics, a fundamental model from
% evolutionary game theory.
% =========================================================================

function x_history = replicator_dynamics(A, x_init, timesteps, dt)
    % Simulates replicator dynamics for a given payoff matrix.
    %
    % Parameters:
    %   - A: Payoff matrix (NxN).
    %   - x_init: Initial strategy proportions (Nx1 vector).
    %   - timesteps: Number of iterations (default: 100).
    %   - dt: Time step for numerical integration (default: 0.01).
    %
    % Returns:
    %   - x_history: History of strategy proportions over time.

    % Set default values if not provided
    if nargin < 3
        timesteps = 100;
    end
    if nargin < 4
        dt = 0.01;
    end

    x = x_init(:); % Ensure it's a column vector
    x_history = zeros(length(x), timesteps);
    x_history(:, 1) = x;

    % Run simulation
    for t = 2:timesteps
        f = A * x; % Compute fitness values
        avg_f = x' * f; % Compute average fitness
        x = x + dt * x .* (f - avg_f); % Replicator equation update
        x = max(x, 0); % Ensure no negative proportions
        x = x / sum(x); % Normalize proportions
        x_history(:, t) = x;
    end
end

% =========================== Main Execution ===============================
if ~isdeployed  % Ensures it runs only in script mode, not as a deployed function
    % Define Payoff Matrix (Example: Hawk-Dove Game)
    V = 2; % Resource value
    C = 3; % Cost of conflict
    A = [ (V-C)/2, V;  % Hawk vs Hawk, Hawk vs Dove
           0, V/2];     % Dove vs Hawk, Dove vs Dove

    % Define initial strategy proportions (Hawk-Dove population)
    x_init = [0.5; 0.5]; % 50% Hawks, 50% Doves

    % Run Replicator Dynamics simulation
    timesteps = 100;
    x_history = replicator_dynamics(A, x_init, timesteps);

    % Plot Results
    figure;
    plot(1:timesteps, x_history(1, :), 'r', 'LineWidth', 2);
    hold on;
    plot(1:timesteps, x_history(2, :), 'b', 'LineWidth', 2);
    xlabel('Time Steps');
    ylabel('Proportion of Population');
    legend('Hawks', 'Doves');
    title('Replicator Dynamics: Hawk-Dove Game');
    grid on;
end
