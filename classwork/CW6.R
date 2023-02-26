#' ---
#' title: "Classwork 6: OVB Simulation and Practice with the Tidyverse"
#' author: "Your Name Here"
#' date: "`r Sys.Date()`"
#' output: html_document
#' ---
#' 
#+ message = FALSE
library(tidyverse)

#' Recall how you can use the function `tibble()` to generate a dataset from
#' scratch, like this:

tibble(
  x = c(1, 7, 3, 7),
  y = 1:4,
  z = sample(1:10, size = 4, replace = TRUE)
)

#' You can even have variables be functions of other variables. Note that w is a
#' function of x and y:

tibble(
  x = c(1, 7, 3, 7),
  y = 1:4,
  z = sample(1:10, size = 4, replace = TRUE),
  w = x + 2*y - 10
)

#' And you can introduce noise from a random normal distribution
#' using the function `rnorm()`. Just like `rt()`, it generates a vector of 
#' random numbers from its distribution (the normal distribution instead of the 
#' t distribution like with `rt()`).
#' 

tibble(
  x = c(1, 7, 3, 7),
  y = 1:4,
  z = sample(1:10, size = 4, replace = TRUE),
  w = x + 2*y - 10 + rnorm(n = 4, mean = 0, sd = 1)
)

#' Every time you run the code above, R will generate slightly different
#' numbers for z and w because of the random elements in z and w.
#' 
#' ### 1 Generate a dataset
#' 
#' Take a look at your answer to classwork 5, #1e. It asked you to be creative
#' and to think of an example of omitted variable bias yourself. In particular, 
#' it asked you to think of three variables: $x$, $y$, and $u$. $x$ and $u$ 
#' should both effect $y$, $x$ and $u$ should also be correlated, and $u$ should
#' be hard to or not commonly measured (unobservable).
#' 
#' In this classwork, you'll simulate the omitted variable bias issue that you
#' explained in classwork 5 #1e.
#' 
#' First, generate an artificial dataset that has the 3 variables you talked 
#' about in 1e. There should be 100 observations (rows) in your tibble. Make 
#' sure that $y$ is determined by a linear function of $x$ and $u$, along with
#' additive noise. Also make sure that $x$ and $u$ correlate, but are not 
#' perfectly collinear (there are many ways to do this).
#' 
#' Don't use the names "x", "y", and "u" in your tibble; use the names from your
#' answer to 1e. Try to generate those variables so that they have reasonable
#' values that are not too far away from the values they might take on in the 
#' real world.
#'    

# dataset <- tibble(
#   u = __,
#   x = __,
#   y = __
# )

#' ## 2  Write queries using tidyverse functions that answer each of these 
#' questions about your dataset:
#' 
#' 2.1 What is the median value for x in your dataset?
#' 

# __

#' 
#' 2.2 What are the median values for x among people with above-average y? What 
#' about the median values for x among people with below-average y?
#' 

# __

#' 
#' 2.3 What is the value of u and x for the single person with the highest y?
#' 

# __

#' 
#' ## 3  Do a couple visualizations of your dataset
#' 
#' You should use `ggplot`, `geom_point` or `geom_jitter`, and `geom_smooth` to 
#' verify that `x` covaries with `u` and that `y` covaries both with `x` 
#' and with `u`.
#' 

# __

#' ## 4 OLS model
#' 
#' 4.1) As the econometricians, `x` and `y` will be observable to us, but `u` 
#' will not be observable. Fit the model `y ~ x`, copy-pasting the way you
#' originally defined your dataset using the function `tibble()`. That way, each
#' time you run the piece of code, it will generate slightly different estimates
#' for the model parameters. Do you seem to get biased or unbiased estimates of 
#' the true effect of x on y?

# tibble(
#   __
# ) %>%
#   lm(y ~ x, data = .) %>%
#   broom::tidy()

#'
#' 4.2) Make a change to your simulation
#' 
#' Take the code from above and change your dataset so that x and u no longer 
#' covary; make them independent. Fit the same model as before. If x is 
#' independent of u, but u is still an important determinant of y, when we omit 
#' u from the model, do we bias the estimate for the impact of x on y?
#' 

# __
#' 
#' 4.3) Make another change to your simulation
#' 
#' Take the code from 4.1) and change your dataset again so that u is no longer
#' a direct determinant of y. x should still covary with both u and y. When
#' u no longer determines y, does omitting u bias the impact of x on y?
#' 

# __
