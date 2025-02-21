# Bass Diffusion Model (Technology Adoption & Behavior Spread)

## 📌 Overview
The **Bass Diffusion Model** (1969) is a mathematical model that describes **how new products, technologies, or behaviors spread through a population over time**. It is widely used in:
- **Marketing & Business Strategy** (e.g., predicting product sales).
- **Epidemiology** (e.g., modeling the spread of social trends).
- **Sociology & Innovation Diffusion** (e.g., how people adopt electric vehicles).

The model divides adopters into two groups:
1. **Innovators** – Early adopters who adopt independently.
2. **Imitators** – Individuals who adopt based on **social influence**.

## 🧠 **Historical Context**
Developed by **Frank M. Bass** in 1969, this model built on **Everett Rogers’ Diffusion of Innovations Theory**, providing a **quantitative framework** for adoption dynamics.

### **Example: Smartphone Adoption**
- Early adopters buy the **first iPhone** based on curiosity.
- As more people use iPhones, **social influence grows**.
- Eventually, adoption saturates, and growth **slows down**.

---

## 📖 **Mathematical Formulation**
The rate of adoption over time is given by:

$$\frac{dF(t)}{dt} = p (1 - F(t)) + q F(t) (1 - F(t))$$

Where:
- $$\( F(t) \)$$ = **Cumulative fraction of adopters at time $$\( t \)$$**.
- $$\( p \)$$ = **Coefficient of innovation** (rate of early adoption).
- $$\( q \)$$ = **Coefficient of imitation** (social influence).
- $$\( (1 - F(t)) \)$$ = **Remaining potential adopters**.

### **Key Concepts**
1. **Innovators adopt independently** $$(\( p \))$$, often influenced by advertising.
2. **Imitators adopt based on peer influence** $$(\( q \))$$, leading to exponential growth.
3. **Saturation occurs when most of the population has adopted**.

---

## 📊 **Graphical Representation**
The **Bass Diffusion Curve** resembles an **S-shaped function (sigmoid curve)**:
- **Early Growth** – Slow adoption due to innovators.
- **Exponential Growth** – Imitators drive rapid adoption.
- **Saturation** – Adoption slows as fewer non-adopters remain.

