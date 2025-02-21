import numpy as np

class QLearningAgent:
    def __init__(self, num_states, num_actions, alpha=0.1, gamma=0.9, epsilon=0.1):
        """
        Initializes a Q-learning agent.

        Parameters:
        - num_states: Number of states in the environment.
        - num_actions: Number of possible actions.
        - alpha: Learning rate (default: 0.1).
        - gamma: Discount factor (default: 0.9).
        - epsilon: Exploration rate (default: 0.1).
        """
        self.num_states = num_states
        self.num_actions = num_actions
        self.alpha = alpha
        self.gamma = gamma
        self.epsilon = epsilon
        self.Q_table = np.zeros((num_states, num_actions))

    def choose_action(self, state):
        """
        Chooses an action using an epsilon-greedy policy.

        Parameters:
        - state: Current state.

        Returns:
        - Selected action.
        """
        if np.random.rand() < self.epsilon:
            return np.random.choice(self.num_actions)  # Explore
        return np.argmax(self.Q_table[state])  # Exploit

    def update_q_value(self, state, action, reward, next_state):
        """
        Updates the Q-table using the Q-learning update rule.

        Parameters:
        - state: Current state.
        - action: Action taken.
        - reward: Reward received.
        - next_state: Resulting state.
        """
        best_next_action = np.argmax(self.Q_table[next_state])
        target = reward + self.gamma * self.Q_table[next_state, best_next_action]
        self.Q_table[state, action] += self.alpha * (target - self.Q_table[state, action])

# Example Usage
num_states = 5
num_actions = 2
agent = QLearningAgent(num_states, num_actions)

# Simulating one learning step
state, action, reward, next_state = 0, 1, 1, 3
agent.update_q_value(state, action, reward, next_state)

print("Updated Q-table:")
print(agent.Q_table)
