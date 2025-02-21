# Schelling’s Segregation Model

## 📌 Overview
**Schelling’s Segregation Model** (Thomas C. Schelling, 1971) demonstrates how small individual biases in residential preferences can lead to large-scale **racial, economic, or social segregation** in communities. The model shows that even **mild preferences** for neighbors of the same type can result in **highly segregated neighborhoods**.

## 📖 Mathematical Representation
The model represents a city as a **grid of agents** where each agent has a **tolerance threshold** $$\( T \)$$, which determines whether they are **happy** or **unhappy** based on their neighbors.

Each agent follows this rule:
- If the fraction of similar neighbors is **\( \geq T \)**, the agent **stays**.
- If the fraction of similar neighbors is **\( < T \)**, the agent **moves** to a random empty space.

Formally:

$$S(x) = \frac{N_s}{N}$$

Where:
- $$\( S(x) \)$$ = **Similarity ratio** (fraction of neighbors who are the same type as agent $$\( x \))$$.
- $$\( N_s \)$$ = **Number of similar neighbors**.
- $$\( N \)$$ = **Total number of neighbors** (typically 8 in a Moore neighborhood).
- $$\( T \)$$ = **Tolerance threshold** (e.g., $$\( T = 0.3 \)$$ means an agent is unhappy if fewer than 30% of its neighbors are similar).

### **Key Insights**
- Even if agents are **only slightly biased**, **segregation still emerges** over time.
- The model helps explain **real-world urban segregation patterns**.

## 🔍 Example: A City Grid
Imagine a **10×10 grid** where:
- **Red agents** prefer at least **30% similar neighbors**.
- **Blue agents** prefer at least **30% similar neighbors**.
- If unhappy, agents move to a **random empty location**.

After many iterations, the city becomes **highly segregated**, even if agents were initially well-mixed.

## 📚 Further Reading
- [Schelling’s Original Paper (1971)](https://www.jstor.org/stable/1823701)
- [Wikipedia: Schelling Segregation Model](https://en.wikipedia.org/wiki/Schelling%27s_model_of_segregation)
- [Agent-Based Modeling of Segregation](https://mitpress.mit.edu/books/growing-artificial-societies)
