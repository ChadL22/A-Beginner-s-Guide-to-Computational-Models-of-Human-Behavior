% =========================================================================
% Bayesian Updating Implementation in MATLAB
% Description: Computes the posterior probability using Bayes' Theorem.
% =========================================================================

function P_posterior = bayes_update(prior, likelihood, evidence_prob)
    % Computes the posterior probability using Bayes' Theorem.
    %
    % Parameters:
    %   - prior: P(H), prior probability of the hypothesis
    %   - likelihood: P(E|H), probability of evidence given hypothesis
    %   - evidence_prob: P(E), total probability of evidence
    %
    % Returns:
    %   - P_posterior: Updated probability of hypothesis given the evidence (P(H|E))

    P_posterior = (likelihood * prior) / evidence_prob;
end

% =========================== Main Execution ===============================
if ~isdeployed  % Ensures it runs only in script mode, not as a deployed function
    % Example: Medical Diagnosis
    % Disease X Prior Probability
    prior_H = 0.01;  % P(H), 1% of people have the disease
    
    % Likelihood of testing positive given the disease (Sensitivity)
    likelihood_E_given_H = 0.9;  % P(E|H), 90% of sick people test positive
    
    % False positive rate (1 - Specificity)
    false_positive_rate = 0.05;  % P(E|¬H), 5% of healthy people test positive
    
    % Complement: Probability of NOT having the disease
    prior_not_H = 1 - prior_H;  % P(¬H)
    
    % Compute total probability of testing positive (P(E))
    evidence_prob = (likelihood_E_given_H * prior_H) + (false_positive_rate * prior_not_H);
    
    % Compute P(H|E) - Probability of having disease given a positive test
    posterior_H_given_E = bayes_update(prior_H, likelihood_E_given_H, evidence_prob);
    
    % Display results
    fprintf('Prior Probability of Disease: %.4f\n', prior_H);
    fprintf('Probability of Testing Positive: %.4f\n', evidence_prob);
    fprintf('Posterior Probability of Having Disease Given Positive Test: %.4f\n', posterior_H_given_E);
end
