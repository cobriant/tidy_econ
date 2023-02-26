#' ---
#' title: "Classwork 3: dplyr Murder Mystery (R)"
#' author: "Your Name Here"
#' date: "`r Sys.Date()`"
#' output: html_document
#' ---
#' 
#' In this classwork, you'll use the 7 dplyr functions (plus `left_join` and 
#' `str_detect`) you learned in koans 4-7 to solve a murder mystery!
#' 
#' Make sure you're connected to the internet and run this code to get started:
#+ message = FALSE
library(tidyverse)
person <- read_csv("https://raw.githubusercontent.com/cobriant/dplyrmurdermystery/master/data/person.csv")
drivers_license <- read_csv("https://raw.githubusercontent.com/cobriant/dplyrmurdermystery/master/data/drivers_license.csv")
income <- read_csv("https://raw.githubusercontent.com/cobriant/dplyrmurdermystery/master/data/income.csv")
crime_scene_report <- read_csv("https://raw.githubusercontent.com/cobriant/dplyrmurdermystery/master/data/crime_scene_report.csv")
facebook_event_checkin <- read_csv("https://raw.githubusercontent.com/cobriant/dplyrmurdermystery/master/data/facebook_event_checkin.csv")
get_fit_now_checkin <- read_csv("https://raw.githubusercontent.com/cobriant/dplyrmurdermystery/master/data/get_fit_now_checkin.csv")
get_fit_now_member <- read_csv("https://raw.githubusercontent.com/cobriant/dplyrmurdermystery/master/data/get_fit_now_member.csv")
interview <- read_csv("https://raw.githubusercontent.com/cobriant/dplyrmurdermystery/master/data/interview.csv")
print_all <- function(df, row, col) cat(str_wrap(df[row, col], width = 80))

#' A crime has taken place and the detective needs your help! The detective has 
#' given you special access to police data to help them crack the case. All 8 
#' datasets should be in your global environment now. Take a look at each of 
#' them.

view(crime_scene_report)
view(drivers_license)
view(facebook_event_checkin)
view(get_fit_now_checkin)
view(get_fit_now_member)
view(income)
view(interview)
view(person)

#' This diagram will be useful: it shows you how variables in the tables can be 
#' linked to connect information from different tables. It's called a database 
#' Entity Relationship Diagram: ![](https://mystery.knightlab.com/schema.png)
#' 
#' First, we'll get more comfortable with the data:
#' 
#' How many people are in this database?

person %>%
  nrow()

#' ### 1) How many crime reports are there?
#'
#' __ %>%
#'  nrow()
#'  
#'
#' Did any crimes happen on Christmas of 2017?

crime_scene_report %>%
  filter(date == "2017-12-25")

#' ### 2) How long do the crime scene reports go back?  
#' Hint: use `arrange()`
#'
#' ### 3) The detective first asks you to read the crime scene report. 
#' Apparently it was a *murder* that was filed on *January 15th, 2018* in a 
#' place called *"dplyr City"*.
#'
#' Are you annoyed by not being able to easiy read these long character strings 
#' because R truncates them? I made a function for you called `print_all` to 
#' help. It takes a tibble as the first argument, the (integer) row you want to 
#' print as the second argument, and the (integer) column you want to print as 
#' the third argument.
#' This will print the long string in row 10, column 3 of `crime_scene_report`:

crime_scene_report %>%
  print_all(10, 3) 

#' 
#' ### 4) Write a query that identifies the first witness.
#'
#' person %>%
#'   __
#'
#' ### 5) Write a query that identifies the second witness.
#'
#' person %>%
#'   __
#'
#' ### 6) Write two queries that show the interview transcripts for our two 
#' subjects.
#'
#' interview %>%
#'   __
#'
#' interview %>%
#'   __
#'
#' ### 7) Go get 'em! 
#' Now you know enough to solve the mystery! Show the queries you wrote to solve 
#' it. Then check your answer by filling out the survey: 
#' https://forms.gle/K7rZ5VykcA7Bb1Qf7
#'