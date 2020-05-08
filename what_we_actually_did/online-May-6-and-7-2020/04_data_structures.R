######### Exploring the basic data structures in R ############


# Reading data with the 'readr' package -----------------------------------
library(readr)

# read csv files in with read_csv
cats <- read_csv("data/feline-data.csv")

cats

# Pull out individual columns with $
cats$coat
cats$weight

cats$weight + 2

paste("My", cats$coat, "cat weighs", cats$weight, "kg")

cats$weight + cats$coat

# Data Types --------------------------------------------------------------

# four main types:
# double/numeric
# integer
# logical (TRUE/FALSE)
# character
# complex

typeof(1.5)

typeof(1L)

typeof(283)
typeof(283L)

typeof(TRUE)

typeof("banana")

# Find out what type of data structure an object is
class(cats)

# Vectors and Type Coercion -----------------------------------------------

my_vector <- c(1, 3, 5, 7, 9)
my_vector

my_vector > 4

hogwarts_students <- c("Harry", "Ron", "Hermione", 6)
hogwarts_students
class(hogwarts_students)

# Type coercion
as.character(6)
as.numeric("Ginny")

cats$likes_string <- as.logical(cats$likes_string)

# Data Frames -------------------------------------------------------------

factor(cats$coat)



# Factors -----------------------------------------------------------------

##### Challenge 1
##
## Look at the help for `?read_csv` to figure out how to control what data type
## each column is read as. Then write a command so that `coat` is read as a
## factor, and `likes_string` is read as a logical
read_csv("data/feline-data.csv", col_types = "fdl")

read_csv("data/feline-data.csv", 
         col_types = cols(   
           coat = col_factor(),
           weight = col_double(),
           likes_string = col_logical()
         )
)

cats2 <- .Last.value

cats2$coat
cats2$likes_string

# Lists -------------------------------------------------------------------




# Matrices ----------------------------------------------------------------

