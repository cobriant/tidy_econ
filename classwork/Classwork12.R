#' ---
#' title: "Classwork 12: Dynamic Models (R)"
#' author: "Your Name Here"
#' output: html_document
#' ---
#' 
#' In this classwork, we'll replicate parts of a chapter of **Political Psychology**, 
#' *Presidential Approval and Gas Prices: Sociotropic or Pocketbook 
#' Influence?* (Laurel Harbridge, Jon A. Krosnick, Jeffrey M. Wooldridge, 2016).
#' Take a look at it [here.](https://pprg.stanford.edu/wp-content/uploads/Presidential-Approval-and-Gas-Prices.pdf)
#'
#' In this chapter, authors estimated a dynamic model of the presidential 
#' approval rate of George W. Bush, who was the US president from 2001 to 2009. 
#' During that time, 9/11 happened, there was a snafu about whether Iraq might 
#' have weapons of mass destruction, and in 2003 we invaded Iraq.
#'
#' Public approval is important because it helps determine the ability of the
#' president to push their agenda effectively in Congress and get bills passed.
#' A high public approval rating is also a strong signal that the president's
#' party will win subsequent elections (although shockingly, this was not the 
#' case in last week's midterm elections!).
#'
#' Many people in politics are interested in modeling and understanding the
#' variables that affect the public approval rating of the president. Events
#' like 9/11 and the invasion of Iraq had clear, large effects on that approval 
#' rating. What we're interested in though is the question of whether gas prices
#' seem to effect the presidential approval rating. People's perceptions of the 
#' health of the economy as a whole effects the approval rating, but it doesn't 
#' seem to follow that higher or lower gas prices necessarily indicates a better 
#' or worse economy.
#'
#' But high gas prices are bad for consumers, and a 2008 Gallup poll found that
#' most Americans believe that the president can take steps to reduce the price
#' of gas (even though fluctuations in the price of gas usually occur because
#' of events far beyond the control of the president). As you'll find in this
#' classwork, during George Bush's presidency, as gas prices were increasing,
#' Bush's approval rating kept falling, and Wooldridge et. al. were ready to 
#' call the relationship causal.
#'
#' This research question is interesting nowadays because recently we've seen
#' incredibly high gas prices and incredibly low approval ratings for President
#' Biden. I'll outline some extra credit you can do at the end of this
#' assignment to explore more recent data.
#'
#' We'll use a dataset published with the Wooldridge econometrics textbook
#' called `approval`. To read about the variables, go [here](https://rdrr.io/cran/wooldridge/man/approval.html).
#' 
#' `approve` is the presidential approval rating, measured in percentage points 
#'   (0 to 100), and
#' `rgasprice` is the real gas price, measured in cents. Authors took the US 
#'   city average retail price of unleaded regular gasoline and adjusted the 
#'   prices for general inflation by dividing them by a CPI using 1982-194 as a 
#'   baseline.
#'
#' You'll need to install the package 'wooldridge':
#'
# install.packages("wooldridge")
#'
#+ message = FALSE
library(tidyverse)
library(wooldridge)
data('approval') # This line of code adds the dataset "approval" to your environment
# These lines of code make it into a tibble:
approval <- as_tibble(approval) %>%
  select(time = id, month, year, approve, rgasprice, sep11 = X11.Sep, iraqinvade)

#' ## 1) Visualize the `approve` time series
#'
#' Plot `approve` on the y-axis against `time` on the x-axis. Can you see where
#' September 11th happened and where the invasion of Iraq happened? Draw 
#' vertical lines to mark those dates. Did the approval rating of the president
#' seem to rise or fall because of these events?
#' 

#' ## 2) Plot the gas prices series alongside the approval rate series
#'
#' Use `rgasprice`. Draw two `geom_line()`'s: one for `approve` against `time`, 
#' and another for `rgasprice` against `time`. Overall, does it seem like as gas 
#' prices increase, Bush's approval rating decreases?
#' 

#' ## 3) Estimate the static model and interpret coefficients
#' 
#' $approval_t = \beta_0 + \beta_1 rgasprice_t + u_t$
#'

#' ## 4) Testing for Autocorrelation in $u_t$ Visually
#' 
#' In the workbook we learned that in models without lagged dependent variables
#' on the right hand side, the consequences of autocorrelation are just that 
#' conventional standard errors are incorrect. But here, autocorrelation in 
#' $u_t$ is a little more concerning because it indicates that we seem to have 
#' omitted important variables that are autocorrelated over time, which may bias 
#' our estimate for the effect of gas prices on the presidential approval rate.
#' 
#' Take the static model from the previous question, calculate the residuals,
#' and plot time on the x-axis and the residuals on the y-axis. Can you visually
#' see that large residuals seem to follow other large residuals, and small
#' residuals seem to follow other small residuals? Or, do the residuals seem to
#' be following a path? If so, this is autocorrelation.
#' 

#' ## 5) Breusch-Godfrey Test for Autocorrelation in $u_t$
#' 
#' Implement the Breusch-Godfrey test yourself. You don't need to make this one
#' a function, but you can check your work by running `lmtest::bgtest()`. Make
#' sure to install the package 'lmtest' first and read the help docs to figure
#' out how to use `bgtest()`.
#' 

#' ## 6) Can you get rid of the autocorrelation by adding more lags of rgasprice?
#' 
#' For this question, you can either use your own implementation or 
#' `lmtest::bgtest()`. Try up to 5 lags.
#' 

#' ## 7) Can you get rid of the autocorrelation by adding one lag of `approve`?
#' 
#' Remember, if you add a lag of the dependent variable to the right hand side,
#' it's more important than ever to check for autocorrelation in $u_t$ because
#' if there is still autocorrelation, that means estimates are biased and 
#' inconsistent.
#' 
#' Model: $approve_t = \beta_0 + \beta_1 rgasprice_t + \beta_2 approve_{t-1} + u_t$
#' 

#' ## 8) Estimate the model from Wooldridge et al:
#' 
#' Instead of having `approve` on the left, the model has the first difference 
#' of `approve` on the left. Then on the right is `rgasprice` and one lag of
#' `approve`.
#' 
#' $(approve_t - approve_{t - 1}) = \beta_0 + \beta_1 rgasprice_t + \beta_2 approve_{t - 1} + u_t$
#' 
#' - Check for autocorrelation of $u_t$ using the Breusch-Godfrey test (your own
#'   implementation or `lmtest::bgtest`)
#' 
#' - Estimate the model and interpret coefficients. Wooldridge et al. reported,
#' after including a couple more variables, that they found a 10 cent increase
#' in gas prices caused a .6 percentage point decrease in the approval rating of 
#' the president. Do you find something similar?
#' 
#' 2 more questions:
#' 
#' - Justify why Wooldridge et al might have wanted to use the first difference 
#'   of `approve` as the dependent variable instead of using `approve`.
#' 
#' - Wooldridge et al found a negative coefficient on $approve_{t-1}$ and made
#'   a comment that it showed that the approval rate tends to "regress to the 
#'   mean". What does that mean?
#' 

#' 
#' ## For up to 4 points of Extra credit:
#' 
#' - Find data about president Biden's monthly approval ratings (sometimes 
#'     github can be a good place to look for this kind of thing: I'd search for
#'     csv files on this topic there perhaps)
#' - Find data about average monthly gas prices across the US
#' - Join the two datasets (remember left_join()?)
#' - Repeat the analysis you did in this classwork for the new dataset: if 
#'   Bush's approval ratings seemed to be affected by gas prices, does Biden's 
#'   in the same way or scale?
#'