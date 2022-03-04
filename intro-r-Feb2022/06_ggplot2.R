######### Creating Publication-Quality Graphics with ggplot2 ############
# install.packages("ggplot2")
library(ggplot2)
library(readr)

gapminder <- read_csv("data/gapminder_data.csv")

ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp)) +
  geom_point()

## Getting started ---------------------------------------------------------

#Let’s jump right into making an example scatter plot with geom_point()
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point()


## Challenge 1 -------------------------------------------------------------

# Modify the example so that the figure shows how life expectancy has
# changed over time:

ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp)) +
  geom_point()

# Hint: the gapminder dataset has a column called "year", which should appear
# on the x-axis.

# ---------------------------------------------------------------------------


## Challenge 2 --------------------------------------------------------------

# In the previous examples and challenge we've used the `aes` function to tell
# the scatterplot **geom** about the **x** and **y** locations of each point.
# Another *aesthetic* property we can modify is the point *colour*. Modify the
# code from the previous challenge to **colour** the points by the "continent"
# column. What trends do you see in the data? Are they what you expected?

#We can color by continent to see more interesting insights
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, color = continent)) +
  geom_point()

# ---------------------------------------------------------------------------



## Layers -------------------------------------------------------------------


#There are too many data points for each year/continent.
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, color = continent)) +
  geom_line()

#If we group by country, we can make one line per country
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, color = continent, group = country)) +
  geom_line() +

  #We can also move the color aesthetic to the line geom, the line geom still finds all the info it needs.
  ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, group = country)) +
  geom_line(mapping = aes(color = continent))

#Then we can add a point geom which "sees" no info on how to color the points.
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, group = country)) +
  geom_line(mapping = aes(color = continent)) +
  geom_point()

#We can color all the lines regardless of continent by removing color outside the aesthetic
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, group = country)) +
  geom_line(color="blue") +
  geom_point()


## Challenge 3  -----------------------------------------------------------

# Switch the order of the point and line layers from the previous example.
# What happened?
#
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, group = country)) +
  geom_point() +
  geom_line(color = "blue")

# -----------------------------------------------------------------------

## Transformations and statistics ---------------------------------------

#we can apply a scale transformation so the outliers are suppressed
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) +
  scale_x_log10()

#We can fit a simple relationship to the data by adding geom_smooth layer
# we can make the line thicker and adjust the confidence intervals
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, colour = continent)) +
  geom_point(alpha = 0.5) +
  scale_x_log10() +
  geom_smooth(method = "lm", size = 1.5, level = 0.95, se = TRUE)


## Challenge 4a ------------------------------------------------------------

# Modify the colour and size of the points on the point layer in the previous
# example.

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(size = 3, color = "orange") +
  scale_x_log10() +
  geom_smooth(method = "lm", size = 1.5, level = 0.95, se = TRUE)

# Hint: do not use the `aes` function.

# -----------------------------------------------------------------------

## Challenge 4b ------------------------------------------------------------

# Modify your solution to Challenge 4a so that the points are now a different
# shape and are colored by continent with new trendlines.

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, colour = continent)) +
  geom_point(size = 3, shape = 17) +
  scale_x_log10() +
  geom_smooth(method = "lm", size = 1.5, level = 0.95, se = TRUE)

# Hint: The color argument can be used inside the aesthetic.

# -----------------------------------------------------------------------


## Multi-panel figures --------------------------------------------------

# we will use a subset of the gapminder data to reduce the number continents we'll need to plot
asia_oceania <- gapminder[gapminder$continent %in% c("Asia", "Oceania"),]

#we produce multiple panes by facetting on the variable 'country'
ggplot(data = asia_oceania, mapping = aes(x = year, y = lifeExp, colour = continent)) +
  geom_line() +
  facet_wrap(facets = vars(country))


## Modifying text  ------------------------------------------------------
#the labs() function works with ggplot - it gives us a mechanism by which to add titles to our plot
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, colour = continent)) +
  geom_point(size = 3, shape = 17) +
  scale_x_log10() +
  geom_smooth(method = "lm", size = 1.5, level = 0.95, se = FALSE) +
  labs(
    x = "GDP Per Capita",
    y = "Life Expectancy",
    title = "My Plot"
  )

## Exporting the plot  ---------------------------------------------------

#save the plot in a object named 'myplot'
myplot <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, colour = continent)) +
  geom_point(size = 3, shape = 17) +
  scale_x_log10() +
  geom_smooth(method = "lm", size = 1.5, level = 0.95, se = FALSE) +
  labs(
    x = "GDP Per Capita",
    y = "Life Expectancy",
    title = "My Plot"
  )

#now we can save the plot by passing the object as an argument to ggsave
ggsave(filename = "myplot.png", plot = myplot, width = 18, height = 16, units = "cm")

