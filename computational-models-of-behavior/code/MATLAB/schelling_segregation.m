% =========================================================================
% Schelling’s Segregation Model Implementation in MATLAB
% Description: Simulates residential segregation dynamics based on agent
% movement in a 2D grid world.
% =========================================================================

classdef SchellingModel
    properties
        grid_size         % Size of the grid (NxN)
        grid              % Grid representing agent locations
        empty_ratio       % Fraction of empty spaces
        similarity_thresh % Minimum fraction of similar neighbors required
    end
    
    methods
        function obj = SchellingModel(grid_size, empty_ratio, similarity_thresh)
            % Constructor: Initializes the Schelling Segregation Model.
            %
            % Parameters:
            %   - grid_size: Grid size (N x N).
            %   - empty_ratio: Fraction of empty spaces.
            %   - similarity_thresh: Tolerance threshold for staying in place.
            
            obj.grid_size = grid_size;
            obj.empty_ratio = empty_ratio;
            obj.similarity_thresh = similarity_thresh;
            
            % Initialize the grid with two groups (1 and 2) and empty spaces (0)
            num_cells = grid_size^2;
            num_empty = floor(empty_ratio * num_cells);
            num_agents = num_cells - num_empty;
            
            % Assign agents and empty spots randomly
            agents = [ones(1, floor(num_agents / 2)), 2 * ones(1, ceil(num_agents / 2)), zeros(1, num_empty)];
            agents = agents(randperm(length(agents))); % Shuffle
            obj.grid = reshape(agents, grid_size, grid_size);
        end

        function similarity = count_similar_neighbors(obj, x, y)
            % Counts the fraction of similar neighbors for an agent.
            %
            % Parameters:
            %   - x, y: Coordinates of the agent.
            %
            % Returns:
            %   - similarity: Fraction of similar neighbors (0 to 1).
            
            agent_type = obj.grid(x, y);
            if agent_type == 0
                similarity = 1; % Empty cells are always "happy"
                return;
            end
            
            % Define neighborhood boundaries
            x_min = max(1, x - 1);
            x_max = min(obj.grid_size, x + 1);
            y_min = max(1, y - 1);
            y_max = min(obj.grid_size, y + 1);
            
            % Extract neighbors
            neighbors = obj.grid(x_min:x_max, y_min:y_max);
            neighbors = neighbors(neighbors > 0); % Remove empty spots
            
            % Compute similarity ratio
            num_similar = sum(neighbors == agent_type);
            total_neighbors = length(neighbors);
            similarity = num_similar / total_neighbors;
        end

        function obj = step(obj)
            % Executes one time step where unhappy agents move to empty spaces.

            [empty_x, empty_y] = find(obj.grid == 0); % Empty locations
            empty_indices = randperm(length(empty_x)); % Shuffle empty spots
            
            for x = 1:obj.grid_size
                for y = 1:obj.grid_size
                    if obj.grid(x, y) ~= 0 % If an agent exists
                        similarity = obj.count_similar_neighbors(x, y);
                        if similarity < obj.similarity_thresh
                            % Move to a random empty space
                            if ~isempty(empty_indices)
                                new_idx = empty_indices(1);
                                obj.grid(empty_x(new_idx), empty_y(new_idx)) = obj.grid(x, y);
                                obj.grid(x, y) = 0;
                                empty_indices(1) = []; % Remove used empty spot
                            end
                        end
                    end
                end
            end
        end

        function obj = run(obj, steps)
            % Runs the model for a given number of steps.
            %
            % Parameters:
            %   - steps: Number of iterations.
            
            for i = 1:steps
                obj = obj.step();
            end
        end

        function plot_grid(obj)
            % Displays the current grid state.
            
            imagesc(obj.grid);
            colormap([1 1 1; 1 0 0; 0 0 1]); % White for empty, Red for type 1, Blue for type 2
            axis equal;
            axis off;
            title('Schelling Segregation Model');
            drawnow;
        end
    end
end

% =========================== Main Execution ===============================
if ~isdeployed  % Ensures it runs only in script mode, not as a deployed function
    % Define model parameters
    grid_size = 20;          % 20x20 grid
    empty_ratio = 0.2;       % 20% empty spaces
    similarity_thresh = 0.3; % 30% similarity threshold
    
    % Create the Schelling Model
    model = SchellingModel(grid_size, empty_ratio, similarity_thresh);
    
    % Run the model for 10 steps
    model = model.run(10);
    
    % Display final segregation pattern
    model.plot_grid();
end
