#########  Data Structures #########




## The *readr* package
## ----------------------------------------------------------------------


  
  
## Say we discovered that the scale weighs 500g light:
## ----------------------------------------------------------------------


  

## Data Types 
## ----------------------------------------------------------------------


  
  
## Vectors and Type Coercion 
## ----------------------------------------------------------------------


  
### Discussion 1 
# Why is R so opinionated about what we put in our columns of data?
# How does this help us?

  
  
  
## Data Frames 
## ----------------------------------------------------------------------


  
  
## Missing values 
## ----------------------------------------------------------------------


  
  
#### Challenge 1
# What is the average tail length of our cats? 
# (Hint, use the `mean` function)
# Did you run into any issues? Can the help file for `mean` guide you?

  
  

## Factors 
## ----------------------------------------------------------------------

  
  

#### Challenge 2
# Look at the help for `?read_csv` to figure out how to control what data type 
# each column is read as. Then write a command so that `coat` is read as a
# factor, and `likes_string` is read as a logical

  
  

## Lists 
## ----------------------------------------------------------------------




#### Challenge 3
# There are several subtly different ways to call variables, observations and
# elements from data.frames:

# - `cats[1]`
# - `cats[[1]]`
# - `cats$coat`
# - `cats["coat"]`
# - `cats[1, 1]`
# - `cats[, 1]`
# - `cats[1, ]`

# Try out these examples and explain what is returned by each one.
# *Hint:* Use the function `typeof()` to examine what is returned in each case.




## Matrice
## ----------------------------------------------------------------------




#### Challenge 4
# What do you think will be the result of
# `length(matrix_example)`?
# Try it.
# Were you right? Why / why not?

  


  
#### Challenge 5
# Make another matrix, this time containing the numbers 1:50,
# with 5 columns and 10 rows.
# Did the `matrix` function fill your matrix by column, or by
# row, as its default behaviour?
# See if you can figure out how to change this.
# (hint: read the documentation for `matrix()`!)




#### Challenge 6
# Create a list of length two containing a character vector for each of the sections in this part of the workshop:

#  - Data types
#  - Data structures

#  Populate each character vector with the names of the data types and data
#  structures we've seen so far.




#### Challenge 7
# Consider the R output of the matrix below:

# matrix(c(4, 1, 9, 5, 10, 7), ncol = 2, byrow = TRUE)

# What was the correct command used to write this matrix? Examine
# each command and try to figure out the correct one before typing them.
# Think about what matrices the other commands will produce.

# 1. `matrix(c(4, 1, 9, 5, 10, 7), nrow = 3)`
# 2. `matrix(c(4, 9, 10, 1, 5, 7), ncol = 2, byrow = TRUE)`
# 3. `matrix(c(4, 9, 10, 1, 5, 7), nrow = 2)`
# 4. `matrix(c(4, 1, 9, 5, 10, 7), ncol = 2, byrow = TRUE)`


