def expected_utility(outcomes, probabilities, utility_function=lambda x: x):
    """
    Computes the Expected Utility for a set of outcomes.

    Parameters:
    - outcomes: List of possible outcomes.
    - probabilities: Corresponding probabilities.
    - utility_function: Utility function applied to outcomes (default: identity function).

    Returns:
    - Expected utility value.
    """
    return sum(p * utility_function(x) for x, p in zip(outcomes, probabilities))

# Example
outcomes = [100, 0]  # Winning $100 or nothing
probabilities = [0.5, 0.5]  # 50% chance of each
print("Expected Utility:", expected_utility(outcomes, probabilities))
