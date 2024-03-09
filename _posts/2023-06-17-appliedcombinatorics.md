---
title: An Interesting Combinatorics Problem
layout: post
date: 2023-06-17
tags: combinatorics 
published: true
image: forest.jpg
---

A few weeks ago, I was preparing for the pharmacology NBME subject examination
and stumbled across an applied combinatorics problem with a rather interesting
solution.

I had completed the UWorld pharmacology question bank and with about 10 days
remaining until the exam, I figured I could go through all of the questions
again as a final review. However, UWorld provides no way to reset the question
bank without buying another subscription. So, to accomplish my goal of redoing
the question bank, I settled on the next best thing: generating tests that were
random samples of 40 questions (the maximum size allowed) from the bank while
wondering how many of these 40-question tests I would need to complete such that
I could be reasonably certain that I would see every question of the question
bank. 

### A Solution by Analogy

After a bit of searching on the internet, I stumbled across [a forum
post](https://math.stackexchange.com/a/3278285) which contained a solution that
maps precisely to the problem I was trying to solve. The post posed the
following question:

> "In the fridge there is a box containing 10 expensive high quality Belgian
> chocolates, which my mum keeps for visitors. Every day, when mum leaves home
> for work, I secretly pick 3 chocolates at random, I eat them and replace them
> with ordinary cheap ones that have exactly the same wrapping. On the next day
> I do the same, obviously risking to eat some of the cheap ones. How many days
> on average will it take for the full replacement of the expensive chocolates
> with cheap ones?"

My question and the question posed on the forum are materially equivalent.
Specifically, we sample $$m$$ objects (whether question or chocolate) with
replacement from a collection of $$n$$ objects and ask how many samples on
average are required to have sampled each object at least once.

### Deriving a Formula

Let us derive the formula in the context of the Belgian chocolates. Suppose
there are $$n$$ expensive chocolates and each day you secretely pick $$m$$
chocolates for replacement. Let $$T$$ be a random variable representing the number
of days it takes to replace all the expensive chocolates.  For a given set $$S$$
of chocolates, there are $$\binom{n-|S|}{m}$$ $$m$$-element subsets avoiding
$$S$$ and therefore a $$\binom{n-|S|}{m}/\binom{n}{m}$$ probability of avoiding
the given set $$S$$ in each sampling. Thus, the probability that you have
managed to avoid $$S$$ in each of the first $$i$$ days is $$\left[\binom{n-|S|}{m}/\binom{n}{m}\right]^i$$.

The probability that you have managed to avoid at least one chocolate during the
first $$i$$ days is equal to the alternating sum over all subsets according to
the [principle of
inclusion-exclusion](https://en.wikipedia.org/wiki/Inclusion%E2%80%93exclusion_principle).
We may group these probabilities by the number of elements, recognizing that we
will have $$\binom{n}{s}$$ sets contributing to the term for the $$s$$-element
subsets. Thus we may write

$$P(T>i)=\sum_{s=1}^{n}\binom{n}{s}(-1)^{s+1}\left[\binom{n-s}{m}/\binom{n}{m}\right]^i$$

Using the [tail sum for expectation
formula](https://math.stackexchange.com/questions/63756/tail-sum-for-expectation),
we are able to derive an expression for the expectation.

$$\begin{align}
E(T)&=\sum_{i=0}^{\infty}P(T>i)\\
&=\sum_{i=0}^{\infty}\sum_{s=1}^{n}\binom{n}{s}(-1)^{s+1}\left[\binom{n-s}{m}/\binom{n}{m}\right]^i\\
\end{align}$$

Since the series [converges
absolutely](https://en.wikipedia.org/wiki/Absolute_convergence), we can
rearrange the summations and simplify using the geometric series formula
$$\sum_{i=0}^{\infty}x^i=\frac{1}{1-x}$$.

$$\begin{align}
E(T)&=\sum_{s=1}^{n}\binom{n}{s}(-1)^{s+1}\sum_{i=0}^{\infty}\left[\binom{n-s}{m}/\binom{n}{m}\right]^i\\
&=\sum_{s=1}^{n}\binom{n}{s}(-1)^{s+1}\frac{1}{1-\binom{n-s}{m}/\binom{n}{m}}\\
&=\binom{n}{m}\sum_{s=1}^{n}\frac{(-1)^{s+1}\binom{n}{s}}{\binom{n}{m}-\binom{n-s}{m}}\\
\end{align}$$

Using the above derived formula, we can finally calculate the exact answers to
our questions.

For the Belgian chocolate problem, with $$n=10 \text{ and } m=3$$, we would expect it to take, on average, $$9.05$$ days to replace all of the chocolates.  

For the UWorld pharmacology question bank problem, with $$n=639 \text{ and } m=40$$, we would expect it take, on average, $$109.45$$ tests to see every question of the question bank.
