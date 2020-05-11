############### Exploring Data Frames ###############
library(readr)
cats <- read_csv("data/feline-data.csv", col_types = "fdl")

cats

dim(cats)
nrow(cats)
ncol(cats)

summary(cats)


# Introducing the Gapminder data ------------------------------------------


#### Challenge 1
##
## Read in the gapminder dataset using read_csv and assign it to a data frame
## called `gapminder`
##
## How many rows and columns does `gapminder` have?
##
## What kind of data is in the `pop` and `continent` columns?

gapminder <- read_csv("data/gapminder_data.csv")

dim(gapminder)
nrow(gapminder)
ncol(gapminder)

summary(gapminder)
str(gapminder)

class(gapminder$pop)
class(gapminder$continent)

class(gapminder)


#### Challenge 2
##
## It's good practice to also check the last few lines of your data.
## How would you do this? How would check the last 15 lines?
##
