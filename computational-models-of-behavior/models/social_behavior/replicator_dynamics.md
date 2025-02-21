# Replicator Dynamics (Evolutionary Game Theory)

## 📌 Overview
**Replicator Dynamics** is a mathematical model from **evolutionary game theory** that describes how the proportion of strategies in a population changes over time based on their relative fitness. 

It is used to model:
- **Cultural evolution** (how behaviors spread in societies).
- **Biological evolution** (how genes or species compete).
- **Economic competition** (how successful strategies dominate markets).

## 📖 Mathematical Equation
The **Replicator Equation** describes the growth of a strategy’s proportion $$\( x_i \)$$ in a population:

$$\dot{x}_i = x_i (f_i - \bar{f})$$

Where:
- $$\( x_i \)$$ = **Proportion of individuals using strategy $$\( i \)$$**.
- $$\( f_i \)$$ = **Fitness of strategy \( i \)**.
- $$\( \bar{f} \)$$ = **Average fitness of the population**.

The **average fitness** is given by:

$$\bar{f} = \sum_{j} x_j f_j$$

If $$\( f_i > \bar{f} \)$$, then strategy $$\( i \)$$ increases in the population. If $$\( f_i < \bar{f} \)$$, it decreases.

### **Payoff Matrix Representation**
Fitness can be determined using a **payoff matrix** $$\( A \)$$:

$$f_i = \sum_{j} A_{ij} x_j$$

Where:
- $$\( A_{ij} \)$$ = **Payoff when strategy $$\( i \)$$ interacts with strategy $$\( j \)$$**.

## 🔍 Example: Hawk-Dove Game
Consider a **Hawk-Dove game** where:
- **Hawks** fight for resources (aggressive).
- **Doves** share resources peacefully.

Payoff matrix:

|      | Hawk  | Dove  |
|------|------|------|
| **Hawk** | $$\( (V-C)/2 \)$$ | $$\( V \)$$ |
| **Dove** | $$\( 0 \)$$ | $$\( V/2 \)$$ |

Where:
- $$\( V \)$$ = Value of the resource.
- $$\( C \)$$ = Cost of conflict.

Using **Replicator Dynamics**, we can simulate how the proportion of Hawks and Doves changes over time.

## 📚 Further Reading
- [Evolutionary Game Theory – Stanford Encyclopedia](https://plato.stanford.edu/entries/game-evolutionary/)
- [Mathematical Biology by J.D. Murray](https://www.springer.com/gp/book/9780387952239)
- [Replicator Dynamics – Wikipedia](https://en.wikipedia.org/wiki/Replicator_equation)
