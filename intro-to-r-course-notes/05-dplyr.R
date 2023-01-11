#########  Manipulating Data Frames with dplyr #########

## Introducing the Gapminder data 
## ----------------------------------------------------------------------




#### Challenge 1
# How many rows and columns does `gapminder` have?
# What kind of data is in the `pop` and `continent` columns?




## The `dplyr` package
## ----------------------------------------------------------------------




## Using select()
## ----------------------------------------------------------------------




## Using filter()
## ----------------------------------------------------------------------




## Using filter() with pipes
## ----------------------------------------------------------------------




#### Challenge 2
# Write a single command (which can span multiple lines and includes pipes) that
# will produce a dataframe that has the African values for `lifeExp`, `country`
# and `year`, but not for other Continents.  How many rows does your dataframe
# have and why?




## Using group_by() and summarize() 
## ----------------------------------------------------------------------




## Using summarize() 
## ----------------------------------------------------------------------




#### Challenge 3
# Calculate the average life expectancy per country. Which has the longest average life
# expectancy and which has the shortest average life expectancy?
## Using count()
## ----------------------------------------------------------------------




## Using mutate() 
## ----------------------------------------------------------------------




#### Challenge 4
# Calculate the total GDP per contintent and year. Which continent, and in what year,
# had the highest total GDP?




## Connect mutate with logical groupings: ifelse ----------
## ----------------------------------------------------------------------



## Combining `dplyr` and `ggplot2`
## ----------------------------------------------------------------------




### Advanced Challenge 
# Calculate the average life expectancy in 2002 of 2 randomly selected countries
# for each continent. Then arrange the continent names in reverse order.
# **Hint:** Use the `dplyr` functions `arrange()` and `sample_n()`, they have
# similar syntax to other dplyr functions.




