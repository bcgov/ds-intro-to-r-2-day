######### Exploring the basic data structures in R ############


# Reading data with the 'readr' package -----------------------------------
# install.packages("readr") ## Don't need to install every time
library(readr)

cats <- read_csv("data/feline-data.csv")

# observe individual columns
cats$coat
cats$weight

# add 0.5 to the weights
cats$weight + 0.5

# we can assign this backto the weight column:
cats$weight <- cats$weight + 0.5

# This causes an error because weight (numeric) + coat (character) doesn't make sense
cats$weight + cats$coat

# This coerces weight to be a character and pastes together a sentence for each row
paste("My", cats$coat, "cat weighs", cats$weight)

# Data Types --------------------------------------------------------------
typeof(cats$weight)

typeof(cats$coat)

typeof(TRUE)
typeof(FALSE)

# Comparisons (==, >, <, >=, <=) create logical values (TRUE/FALSE)
cats$weight > 3

cats$coat == "calico"

# Vectors and Type Coercion -----------------------------------------------


x <- c(2, 5, "3")
typeof(x)

y <- c(0, TRUE)
typeof(y)
c("a", FALSE)

typeof(5L)

# Converting types explicitly 
as.character(7)
as.character(TRUE)
as.numeric("5")
as.integer(5.6)
as.logical(1)
as.logical(0)

cats$likes_string <- as.logical(cats$likes_string)

# Data Frames -------------------------------------------------------------




# Missing Values ----------------------------------------------------------

cats$tail_length <- c(27.5, NA, 31)
typeof(cats$tail_length)



#### Challenge 1
##
## What is the average tail length of our cats? (Hint, use the `mean` function)
## Did you run into any issues? Can the help file for `mean` guide you?

mean(cats$tail_length, na.rm = TRUE)

# Factors -----------------------------------------------------------------

##### Challenge 2
##
## Look at the help for `?read_csv` to figure out how to control what data type
## each column is read as. Then write a command so that `coat` is read as a
## factor, and `likes_string` is read as a logical



# Lists -------------------------------------------------------------------




# Matrices ----------------------------------------------------------------

