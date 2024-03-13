---
title: The Monty Hall Problem
layout: post
date: 2023-08-27
tags: statistics bayesian
published: true
---

The Monty Hall problem is a statistical word problem based on the American
television game show *Let's Make a Deal* and named after the show's original
host Monty Hall. The problem is stated as follows:

> Suppose you are on a game show and you are given a choice of three doors.
> Behind one door is a prize; behind the other two doors, nothing. After you
> pick a door, the host opens one of the remaining two doors to reveal nothing.
> The host now offers that you may switch you choice to the other still-closed
> door or stay with your original choice. Is it in your advantage to switch? 

If you are like me, or most other people for that matter, your instinct likely
tells you that there should be no difference between switching or staying - that
the probability of revealing a prize in either case should be $$\frac{1}{2}$$.
However, after more careful consideration, one realizes that the host opening a
door and revealing nothing behind it provides information about the door that he
chose not open - that is, the door to which you now have the option to switch.
Using this information, we can update the probability of the prize being behind
that door relative to the currently chosen door.

### A Bayesian Solution

Here, I am going to present a straightforward application of Bayes' theorem to
solve this problem.

First, before any choices have been made, the doors are exchangable. That is,
mathematically there is no information known about any given door that would
make it more or less likely to contain the prize. This argument allows us to
assign equal prior probability to each door, which we will represent by the following
vector:

$$\vec{D}_{prior}=\left[\frac{1}{3},\frac{1}{3},\frac{1}{3}\right]$$

In addition, this allows us by symmetry to only consider the case when the
player chooses the first door, as any other choice is equivalent (one might
imagine relabeling the doors such that whichever chosen door is considered first).

The host then chooses to reveal to the player one of the remaining two doors,
which he knows to conceal nothing. The two doors that the host chooses from are
also exchangable among themselves (again, as there is no information provided to
the player that would favor one door over the other). As such we again by
symmetry can collapse the problem to only consider the scenario in which the
host opens the third door.

Let $$I$$ represents the information that the player chose the first door and
the host revealed the third door to be empty. Bayes' theorem can now be applied
to calculate the corresponding posterior probability of each door.

$$P(\vec{D}_i\vert I)=\frac{P(I\vert\vec{D}_i)\cdot P(\vec{D}_i)}{P(I)}$$

where $$P(I)$$ represents a normalizing constant. Applying the above theorem,

$$P(\vec{D}_1\vert I)=\frac{\frac{1}{2}\cdot \frac{1}{3}}{\frac{1}{6}+\frac{1}{3}}=\frac{1}{3}$$

$$P(\vec{D}_2\vert I)=\frac{1\cdot \frac{1}{3}}{\frac{1}{6}+\frac{1}{3}}=\frac{2}{3}$$

$$P(\vec{D}_3\vert I)=\frac{0\cdot \frac{1}{3}}{\frac{1}{6}+\frac{1}{3}}=0$$

which gives us the final vector of posterior probabilities:

$$\vec{D}_{posterior}=\left[\frac{1}{3},\frac{2}{3},0\right]$$

As we can see, the probability of the prize being behind the door neither chosen
by the player or host is $$\frac{2}{3}$$, while the probability of the prize
being behind the door originally chosen by the player is $$\frac{1}{3}$$. Due to
the exchangability and symmetry arguments above, this result extends to all
possible combinations of player and host selections - regardless of the door
number, it is always in the player's best interest to switch to the door not
chosen by the host. 
