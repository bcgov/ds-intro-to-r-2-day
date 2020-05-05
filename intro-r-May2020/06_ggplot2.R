######### Creating Publication-Quality Graphics with ggplot2 ############


## Getting started ---------------------------------------------------------




## Challenge 1 -------------------------------------------------------------

# Modify the example so that the figure shows how life expectancy has
# changed over time:

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
geom_point()

# Hint: the gapminder dataset has a column called "year", which should appear
# on the x-axis.

## Challenge 2 --------------------------------------------------------------

# In the previous examples and challenge we've used the `aes` function to tell
# the scatterplot **geom** about the **x** and **y** locations of each point.
# Another *aesthetic* property we can modify is the point *colour*. Modify the
# code from the previous challenge to **colour** the points by the "continent"
# column. What trends do you see in the data? Are they what you expected?



# Vectors and Type Coercion -----------------------------------------------




# Data Frames -------------------------------------------------------------




# Factors -----------------------------------------------------------------




# Lists -------------------------------------------------------------------
