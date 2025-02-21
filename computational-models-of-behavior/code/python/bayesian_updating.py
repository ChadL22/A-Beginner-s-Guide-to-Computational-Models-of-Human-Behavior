def bayes_update(prior, likelihood, evidence_prob):
    """
    Computes the posterior probability using Bayes' Theorem.

    Parameters:
    - prior: P(H), prior probability of hypothesis
    - likelihood: P(E|H), probability of evidence given hypothesis
    - evidence_prob: P(E), total probability of evidence

    Returns:
    - Posterior probability P(H|E)
    """
    return (likelihood * prior) / evidence_prob

# Example use case: Medical Diagnosis
prior_H = 0.01  # Prior probability of disease
likelihood_E_given_H = 0.9  # Sensitivity (P(E|H))
false_positive_rate = 0.05  # P(E|¬H)
prior_not_H = 1 - prior_H  # P(¬H)

# Total probability of positive test P(E)
evidence_prob = (likelihood_E_given_H * prior_H) + (false_positive_rate * prior_not_H)

# Compute P(H|E)
posterior_H_given_E = bayes_update(prior_H, likelihood_E_given_H, evidence_prob)

print("Posterior Probability of Having Disease X Given a Positive Test:", round(posterior_H_given_E, 4))
