# Bayesian Updating

## 📌 Overview
**Bayesian Updating** is a fundamental concept in **cognitive science, machine learning, and decision theory**, used to update beliefs based on new evidence. It follows **Bayes' Theorem**, which describes how to revise probabilities in light of new data.

Bayesian Updating is used for:
- **Statistical inference** (e.g., updating beliefs in medical diagnoses).
- **Machine learning models** (e.g., Naïve Bayes classifiers).
- **Human cognition modeling** (e.g., how people revise their beliefs when presented with new evidence).

## 📖 Mathematical Equation
The formula for **Bayes' Theorem** is:

$$P(H|E) = \frac{P(E|H) P(H)}{P(E)}$$

Where:
- $$\( P(H|E) \)$$ = **Posterior probability** (belief after seeing evidence $$\( E \))$$.
- $$\( P(E|H) \)$$ = **Likelihood** (probability of evidence given hypothesis $$\( H \))$$.
- $$\( P(H) \)$$ = **Prior probability** (initial belief before seeing evidence).
- $$\( P(E) \)$$ = **Marginal probability** (total probability of evidence occurring).

Since $$\( P(E) \)$$ is constant for all hypotheses, Bayes' Theorem can be rewritten as:

$$P(H|E) \propto P(E|H) P(H)$$

This means the **posterior** is proportional to the **likelihood** times the **prior**.

## 🔍 Example: Medical Diagnosis
A doctor wants to determine whether a patient has **Disease X** given a **positive test result**.

- Prior probability of **Disease X**: $$\( P(H) = 0.01 \)$$ (1% of people have it).
- Test sensitivity: $$\( P(E|H) = 0.9 \)$$ (90% of sick people test positive).
- False positive rate: $$\( P(E|\neg H) = 0.05 \)$$ (5% of healthy people test positive).
- Total probability of a positive test:

$$P(E) = P(E|H)P(H) + P(E|\neg H)P(\neg H)$$

$$= (0.9 \times 0.01) + (0.05 \times 0.99) = 0.0585$$

Using Bayes' Theorem:

$$P(H|E) = \frac{(0.9 \times 0.01)}{0.0585} = 0.154$$

This means that even with a **positive test**, the probability of actually having **Disease X** is only **15.4%**, demonstrating the importance of **prior knowledge**.

## 📚 Further Reading
- [Wikipedia: Bayesian Inference](https://en.wikipedia.org/wiki/Bayesian_inference)
- [Bayesian Updating with Discrete Priors](https://ocw.mit.edu/courses/18-05-introduction-to-probability-and-statistics-spring-2022/mit18_05_s22_class11-prep.pdf)
- [Bayesian Models of Cognition](https://cocosci.princeton.edu/tom/papers/bayeschapter.pdf)
