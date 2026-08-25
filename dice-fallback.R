# R Basics & The Weighted Dice ------------------------------------------
# No packages needed. Put your cursor on a line and press Ctrl+Enter (Cmd+Enter
# on a Mac) to run it. Work down the file. Try to predict each answer first.

# 1. R IS A CALCULATOR --------------------------------------------------
1 + 1
2^10
17 %% 5          # remainder after division

# YOUR TURN: how many minutes are in a week?


# Type "5 -" on the next line and run it. R answers with a + prompt: it is
# waiting for the rest of the command. Press Escape to cancel.


# 2. OBJECTS ------------------------------------------------------------
a <- 1           # the arrow assigns. Shortcut: Alt+- (Windows) Option+- (Mac)
a                # type the name to see it
a + 2
a <- 100         # objects can be overwritten
a + 2

# YOUR TURN: make an object called die holding the numbers 1 through 6.
# Hint: the colon makes a sequence.


# R is case sensitive: die and Die are different objects.

# 3. VECTORS DO MATHS ALL AT ONCE ---------------------------------------
die <- 1:6
die - 1
die / 2
die * die        # element-wise, NOT matrix multiplication
die + 1:2        # the short vector is RECYCLED: 1 2 1 2 1 2

# YOUR TURN: use die to make 2 4 6 8 10 12 without typing the numbers.


# 4. FUNCTIONS ----------------------------------------------------------
mean(die)
sum(die)
round(3.1415)
factorial(3)
round(mean(1:6))         # nested: R works inside out

sample(x = die, size = 1)   # roll one die. Run it several times.

args(sample)             # what arguments does a function take?
args(round)              # digits = 0 is a DEFAULT value
round(3.1415, digits = 2)

# 5. TWO DICE -----------------------------------------------------------
sample(die, size = 2)                  # run this ~10 times. Ever see a double?
# No -- by default sample() draws WITHOUT replacement.
sample(die, size = 2, replace = TRUE)  # now doubles are possible

dice <- sample(die, size = 2, replace = TRUE)
sum(dice)

# 6. WRITE YOUR OWN FUNCTION --------------------------------------------
roll <- function() {
  die  <- 1:6
  dice <- sample(die, size = 2, replace = TRUE)
  sum(dice)                 # a function returns its LAST line
}

roll()
roll()

# YOUR TURN: rewrite it so the die is an argument with a default of 1:6,
# then roll a pair of 20-sided dice.
# roll2 <- function(die = ...) { ... }


# 7. ROLL IT 10,000 TIMES -----------------------------------------------
replicate(10, roll())

rolls <- replicate(10000, roll())
hist(rolls, breaks = 1.5:12.5, col = "grey80",
     main = "10,000 rolls of FAIR dice", xlab = "Sum of two dice")
table(rolls)
mean(rolls)                 # about 7

# 8. WEIGHT THE DICE ----------------------------------------------------
# sample() has one more argument: prob. One probability per value; must sum to 1.
# A fair die:
sample(1:6, size = 2, replace = TRUE, prob = c(1/6, 1/6, 1/6, 1/6, 1/6, 1/6))

# YOUR TURN: make the 6 come up half the time, the other five 1/10 each.
# Fill in the six probabilities below (they must sum to 1), then run the block.
roll <- function() {
  die  <- 1:6
  dice <- sample(die, size = 2, replace = TRUE,
                 prob = c(1/6, 1/6, 1/6, 1/6, 1/6, 1/6))   # <-- CHANGE THESE
  sum(dice)
}

rolls <- replicate(10000, roll())
hist(rolls, breaks = 1.5:12.5, col = "indianred",
     main = "10,000 rolls of WEIGHTED dice", xlab = "Sum of two dice")
table(rolls)
mean(rolls)                 # compare with the 7 you got before

# 9. CHALLENGES ---------------------------------------------------------
# 1. Write roll_n(), which rolls n fair dice (default 2) and returns the sum.
# 2. Weight a die so 1 NEVER comes up and the other five are equally likely.
#    Roll 10,000 times and check with table() that no 1s appear.
# 3. The dice above average about 9. Push the average roll to 10.
#    How high could it possibly go?
