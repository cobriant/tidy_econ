#' ---
#' title: "Classwork 2"
#' author: "Your Name Here"
#' date: "`r Sys.Date()`"
#' output: html_document
#' ---
#'
#' **Instructions**: Open this R script in RStudio. Then hit Ctrl/Cmd Shift K
#' to export this document to html and preview it (if Ctrl/Cmd Shift K doesn't 
#' do anything, Tools > Modify Keyboard Shortcuts > reassign "Compile Notebook" 
#' to be Ctrl/Cmd Shift K). Upload your final html version onto Canvas by the 
#' time it is due.
#'
#' -----------------------------------------------------------------------------
#' 
#' # 1. `lm()`
#'
#' Run the code below to get started. It uses the assignment operator `<-` a 
#' couple of times. For instance, `x <- 0:2` should be read "x gets 0:2". When
#' we run that piece of code, we're taking the vector `0:2` and giving it the 
#' name `x`. So after running `x <- 0:2`, x + 1 will be equal to 1:3. Also 
#' notice that after you run the code below, if you check the top right pane in
#' RStudio, the `Environment` tab should let you know that x now refers to `0:2`.
#' 
#+ message = FALSE
library(tidyverse)
x <- 0:2
u <- c(2, -1, 2)
y <- -3 + 3*x + u

#' You now have access to 3 vectors of data: `x`, `u`, and `y`. 
#' 
#' - `u` is random noise that's drawn from a distribution with mean = 0,
#'   but in any given sample may not necessarily have mean = 0.
#' - `y` is generated from `x` and `u` according to the equation in the line
#'   that starts with `y <-`. This is called the *true model* or the 
#'   *data generating process*: it's how `y` was truly generated.
#' 
#' ### 1.1 What's the true effect of x on y (slope of the true model)?
#' 
#' __
#' 
#' Take a look at the contents of `x`, `u`, and `y`:

x
u
y

#' Notice that you can apply functions to your vectors like this:

x^2

x/y

mean(x)

#'
#' ### 1.2 Consider the model: $y_i = \beta_0 + \beta_1 x_i + u_i$.  
#' 
#'   Calculate OLS estimates $\hat{\beta_0}$ and $\hat{\beta_1}$ using only 
#'   these functions:  
#'   
#'   * Addition and subtraction: `+`, `-`  
#'   * Multiplication and division: `*`, `/`  
#'   * Square: `^2`  
#'   * and three others: `mean()`, `sum()`, and `sqrt()` for square root.  
#'

# b1 <- __
# 
# print(b1)
# 
# b0 <- __
# 
# print(b0)

#' After doing those calculations, check that they match the `lm()` results:

tibble(x, y) %>%
  lm(y ~ x, data = .) %>%
  broom::tidy()

#' ### 1.3 Calculate the fitted values $\hat{y_i}$ and the residuals $e_i$ using b0 and b1.


#' Check that you have the correct answer:

tibble(x, y) %>%
  lm(y ~ x, data = .) %>%
  fitted.values()

tibble(x, y) %>%
  lm(y ~ x, data = .) %>%
  residuals()

#' -----------------------------------------------------------------------------
#' 
#' ## 2. `qplot()`
#' 
#' This problem is open-ended. You'll create 3 visualizations of a small 
#' dataset. You'll use `qplot()` for drawing the graphs (or if you're already 
#' comfortable with `ggplot`, you're welcome to use that instead).
#' 
#' Run this code to get started:

world_data <- tibble(
  country   = c("Brazil", "Brazil", "Brazil", "Brazil",
                "Haiti", "Haiti", "Haiti", "Haiti",
                "Puerto Rico", "Puerto Rico", "Puerto Rico", "Puerto Rico",
                "Colombia", "Colombia", "Colombia", "Colombia"),
  year      = c(1952, 1972, 1992, 2007, 1952, 1972, 1992, 2007,
                1952, 1972, 1992, 2007, 1952, 1972, 1992, 2007),
  gdpPercap = c(2108.944,  4985.711,  6950.283,  9065.801,
                1840.367,  1654.457,  1456.310,  1201.637,
                3081.960,  9123.042, 14641.587, 19328.709,
                2144.115,  3264.660,  5444.649,  7006.580),
  lifeExp   = c(50.9, 59.5, 67.1, 72.4, 37.6, 48, 55.1, 60.9, 
                64.3, 72.2, 73.9, 78.7, 50.6, 61.6, 68.4, 72.9)
)

#' Your data is called `world_data`. It tells you the GDP per capita and
#' life expectancy for four different countries during four different years.

print(world_data)

#' Read the qelp docs for `qplot()` to find out how to use it:

?qelp::qplot

#' Rubric:
#' 
#' 1. Make 3 nice visualizations of different aspects of the data.
#' 2. You should use `color` or `fill` at least one time.
#' 3. Every plot should showcase at least one unique geom so that over the
#'    course of your 3 plots, you show at least 3 different geoms.
#' 4. Each plot should have a title.
#' 
#' Write your code for your 3 plots here:
#' 
#' ### 4.1 Plot 1:

#' ### 4.2 Plot 2:

#' ### 4.3 Plot 3:

