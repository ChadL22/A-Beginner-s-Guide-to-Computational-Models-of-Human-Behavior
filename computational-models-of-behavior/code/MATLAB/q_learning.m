% =========================================================================
% Q-Learning Implementation in MATLAB
% Description: Implements a simple Q-learning agent with an epsilon-greedy
% policy for reinforcement learning.
% =========================================================================

classdef QLearningAgent
    properties
        Q_table      % Q-values table
        alpha        % Learning rate
        gamma        % Discount factor
        epsilon      % Exploration rate
        num_states   % Number of states
        num_actions  % Number of actions
    end
    
    methods
        function obj = QLearningAgent(num_states, num_actions, alpha, gamma, epsilon)
            % Constructor: Initializes the Q-learning agent.
            %
            % Parameters:
            %   - num_states: Number of states in the environment.
            %   - num_actions: Number of possible actions.
            %   - alpha: Learning rate (default: 0.1).
            %   - gamma: Discount factor (default: 0.9).
            %   - epsilon: Exploration rate (default: 0.1).

            obj.num_states = num_states;
            obj.num_actions = num_actions;
            obj.alpha = alpha;
            obj.gamma = gamma;
            obj.epsilon = epsilon;
            obj.Q_table = zeros(num_states, num_actions); % Initialize Q-table
        end

        function action = choose_action(obj, state)
            % Selects an action using the epsilon-greedy policy.
            %
            % Parameters:
            %   - state: Current state.
            %
            % Returns:
            %   - action: Selected action.
            
            if rand < obj.epsilon
                action = randi(obj.num_actions); % Explore (random action)
            else
                [~, action] = max(obj.Q_table(state, :)); % Exploit (greedy action)
            end
        end

        function obj = update_q_value(obj, state, action, reward, next_state)
            % Updates the Q-table using the Q-learning update rule.
            %
            % Parameters:
            %   - state: Current state.
            %   - action: Action taken.
            %   - reward: Reward received.
            %   - next_state: Resulting state.

            % Find best future Q-value
            best_next_action = max(obj.Q_table(next_state, :));
            
            % Compute Q-value update
            obj.Q_table(state, action) = obj.Q_table(state, action) + ...
                obj.alpha * (reward + obj.gamma * best_next_action - obj.Q_table(state, action));
        end
    end
end

% =========================== Main Execution ===============================
if ~isdeployed  % Ensures it runs only in script mode, not as a deployed function
    % Define the number of states and actions
    num_states = 5;
    num_actions = 2;

    % Create a Q-learning agent
    agent = QLearningAgent(num_states, num_actions, 0.1, 0.9, 0.1);

    % Example update: Simulating one learning step
    state = 1; 
    action = 2;
    reward = 1;
    next_state = 3;

    % Update Q-table
    agent = agent.update_q_value(state, action, reward, next_state);

    % Display updated Q-table
    fprintf('Updated Q-table:\n');
    disp(agent.Q_table);
end
