---
pagestyle: plain
documentclass: article
bibliography: bib.bib
numbersections: true
title: Thoughts on OOD framework
header-includes: \usepackage{macros}
---



# Function space dependent definition of out-of-distribution

## Definitions

- marginal source vs. target distribution on covariates $X$ $\Pxsource, \Pxtarget$
- we have training set $D_S$ and test set $D_T$
- support of these marginals $\suppsource = \supp(\Pxsource)$ and correspondingly for $\Pxtarget$
- Define the Bayes classifier (in function class $\F$) on source distribution as $\fstarsource$
- Define the sets $\set_0, \set_1$ as the two sets in $\suppsource$ classified as $0, 1$ by $\fstarsource$

Example for an equation referenced
$$ x = 3$$ {#eq:bruch}

## Assumptions {#sec:ass}

- On distributions
  1. $\suppsource \neq \supptarget$
  2. source and target joint distribution have the same $P(y|x)$ (i.e. we are in the covariate shift setting)
- On the hypothesis/function class $\F$
  1. For any $x \in \set_0$ (or a more structured set), if we change the distribution such that $p(y=1|x) =1$, it would not change the Bayes classifier $\fstarsource$
  2. Alternatively: the best classifier $D_S$

Discussion of Assumptions in [](#sec:ass) and Eq. [](#eq:bruch).
Let's discuss the assumption on $\F$: This does not allow neural networks that can interpolate everything.


Let us now reference a theorem, namely [](#conj:inftrees).

Conjecture conj:inftrees
: Let $N$ be an infinite set.
  Then there exists an infinite number of trees for $N$.

An example is shown in [](#tab:example).

Table: Demonstration of pipe table syntax.
  \label{tab:example}

| Right | Left | Default | Center |
|------:|:-----|---------|:------:|
|   12  |  12  |    12   |    12  |
|  123  |  123 |   123   |   123  |
|    1  |    1 |     1   |     1  |


# Particular instantiation: Spurious correlations

## 2-D example
...

Now I cite [@test]

Bibliography
==============
:::{#refs}
:::
