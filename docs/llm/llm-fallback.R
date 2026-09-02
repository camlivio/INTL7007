# Working With an LLM -- Part I: Prompt It
# Plain R version, for RStudio. Same content as the web page.
#
# Data: Gerber, Green & Larimer (2008), social pressure and voter turnout.
# Put voting.csv in your working directory first.

voting <- read.csv("voting.csv")
head(voting)
nrow(voting)

# The dollar sign pulls one column out as a vector.
head(voting$voted)

# A 0/1 variable's mean is a proportion.
mean(voting$voted)


## Problem 1 -------------------------------------------------------------
## Among the people who received the mailing, what share voted?
## Target: 0.3779482

# mean(voting$voted[voting$message == "yes"])


## Problem 2 -------------------------------------------------------------
## How much higher was turnout among those who got the mailing?
## Target: 0.08130991

# treated <- mean(voting$voted[voting$message == "yes"])
# control <- mean(voting$voted[voting$message == "no"])
# treated - control


## Problem 3 -------------------------------------------------------------
## Was the mailing more effective for older voters?
## Split at age 50 in 2006. Targets: 0.08827899 (50+), 0.07448951 (under 50)

# age <- 2006 - voting$birth
# old <- age >= 50
# mean(voting$voted[old & voting$message == "yes"]) -
#   mean(voting$voted[old & voting$message == "no"])
# mean(voting$voted[!old & voting$message == "yes"]) -
#   mean(voting$voted[!old & voting$message == "no"])
