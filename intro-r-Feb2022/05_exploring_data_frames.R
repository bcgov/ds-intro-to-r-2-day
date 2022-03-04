############### Exploring Data Frames ###############

library(readr)
cats <- read_csv("data/feline-data.csv")

# We can find the size and various other attributes of our data with a few handy functions:
nrow(cats)
ncol(cats)
dim(cats)
names(cats)
str(cats)
summary(cats)
names(cats) <- c("cat1","cat2","cats3")

# Introducing the Gapminder data ------------------------------------------

gapminder <- read_csv("data/gapminder_data.csv")

#### Challenge 1 ----------------------------------------------------------

## How many rows and columns does `gapminder` have?
nrow(gapminder)
ncol(gapminder)
dim(gapminder)

## What kind of data is in the `pop` and `continent` columns?
str(gapminder)
summary(gapminder)
typeof(gapminder$pop)
typeof(gapminder$continent)

#### -----------------------------------------------------------------------

# The first thing we should always do is check out what the data looks like with str() or summary()
str(gapminder)
summary(gapminder)
head(gapminder)
head(gapminder, 10)
head(gapminder, 25)


unique(gapminder$continent)

tail(gapminder)

# Basic Subsetting --------------------------------------------------------

# my_data_frame[row_n, col_n]
gapminder[1,]
gapminder[100:110,]
gapminder[c(1,3,5,7),]

#### Challenge 2 ------------------------------------------

## It's good practice to also check the last few lines of your data and some in the middle.
## How would you do this?

tail(gapminder)

nrow(gapminder)
gapminder[1700:1704, ]
gapminder[c(322,400,1506),]

gapminder[sample(1:nrow(gapminder), 5), ]

# ----------------------------------------------------------------------------

#It’s unlikely that you’ll select rows directly though, you’ll usually want to use some criteria.
# Say we just wanted the rows from Asia:
gapminder[gapminder$continent == "Asia",]
asia_africa <- gapminder[gapminder$continent %in% c("Asia", "Africa"),]

#If we wanted to select a subset of columns, we can specify that in the
#second position using a character vector of column names:
gapminder[,c("country", "lifeExp")]

#### Challenge 3 -------------------------------------------------------

## Select all the rows in `gapminder` with data from 1975 and earlier
gapminder[gapminder$year <= 1975,]

#-----------------------------------------------------------------------

#### Challenge 4 -------------------------------------------------------

## Select all the rows in `gapminder` with data from Canada,
## and just the columns year, pop, and gdpPercap

gapminder[gapminder$country == "Canada", c("year", "pop", "gdpPercap")]

#alternatively:
cols <- c("year", "pop", "gdpPercap")
mycountry <- "Canada"
gapminder[gapminder$country == mycountry, cols]
