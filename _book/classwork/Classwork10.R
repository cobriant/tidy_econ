#' ---
#' title: "Classwork 10: Simulation with map(.x, .f)"
#' author: "Your name here"
#' output: html_document
#' ---
#' 
#' Before starting this classwork, make sure to carefully review
#' koans 15 and 16 on `map`.
#' 
#' Run this code to get started:
#' 
#+ message = FALSE
library(tidyverse)
library(gapminder)

#' ## Simulations using `map(.x, .f)`:
#'
#' Last week, we worked on writing the Goldfeld-Quandt test as a function:
#' 

goldfeld_quandt <- function(tibble, formula, x){
  # This function calculates the Goldfeld-Quandt test statistic for a given data 
  # set, model formula, and explanatory variable. The function returns a tibble 
  # with the test statistic, critical value, and a boolean value for whether or
  # not the data is heteroskedastic.
  
  square <- function(x) x^2
  
  ssr1 <- tibble %>%
    arrange({{ x }}) %>%
    slice_head(prop = 3/8) %>%
    lm(formula, data = .) %>%
    residuals() %>% 
    square() %>%
    sum()
  
  ssr2 <- tibble %>%
    arrange({{ x }}) %>%
    slice_tail(prop = 3/8) %>%
    lm(formula, data = .) %>%
    residuals() %>% 
    square() %>%
    sum()
  
  tibble(
    test_statistic = max(ssr1, ssr2) / min(ssr1, ssr2), 
    critical_value = qf(.999, 
                        df1 = (nrow(tibble) * 3/8) - 2, 
                        df2 = (nrow(tibble) * 3/8) - 2),
    heteroskedasticity = test_statistic > critical_value
  )
}

#' Testing that our function works:
goldfeld_quandt(gapminder, "lifeExp ~ gdpPercap", gdpPercap)

#' But how accurate is `goldfeld_quandt`? How good of a job does it do at
#' detecting different types of heteroskedasticity? We're going to use
#' `map(.x, .f)` to evaluate this.
#'
#' The plan:
#' 
#'  * generate 100 heteroskedastic datasets
#'  * run `goldfeld_quandt` on each of them
#'  * count how many times `goldfeld_quandt` accurately detects the heteroskedasticity
#'
#' ## 1. Generate an artificial dataset 
#' 
#' That has two variables and 20 observations:
#' 
#'  * `income`, which takes values pulled from a Normal distribution
#'  * `consumption`, which is a function of `income` with additive noise AND
#'     where the standard deviation of the unobservable term is a function of 
#'     `income` like `income^2`.
#'  

# tibble(
#   income = __,
#   consump = __
# ) %>%
#   ggplot(aes(x = income, y = consump)) +
#   geom_point() +
#   geom_smooth(method = lm)

#' In the next few problems, make sure to copy-paste the tibble you defined
#' above (without the plotting).
#' 
#' ## 2. Does `goldfeld_quandt` detect the heteroskedasticity once? 
#' 
#' Run this code a couple of times! You may get different answers because each
#'    dataset is generated with random elements.
#'    

# tibble(
#   income = __,
#   consump = __
#   ) %>%
#   goldfeld_quandt(formula = "consump ~ income", x = income)

#' 
#' ## 3. How many times out of 100 does goldfeld_quandt detect the heteroskedasticity?
#'   
#'   We want to use `map(.x, .f)` to take the code above and run it 100 times, 
#'   counting the number of times `goldfeld_quandt` outputs `TRUE`.
#'   Since we don't want to change anything each time we run the function, 
#'   I'll use `.x = 1:100` and use `function(...)`. 
#'   This way, our function simply executes 100 times with no changes.
#'   What do you need to do here? To define the function body in line 116,
#'   just take what you wrote in lines 94-98: that's what we want to repeat
#'   100 times.
#' 

# map_dfr(
#   .x = 1:100, 
#   .f = function(...) {
#     __
#   }
#   ) %>%
#   count(heteroskedasticity)

# We can use `count` (recall, count is the same as group by with summarize with n())
# to find the number of times heteroskedasticity is detected.

#' 
#' ## 4. How many times was heteroskedasticity detected?
#' 
#' Go back and change your data generating process to make it so that
#' heteroskedasticity is detected more than 75% of the time. What aspect
#' of the data generating process made it more likely that `goldfeld_quandt`
#' would successfully detect the heteroskedasticity? You can change
#' anything about the data generating process here.
#' 
#' ## 5. Use `map_dfr()` to show that the Goldfeld-Quandt test often fails to detect bubble-type heteroskedasticity
#' 
#' Make sure to visualize the dataset to show you have bubble heteroskedasticity.
#' 
#' ## Extra Credit: Add outliers to a homoskedastic dataset
#' 
#' Use `map_dfr` to show that the Goldfeld-Quandt test can detect 
#' heteroskedasticity from outliers when they have a large or
#' small value for x, but not when they have values for x
#' near the median of x.
#' 