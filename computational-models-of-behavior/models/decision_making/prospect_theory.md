# Prospect Theory

## 📌 Overview
Prospect Theory, developed by **Daniel Kahneman and Amos Tversky**, describes how people make decisions involving **risk and uncertainty**, deviating from traditional **Expected Utility Theory (EUT)**. It accounts for:
- **Loss aversion**: Losses feel worse than equivalent gains.
- **Probability distortion**: Small probabilities are overweighted, and large probabilities are underweighted.

## 📖 Mathematical Equation
$$The value function \( V(x) \) is defined as:$$


$$V(x) =
\begin{cases}
x^\alpha & \text{if } x \geq 0 \\
-\lambda (-x)^\beta & \text{if } x < 0
\end{cases}$$

Where:
- $$ \( x \) = **Outcome (gain or loss)** $$
- $$ \( \alpha, \beta \) = **Sensitivity parameters** (typically \( 0 < \alpha, \beta < 1 \)), capturing diminishing sensitivity. $$
- $$ \( \lambda \) = **Loss aversion coefficient** (\( \lambda > 1 \)), meaning losses hurt more than gains. $$

## 🔍 Example: Loss Aversion in Action
A person must choose between:

1. **Gain Scenario**:  A **50% chance** to win **$100** or a **100% chance** to win **$40**.
2. **Loss Scenario**: A **50% chance** to lose **$100** or a **100% chance** to lose **$40**.

$$Using **Prospect Theory with \( \alpha = 0.88, \beta = 0.88, \lambda = 2.25 \)**:$$

- **Gain Case**:
  - **Option 1**: $$\( V(100) = (100)^{0.88} = 52.48 \), weighted by probability.$$
  - **Option 2**: $$\( V(40) = (40)^{0.88} = 27.54 \) (certain gain).$$
  - People often prefer **Option 2**, despite higher expected value in Option 1.$$

- **Loss Case**:
  - **Option 1**: $$\( V(-100) = -2.25 \times (100)^{0.88} = -118.08 \).$$
  - **Option 2**: $$\( V(-40) = -2.25 \times (40)^{0.88} = -62.01 \).$$
  - People often prefer **Option 1**, since **risk-seeking** behavior increases in the loss domain.

## 🔍 Probability Weighting
In Prospect Theory, probabilities are transformed using a **weighting function**:

$$w(p) = \frac{p^\gamma}{(p^\gamma + (1 - p)^\gamma)^{1/\gamma}}$$

Where:
- $$ \( w(p) \) = **Transformed probability**. $$
- $$ \( \gamma \) = **Probability distortion parameter** (typically \( 0.61 \)). $$

🔹 **Small probabilities (e.g., winning the lottery) are overweighted.**  
🔹 **Large probabilities (e.g., insuring a house) are underweighted.**

## 📚 Further Reading
- [Kahneman & Tversky (1979) Original Paper](https://www.jstor.org/stable/1833352)
- [Wikipedia: Prospect Theory](https://en.wikipedia.org/wiki/Prospect_theory)
- [Nobel Prize Lecture on Prospect Theory](https://www.nobelprize.org/uploads/2018/06/kahneman-lecture.pdf)
