# Softmax Decision Model

## 📌 Overview
The **Softmax Decision Model** is widely used in **reinforcement learning, behavioral economics, and decision neuroscience** to model **probabilistic choice behavior**. Unlike **Expected Utility Theory (EUT)**, where agents always choose the highest-value option, the Softmax model allows for **stochastic (noisy) decision-making**.

This model is commonly used to:
- Simulate **bounded rationality** in decision-making.
- Model **human choices in economic games**.
- Optimize **reinforcement learning policies**.

## 📖 Mathematical Equation
The probability of selecting action $$\( a_i \)$$ from a set of possible actions is given by:

$$P(a_i) = \frac{e^{\beta Q(a_i)}}{\sum_{j} e^{\beta Q(a_j)}}$$

Where:
- $$\( P(a_i) \)$$ = **Probability of choosing action $$\( a_i \)$$**.
- $$\( Q(a_i) \)$$ = **Expected value (reward estimate) of action $$\( a_i \)$$**.
- $$\( \beta \)$$ = **Inverse temperature parameter** (*higher values lead to more deterministic choices*).

## 🔍 Effect of $$\( \beta \)$$ (Temperature Parameter)
- **$$\( \beta \to 0 \)$$ (Random Choice)**: All actions are equally likely (high exploration).
- **$$\( \beta \to \infty \)$$ (Greedy Choice)**: The action with the highest $$\( Q(a) \)$$ is always selected (no exploration).

## 🔍 Example: Choosing a Restaurant
A person chooses between:
- **Pizza ($Q = 5$)**
- **Burgers ($Q = 8$)**
- **Sushi ($Q = 7$)**

With $$**\( \beta = 1 \)**$$, the probability of choosing each option is:

$$P(\text{Pizza}) = \frac{e^{1 \times 5}}{e^5 + e^8 + e^7} \approx 0.0024$$

$$P(\text{Burgers}) = \frac{e^{1 \times 8}}{e^5 + e^8 + e^7} \approx 0.88$$

$$P(\text{Sushi}) = \frac{e^{1 \times 7}}{e^5 + e^8 + e^7} \approx 0.12$$

This means the person will **most likely** choose **Burgers**, but still has a small probability of selecting Sushi or Pizza.

## 📚 Further Reading
- [Softmax Function – Wikipedia](https://en.wikipedia.org/wiki/Softmax_function)
- [The softmax function: Properties, motivation, and interpretation* (Franke & Degen)](chrome-extension://efaidnbmnnnibpcajpcglclefindmkaj/https://alpslab.stanford.edu/papers/FrankeDegen_submitted.pdf)
- [Parameter Estimation in Softmax Decision-Making Models With Linear Objective Functions(Reverdy & Leonard)](https://arxiv.org/abs/1502.04635)
