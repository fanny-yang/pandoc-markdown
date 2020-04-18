---
bibliography: bib.bib
title: "Title here: Some sample slides"
author: "Your name"
date: "April 1st"
colorlinks: true
---


# Outline

- Motivation

. . .

- Problem statement

- Main results

    - Theorem

    - Proof idea

    - Experiments

. . .

- Discussion

- Follow-up questions



# Random design

- We only controlled $\|\fhat-\fstar\|_n^2$ so far w.h.p. over observation noise.

. . .

- Viewed as excess risk with expectation over observation noise $w$ (independent of $\fhat$) with square loss
$$\begin{aligned}
\|\fhat-\fstar\|_n^2 = \risk(\fhat) - \risk(\fstar) &= \EE_w \frac{1}{n}\sum_{i=1}^n (y_i-\fhat(x_i))^2 - \EE_w  \frac{1}{n}\sum_{i=1}^n w_i^2\\
&=\frac{1}{n}\sum_{i=1}^n (\fhat(x_i) - \fstar(x_i))^2
\end{aligned}$$

- can be bounded using empirical Gaussian complexities

. . .

[How does the error look like on the whole domain $\X$?]{.R}

. . .

[Now we view $X$ as random and take expectation also over $X$, i.e. assuming $f\in \Ell^2(\prob)$, want to bound]{.G}

# Prediction error bound for random design

$\to$ Use population (expected) analogs of quantities for fixed design

- localized population Rademacher complexity $\localRade{\F}{\delta}  = \frac{1}{n} \EE_{X,\eps} \sup\limits_{\|\Delta\|_2 \leq \delta, \Delta \in \F} \sum_{i=1}^n \eps_i \Delta(x_i)$

- $\critquantpop$ satisfies population critical inequality with $\localRade{\F}{\delta}$
$$128 \textcolor{Green}{C} \:\localRade{\F}{\delta} \leq \delta^2$$

. . .

- let $\critquant$ still be critical radius defined via localized Gaussian complexity as in Lec 5 for fixed design (random in terms of $\traind$!)

. . .

Theorem (modified MW Cor. 14.15)
: Assume $\F$ star-shaped, and [$\EE f(X) = 0$ and $\EE f^4(X) \leq C^2 \EE f^2(X)$ for all $f\in\F$]{.G}. Suppose $n$ large enough such that $\delta_n \leq 1$, then w/ probability greater than $1 - c_1 \E^{- \frac{ c_2 n\delta_n^2}{\sigma^2 + C^2}}$ over the training set $\traind$,
  $$\|\fhat - \fstar\|_2^2 \leq c (\critquantpop^2 + \critquant^2)$$

# Proof sketch of Theorem

Write $\Deltahat = \fhat - \fstar$. If $\|\Deltahat\|_2^2 \leq \critquantpop^2$ we're done, hence bound $\|\Deltahat\|_2^2 \geq \critquantpop^2$

Lemma (MW Thm 14.12.)
: Assume $\F$ star-shape and moment conditions in Theorem hold. For any $\Deltahat \in \F$ with $\Deltahat \geq \critquantpop^2$ we have
\vspace{-0.1in}
$$\|\Deltahat\|_2^2 \leq 2\|\Deltahat\|_n^2 \: \text{ w/ prob } \: \geq 1-\E^{-c\frac{n\critquantpop^2}{C^2}}$$

. . .

We use this to bound for two cases

- $\critquantpop \geq \critquant$: Lemma with fixed design bound on $\|\Deltahat\|_n^2$ (set $t = \frac{\critquantpop^2}{\critquant^2} \geq 1$)

. . .

- $\critquantpop <\critquant$: Split event $\|\Deltahat\|_2^2 \geq 16\critquant^2 + 2 \critquantpop^2$ into

    + Event 1: $\|\Deltahat\|_n^2 \leq 8\critquant^2 \to \|\Deltahat\|_2^2 \geq 2\|\Deltahat\|_n^2 + 2\critquantpop^2$ bound with Lemma

    . . .

    + Event 2: $\|\Deltahat\|_n^2 > 8\critquant^2$  has probability $\leq \E^{-\frac{n\critquant^2}{2\sigma^2}} \leq \E^{-\frac{n\critquantpop^2}{2\sigma^2}}$ \
    using fixed design bound \hfill \qedsymbol


# Nested lists

1. List 1

    . . .

    a) Item 1

    . . .

    b) Item 2

    . . .

2. List 2

    . . .

    i) Item 1

    . . .

    ii) Item 2

3. List

    . . .

    - Hello

    - World

# More visibility flexibility {.t}

This page is top aligned

* visible on all

[But you know $x = 3$ ]{.CR v=4-}

* [THIS DOESNT WORK WITH ONLY]{.R v=2-}
  - [bla]{.G v=4}
  - [brum]{.G v=4}

* [visible on 3]{v=3-}


# centering

[foo]: handout.pdf
[fuu]: http://www.google.com

::: {.center}

Hack for centered text (bad but better than nothing)\
see [fuu]\
see [foo]

:::

And normal text

# Slowly appearing grid / table

<!-- following "only=" setup is explained in "beamer support" section of
  tcolorbox documentation.  the extra quotes are needed by pandox-->
::: {.tc cols=3 halign=center}

[1]{.B}

[2]{.R}

[3]{.P}

[4]{.G o=3 only="<3>{colframe = green, colback=gray, boxrule=2pt}"}

[5]{.CR o=2 boxrule=2pt colframe=black}

6

7

8

9

:::


::: {.tc rows=2 cols=3 boxrule=1pt colframe=Green colback=white!95!green}

A

[![](https://simons.berkeley.edu/sites/all/themes/simons/logo.png "yo"){width=100%}]{v=2-}

[C]{v=3 colframe=green valign=center}

D

[E]{a=2- halign=center}

[F]{v=3}

:::



# References


Background on Functional Analysis for Proof of Mercer's

- Knapp: Advanced Real Analysis, Chapter 2

- (German) Werner: Funktionalanalysis

Translation-invariant kernels and Random features

- *Percy Liang Lecture Notes*: Lectures 11, 12

- *Rahimi and Recht '08: Random Features for Large-Scale Kernel Machines* (Neurips)
