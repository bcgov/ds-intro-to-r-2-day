## Introduction to R and R-studio

# 2.6  using R as a Calculator

1 + 100

1 +



# Order of operations

3 + 5 * 2


(3 + 5) * 2


# we can use a hash to add comments
# there may also be a colour change
# anything after the hash is ignored for that line


2/1000


2/10000

# this is the same as 2 * 10(^4)

# we can also write this format

5e3

# note there is no minus here - be careful!

5e-3




# 2.7 : Matematical Functions ---------------------------------------------


sum(1,2,3,4,5)

log(10) # natural log


log10(10) # base-10 logarithm

## how to find help

## GOOGLE
## autocompletion

log

?log


# 2.8 : Comparing things ----------------------------------------------------


1 == 1


1 != 2


1 < 3

1 <= 1




# 2.9 Variables and assignment --------------------------------------------


x <- 5

# nothing printed but saved for later.

x


log(x)

x <- 100
x

x <- x + 1
x

y <- x * 2


# naming variables

# YES - can contain letters, numbers underscores

# NO to numbers at the start, spaces


#Be consistent!


x = 100
x <- 101
x = 100


## CHALLANGE 1:


min_height <- 1
max.height <- 1

_age <- 1  # doesnt work
.mass <-1  # works but hidden

MaxLength <-1
min-length <-1  # doesnt work
2widths <-1     # doesnt work
celsius2kelvinma <- 1





# 2.10 Vectors ------------------------------------------------------------

#vector: set of values of certain order of same data type

1:5

2 * (1:5)


y <- c(1, 3, 5, 7, 9)
y



# 2.11 Managing your environment ------------------------------------------

ls()

rm(X)

rm(list = ls())







# 2.12 R Packages ---------------------------------------------------------


installed.packages()


install.packages("dplyr")

update.packages("dplyr")


remove.packages()


# list will populate
library(a)



