#' ---
#' title: "Classwork 16: Instrumental Variables (R)"
#' author: "Your Names Here"
#' output: html_document
#' ---
#'
#' ## Part 1: Valid instruments
#'
#' Suppose we're interested in the causal effect of family size on maternal
#' labor supply. That is, does having more kids cause mothers to work less on
#' average, and by how much?
#'
#' ### 1.1) Explain why we'd be worried about selection bias in this example.
#'
#'
#' ### 1.2) Explain what an ideal experiment would look like to identify the causal effect of family size on maternal labor supply.
#'
#'
#' ### 1.3) Consider these four possible instruments for family size.
#'
#' Argue why each one would or would not violate the three conditions for
#' an instrument to be valid. (Hint: just one of them is a valid instrument)
#'
#' **Mother's education**
#'
#'
#' **The oldest two children are the same gender**
#'
#'
#' **The youngest child is female**
#'
#'
#' **At least one grandparent lives in the household**
#'
#'
#' ## Part 2: Instrumental Variables Example
#'
#' Run this code to get started:
#+ message = FALSE
library(tidyverse)
friends <- read_csv("https://raw.githubusercontent.com/cobriant/dplyrmurdermystery/master/friends.csv")

#'
#' This part of the project is inspired by a paper by Andrew J Hill, published in
#' AEJ Applied (2015) called [The Girl Next Door: The Effect of Opposite Gender Friends on High School Achievement](https://pubs.aeaweb.org/doi/pdfplus/10.1257/app.20140030).
#' It's an interesting read, but reading it closely is not a prerequisite for
#' completing this classwork, and may even make you more confused about it!
#' I suggest reading the paper only *after* you finish the classwork.
#'
#' Data:
#'
#' I artificially generated some survey data with variables:
#'
#' - **gpa**: "What's your GPA?"
#' - **friends_same**: "How many friends do you have of the same sex as you?"
#' - **friends_opposite**: "How many friends do you have of the opposite sex as you?"
#' - **bus_stop_opposite**: "Out of all the kids at your bus stop, how many of them
#'   have the opposite sex as you?"
#'
#'
#' ### 2.1) Naive OLS Model
#'
#' Estimate this model and interpret the coefficients. Why would we include
#' a squared term?
#'
#' $\text{GPA}_i = \beta_0 + \beta_1 \text{friends_opposite}_i +
#'   \beta_2 \text{friends_same}_i + \beta_3 \text{friends_same}_i^2 + u_i$
#'
#' (Recall: to include a squared term in `lm`, use `I()`: `lm(y ~ x + I(x^2), data = .)`)
#'


#'
#' ### 2.2) Thinking about causality
#'
#' Since I generated the data, I can tell you the *true* effect of friends
#' of the opposite sex on GPA is not estimated well in the previous question.
#'
#' In truth:
#'
#' - `friends_opposite` has a coefficient of -.08,
#' - `friends_same` has a coefficient of 0.5,
#' - `friends_same^2` has a coefficient of -.08.
#'
#' Compare the true value for $\beta_1$, the effect of `friends_opposite` on GPA,
#' to the value you estimated in question 2. **Did you estimate $\beta_1$ to be**
#' **too low or too high?**
#'
#' In the data generating process, I created a variable `strict_parents` that
#' took on a 0 or a 1. It influenced `GPA` and also `friends_opposite`, and I
#' omitted it from your version of the data. **Is it causing omitted variable bias?**
#' **If so, what direction is the bias? Explain your answers.**
#'
#'
#' ### 2.3) Valid Instruments
#'
#' We'll use `bus_stop_opposite` as an instrument for `friends_opposite` to try and
#' isolate the effect of the exogenous variation in `friends_opposite`. In class, we
#' learned that `bus_stop_opposite` is a valid instrument if it's **relevant**,
#' **exogenous**, and **excludable**. Explain whether you think `bus_stop_opposite`
#' satisfies those conditions.
#'
#'
#' ### 2.4) First Stage
#'
#' Estimate the first stage: $x = \gamma_0 + \gamma_1 z + v$ and
#' interpret the coefficients.


#'
#' ### 2.5) Second Stage
#'
#' Estimate the second stage: $y = \alpha_0 + \alpha_1 \hat{x} + w$ and
#' interpret the coefficients.

#'
#' ### 2.6) IV Estimator: $\frac{Cov(z, y)}{Cov(z, x)}$
#'
#' Verify that the 2SLS estimate for the effect of `friends_opposite` on `gpa`
#' is the same as the IV estimate. (Hint: you can use the function `cov()`
#' inside `summarize()`)
#'

#'
#' ### 2.7) Use `estimatr::iv_robust()`
#'
#' We didn't control for `friends_same` and `friends_same^2` in our simple
#' IV estimate. To help us do that, we can use a function called `iv_robust`
#' from the package `estimatr`. Install that package by running
#' `install.packages("estimatr")`, but don't put that in your R script, just
#' like we can't begin each document with `install.packages(tidyverse)`.
#'
#' When we hold `friends_same` and `friends_same^2` constant, does our IV
#' estimate of the effect of `friends_opposite` improve even more?
#'

estimatr::iv_robust(
  gpa ~ friends_same + I(friends_same^2) + friends_opposite |
    friends_same + I(friends_same^2) + bus_stop_opposite,
  data = friends
)
