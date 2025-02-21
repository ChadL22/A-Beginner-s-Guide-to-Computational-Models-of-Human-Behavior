import numpy as np

def prospect_theory_value(x, alpha=0.88, beta=0.88, lambda_=2.25):
    """
    Computes the subjective value of a gain or loss under Prospect Theory.
    
    Parameters:
    - x: Outcome (positive for gains, negative for losses)
    - alpha: Sensitivity parameter for gains (default: 0.88)
    - beta: Sensitivity parameter for losses (default: 0.88)
    - lambda_: Loss aversion coefficient (default: 2.25)

    Returns:
    - Subjective value of the outcome
    """
    if x >= 0:
        return x ** alpha  # Gains
    else:
        return -lambda_ * (-x) ** beta  # Losses

def probability_weighting(p, gamma=0.61):
    """
    Computes the probability weighting function.

    Parameters:
    - p: Probability (0 <= p <= 1)
    - gamma: Probability distortion parameter (default: 0.61)

    Returns:
    - Transformed probability
    """
    return p ** gamma / (p ** gamma + (1 - p) ** gamma) ** (1 / gamma)

# Example use case:
gain = 100
loss = -100

print("Prospect Theory Value of Gain ($100):", prospect_theory_value(gain))
print("Prospect Theory Value of Loss ($100):", prospect_theory_value(loss))
print("Transformed Probability of Winning 50%:", probability_weighting(0.5))
