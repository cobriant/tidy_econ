#' ---
#' title: "Project 9: Heteroskedasticity (R)"
#' author: "Your names here"
#' output: html_document
#' ---
#'
#+ message = FALSE
library(tidyverse)
work <- read_csv("https://raw.githubusercontent.com/cobriant/dplyrmurdermystery/master/data/laborforce1976.csv")

#' ## Heteroskedasticity in the labor force
#'
#' This dataset is adapted from the [Wooldridge econometrics text](https://rdrr.io/cran/wooldridge/man/wage1.html).
#' It comes from a 1976 survey of 526 working adults, so I'll call it `work`. 
#' It contains each person's hourly wage rate (in 1976 dollars), the number of 
#' years of education they had completed, their tenure (the number of years they 
#' had been at their current job), their race, their sex, and whether they were 
#' married.
#'
#' ### 1) Explore the data
#' 
#' Answer the following questions either with a plot or by reporting summary 
#' statistics (or both).
#'
#' #### 1a) Describe the distribution of the years of education people have 
#' received in this dataset.
#' 
#' 
#' #### 1b) In 1976, did men and women seem to have about the same number of 
#' years of education, or did men have more education?
#' 
#' #### 1c) Describe the gender wage gap in the dataset.
#'
#'
#' ### 2) Estimate and visualize $wage_i = \beta_0 + \beta_1 educ_i + u_i$.
#'
#' Interpret the estimates for $\beta_0$ and $\beta_1$. Use
#' `geom_smooth(method = lm)` in your visualization. On top of omitted variable 
#' bias, we might also be worried about heteroskedasticity in a model like this 
#' because people with higher levels of educational attainment may have the 
#' flexibility to follow their passions, whether that brings them toward higher 
#' or lower paying work. But people with low educational attainment may find 
#' that their only options are minimum wage jobs. Does visual inspection point 
#' to heteroskedasticity in this model?
#'
#'
#' ### 3) Implement the Goldfeld-Quandt test for heteroskedasticity
#'
#' Does the Goldfeld-Quandt test find heteroskedasticity in the model above?
#'
#' One way to do this is to create two variables:

# ssr1 <- __
# ssr2 <- __

#' which will hold the values for the sum of the squared residuals from the
#' model fit with the first 3/8 of the data, and then the last 3/8 (the data 
#' must be sorted from low education to high education of course). Then all you
#' need to do is to compare ssr1 to ssr2 to find which is bigger, and calculate
#' the test statistic and critical value. For the critical value, use
#' `qf(.999, df1 = n_star - 2, df2 = n_star - 2)` where n_star is 3/8 of the
#' number of rows of the dataset, rounded to the nearest integer. K is 2 in the
#' case of a simple regression because the intercept counts as a parameter in
#' this test.
#'
#' You can earn up to 2 points of extra credit by writing a function
#' `goldfeld_quandt` that takes 4 arguments: a tibble, a formula for the model
#' in quotes (like "wage ~ educ"), an x variable which is the explanatory
#' variable for which we're concerned about heteroskedasticity (educ in this
#' case), and K: the number of explanatory variables in the model including the
#' intercept. The function should be able to take *any* tibble and model and
#' run the Goldfeld-Quandt test for heteroskedasticity on it.
#' You can still use assignment inside the body of a function:
# ssr1 <- __
# ssr2 <- __
#' It might also be a good idea to make a variable `n_star` inside the function.
# n_star <- __
#' You should be able to call your function like this, and it should return a
#' TRUE if heteroskedasticity is detected and a FALSE if not.

# goldfeld_quandt(work, "wage ~ educ", educ, k = 2)

#'
#' For the sake of an example, here's a function that implements the White
#' test for heteroskedasticity. Your goldfeld quandt function will of course be
#' pretty different because the two tests are pretty different.
#' 

white <- function(tb, formula, x) {
  tb %>%
    mutate(
      resid = residuals(lm(formula, data = tb))
    ) %>%
    lm(paste0("resid ~ ", x, " + I(", x, "^2)"), data = .) %>%
    broom::glance() %>%
    select(r.squared) %>%
    mutate(
      test_statistic = r.squared * nrow(tb),
      critical_value = qchisq(.999, df = 2),
      heteroskedasticity = test_statistic > critical_value
    )
}

white(work, "wage ~ educ", "educ")

#'
#' ### 4) Explore different model specifications
#'
#' #### 4a) Running `white(work, "wage ~ educ", "educ")` indicates that the 
#' White test does detect heteroskedasticity in the "linear-linear" model. Does 
#' it detect heteroskedasticity in the log-linear or log-log models? Does the
#' goldfeld-quandt test detect heteroskedasticity in the log-linear or log-loge
#' models?
#' 
#' Hint: taking `log(educ)` will throw an error because there are some people in
#' the dataset with 0 years of education (and log(0) = -Inf). Instead, just add 
#' 1 to `educ`.
#' 
#' 
#' #### 4b) Does including more variables in the model reduce the 
#' heteroskedasticity associated with `educ`? If so, which adding variables do 
#' the trick?
#' 
