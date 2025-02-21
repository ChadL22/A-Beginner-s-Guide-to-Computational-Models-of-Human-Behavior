import numpy as np
import matplotlib.pyplot as plt
import random

class SchellingModel:
    def __init__(self, size=10, empty_ratio=0.2, similarity_threshold=0.3):
        """
        Initializes the Schelling Segregation Model.

        Parameters:
        - size: Grid size (size x size).
        - empty_ratio: Fraction of empty spaces.
        - similarity_threshold: Minimum fraction of similar neighbors needed for happiness.
        """
        self.size = size
        self.similarity_threshold = similarity_threshold

        # Create grid with two groups (1 and 2), leaving some empty spots (0)
        num_cells = size * size
        num_empty = int(empty_ratio * num_cells)
        num_agents = num_cells - num_empty

        # Randomly assign agents to the grid
        agents = [1] * (num_agents // 2) + [2] * (num_agents // 2) + [0] * num_empty
        np.random.shuffle(agents)
        self.grid = np.array(agents).reshape(size, size)

    def count_similar_neighbors(self, x, y):
        """
        Counts the fraction of similar neighbors for an agent.

        Parameters:
        - x, y: Coordinates of the agent.

        Returns:
        - Similarity ratio (0 to 1).
        """
        agent_type = self.grid[x, y]
        if agent_type == 0:
            return 1  # Empty cells are always "happy"

        neighbors = [
            self.grid[i, j]
            for i in range(max(0, x - 1), min(self.size, x + 2))
            for j in range(max(0, y - 1), min(self.size, y + 2))
            if (i, j) != (x, y)
        ]

        num_similar = sum(1 for n in neighbors if n == agent_type)
        total_neighbors = len(neighbors)

        return num_similar / total_neighbors if total_neighbors > 0 else 1

    def step(self):
        """
        Executes one time step where unhappy agents move to empty spaces.
        """
        empty_spaces = list(zip(*np.where(self.grid == 0)))
        np.random.shuffle(empty_spaces)

        for x in range(self.size):
            for y in range(self.size):
                if self.grid[x, y] != 0 and self.count_similar_neighbors(x, y) < self.similarity_threshold:
                    if empty_spaces:
                        new_x, new_y = empty_spaces.pop()
                        self.grid[new_x, new_y] = self.grid[x, y]
                        self.grid[x, y] = 0

    def run(self, steps=10):
        """
        Runs the model for a given number of steps.

        Parameters:
        - steps: Number of iterations.
        """
        for _ in range(steps):
            self.step()

    def plot(self):
        """
        Displays the current grid state.
        """
        plt.imshow(self.grid, cmap="coolwarm", interpolation="nearest")
        plt.title("Schelling Segregation Model")
        plt.show()

# Run the model
model = SchellingModel(size=20, similarity_threshold=0.3)
model.run(steps=10)
model.plot()
