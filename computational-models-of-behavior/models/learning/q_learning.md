# Q-Learning (Reinforcement Learning)

## 📌 Overview
**Q-Learning** is a model-free **reinforcement learning (RL)** algorithm that allows an agent to learn optimal actions by interacting with its environment. It is widely used in:
- **Artificial intelligence** (e.g., game playing, robotics).
- **Human learning models** (e.g., decision-making strategies).
- **Autonomous systems** (e.g., self-driving cars, financial trading).

## 📖 Mathematical Equation
The Q-Learning update rule is:

$$Q(s, a) \leftarrow Q(s, a) + \alpha \left[ r + \gamma \max_{a'} Q(s', a') - Q(s, a) \right]$$

Where:
- $$\( Q(s, a) \)$$ = Expected reward for taking action $$\( a \)$$ in state $$\( s \)$$.
- $$\( \alpha \)$$ = Learning rate (controls how much new information overrides old knowledge).
- $$\( r \)$$ = Reward received after taking action $$\( a \)$$.
- $$\( \gamma \)$$ = Discount factor (balances immediate vs. future rewards).
- $$\( \max_{a'} Q(s', a') \)$$ = Maximum estimated future reward for next state $$\( s' \)$$.

## 🔍 Example: Robot Learning to Navigate a Grid
A robot moves in a **grid world** where:
- **States $$(\( s \))$$** are different grid locations.
- **Actions $$(\( a \))$$** include moving **up, down, left, right**.
- **Rewards $$(\( r \))$$** are +1 for reaching the goal, -1 for hitting a wall, and 0 otherwise.

Using **Q-learning**, the robot updates its table of $$\( Q(s, a) \)$$ values based on its experiences until it learns the best policy.

## 📚 Further Reading
- [Reinforcement Learning: An Introduction (Sutton & Barto)](http://incompleteideas.net/book/the-book-2nd.html)
- [Q-Learning Explained (DeepMind Blog)](https://deepmind.com/learning-resources/reinforcement-learning/)
- [Q-Learning in AI](https://towardsdatascience.com/q-learning-explained-7e3f553c75a3)
