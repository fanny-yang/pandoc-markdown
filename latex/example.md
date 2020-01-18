---
pagestyle: plain
documentclass: article
bibliography: bib.bib
numbersections: true
title: Thoughts on OOD framework
header-includes: \usepackage{macros}
---



# Intro

Some nice usage of macros in macros.sty

## Definitions

- marginal source vs. target distribution on covariates $X$ $\Pxsource, \Pxtarget$
- we have training set $D_S$ and test set $D_T$
- support of these marginals $\suppsource = \supp(\Pxsource)$ and correspondingly for $\Pxtarget$
- some more stuff

Example for an equation referenced
$$ x = 3$$ {#eq:bruch}

## Assumptions {#sec:ass}

- On distributions
  1. $\suppsource \neq \supptarget$
  2. bla
- On the hypothesis/function class $\F$
  1. we have something
  2. and more $D_S$

Discussion of Assumptions in [](#sec:ass) and Eq. [](#eq:bruch).
Let's discuss the assumption on $\F$: Neural networks.


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


# Todo

Add images/subfigure type stuff. Single images work well, don't know yet about subfigures...

## Some subsection
And text. Now I cite [@test]

Bibliography
==============
:::{#refs}
:::
