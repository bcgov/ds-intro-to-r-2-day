######### Creating Publication-Quality Graphics with ggplot2 ############


## Getting started ---------------------------------------------------------
#install.packages("ggplot2")

#load library
library(ggplot2)

#read in the data from /data folder
library(readr)
gapminder <- read_csv("data/gapminder_data.csv")


#remove an object you no longer want/need
rm(cats)


#first plot with ggplot2
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y= lifeExp)) +
  geom_point()


#this code will only make a blank plot, no geom
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y= lifeExp))


## Challenge 1 -------------------------------------------------------------

# Modify the example so that the figure shows how life expectancy has
# changed over time:
#
# Hint: the gapminder dataset has a column called "year", which should appear
# on the x-axis.


#example
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
geom_point()


#solution
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp)) +
geom_point()



## Challenge 2 --------------------------------------------------------------

# In the previous examples and challenge we've used the `aes` function to tell
# the scatterplot **geom** about the **x** and **y** locations of each point.
# Another *aesthetic* property we can modify is the point *colour*. Modify the
# code from the previous challenge to **colour** the points by the "continent"
# column. What trends do you see in the data? Are they what you expected?

#code from previous challenge
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y= lifeExp)) +
  geom_point()


#solution
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, colour = continent)) +
geom_point()


#colour set to a value (points) rather than mapped as an aesthetic
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp)) +
geom_point(colour = "blue")



## Layers ----------------------------------------------------------------

#geom_point
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, colour = continent)) +
geom_point()


#geom_line
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, colour = continent)) +
geom_line()


#geom_line with a group aesthetic
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, colour = continent,
                                       group = country)) +
geom_line()


#geom_line & geom_point with a group aesthetic
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, colour = continent, group = country)) +
  geom_line() +
  geom_point()


#mapping can be done globally in ggplot() or locally in each geom_*()
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, group = country)) +
  geom_line(mapping = aes(colour = continent)) +
  geom_point()


#colour set to a value (lines) instead of mapped as an aesthetic
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, group = country)) +
  geom_line(colour = "pink") +
  geom_point()



## Challenge 3  -----------------------------------------------------------

# Switch the order of the point and line layers from the previous example.
# What happened?


#solution
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, group = country)) +
 geom_point() +
 geom_line(mapping = aes(colour = continent))



## Transformations and statistics ------------------------------------------

#start with the original plot
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point() 


#use alpha for changing point transparency
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5)


#change the x-axis scale to log10
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) +
  scale_x_log10()


#add geom_smooth (linear model)
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) +
  scale_x_log10() +
  geom_smooth(method = "lm", size = 2)


## Challenge 4a ------------------------------------------------------------

# Modify the colour and size of the points on the point layer in the previous
# example.
#
# Hint: do not use the `aes` function.



## Challenge 4b ------------------------------------------------------------

# Modify your solution to Challenge 4a so that the points are now a different
# shape and are coloured by continent with new trendlines.
#
# Hint: The colour argument can be used inside the aesthetic.



## Multi-panel figures -------------------------------------------------------


#starting again with this plot
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, group = country)) +
  geom_line(mapping = aes(colour = continent))


#read in a smaller data set (we will learn how to do this with dplyr tomorrow)
asia_oceania <- read_csv("data/gapminder_asia_oceania.csv")


#use facet_wrap() to make mulit-panels for each country in the variable country
ggplot(data = asia_oceania, mapping = aes(x = year, y = lifeExp)) +
  geom_line() +
  facet_wrap(facets = vars(country))


## Modifying text  -----------------------------------------------------------


#add labels with labs() and use built in theme and theme() to change text
ggplot(data = asia_oceania, mapping = aes(x = year, y = lifeExp, colour = continent)) +
  geom_line() +
  facet_wrap(facets = vars(country)) +
  labs(
    x = "Year",
    y = "Life Expectancy",
    title = "Figure 1"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(size = 5),
        plot.title = element_text(face = "bold"))


## Exporting the plot  -------------------------------------------------------


#assign plot to object
lifeExp_plot <- ggplot(data = asia_oceania, mapping = aes(x = year, y = lifeExp, colour = continent)) +
  geom_line() +
  facet_wrap(facets = vars(country)) +
  labs(
    x = "Year",
    y = "Life Expectancy",
    title = "Figure 1"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(size = 5),
        plot.title = element_text(face = "bold"))


#plot object
plot(lifeExp_plot)


#save to disk with ggsave()
ggsave(filename = "lifeExp.png", plot = lifeExp_plot, width = 13.3, height = 7, units = "cm")
ggsave(filename = "lifeExp.png", plot = lifeExp_plot)
