# Dataframe Manipulation with dplyr
library("readr")
gapminder <- read_csv("data/gapminder_data.csv")

## Contrast a data.frame with a tibble
as.data.frame(gapminder)


## The `dplyr` package

install.packages("dplyr")

## select
## filter
## group_by
## summarize
## mutate


## Load the package
library(dplyr)




## Using select()

gapminder

year_country_gdp <- select(gapminder, year, country, gdpPercap)


## Using filter()

filter(gapminder, continent == "Europe")


### filtering with a character vector

asia <- filter(gapminder, continent == "Asia")
europe <- filter(gapminder, continent == "Europe")

### filtering with a numberic vector
filter(gapminder, pop > 1000000)
filter(gapminder, pop >= 1000000)

## Using select() with pipes
gapminder %>% select(year, country, gdpPercap)
select(gapminder, year, country, gdpPercap)

## Using filter() with pipes
## %>%
filter(gapminder, continent == "Europe")

gapminder %>% filter(continent == "Europe")


### Combining multiple statements
gapminder %>%
  filter(continent == "Europe") %>%
  select(country, year)

year_country_gdp_euro <- gapminder %>%
  filter(continent == "Europe") %>%
  select(year, country, gdpPercap)

gapminder %>%
  filter(continent == "Europe") %>%
  select(year, country, gdpPercap)

## Challenge 1
## Write a single command (which can span multiple lines and includes pipes)
## that will produce a dataframe that has the African values for lifeExp,
## country and year, but not for other Continents. How many rows does your
## dataframe have and why?



## Using group_by() and summarize()


gapminder %>%
  group_by(continent)



## Using summarize()

gapminder %>%
  group_by(continent) %>%
  summarize(mean_gdpPercap = mean(gdpPercap))



# ## Challenge 2
#
#
# Calculate the average life expectancy per country. Which has the longest average life
# expectancy and which has the shortest average life expectancy?


lifeExp_bycountry <- gapminder %>%
  group_by(country) %>%
  summarize(mean_lifeExp = mean(lifeExp)) %>%
  filter(mean_lifeExp == min(mean_lifeExp) | mean_lifeExp == max(mean_lifeExp))


## Summarize

gapminder %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop))

## Using count()


gapminder %>%
  filter(year == 2002) %>%
  count(continent)


gapminder %>%
  filter(lifeExp > 70) %>%
  count(continent)

gapminder %>%
  count(year)




## Using mutate()

gapminder <- read_csv("data/gapminder_data.csv")

gapminder <- gapminder %>%
  mutate(gdp_billion = gdpPercap*pop/10^9)

gapminder <- gapminder %>%
  select(-gdp_billion)

gapminder_billion <- gapminder %>%
  mutate(gdp_billion = gdpPercap*pop/10^9)


gapminder %>%
  mutate(gdp_billion = (gdpPercap*pop)/10^9)


gapminder %>%
  mutate(gdp_billion = (gdpPercap*pop+10)/10^9)





## Combining `dplyr` and `ggplot2`
library(ggplot2)
library(readr)

## good :)
a_countries <- gapminder %>%
  filter(country %in% c("Afghanistan", "Albania", "Algeria", "Angola", "Argentina",
                        "Australia", "Austria"))

## bad :(
a_countries <- gapminder %>%
  filter(country == c("Afghanistan", "Albania", "Algeria", "Angola", "Argentina",
                        "Australia", "Austria"))




## A simple ggplot
gapminder <- read_csv("data/gapminder_data.csv")

ggplot(data = a_countries, aes(x = year, y = lifeExp, colour = continent)) +
  geom_line() +
  facet_wrap(vars(country))




# ## Advanced Challenge
#
# Calculate the average life expectancy in 2002 of 2 randomly selected countries
# for each continent. Then arrange the continent names in reverse order.
# **Hint:** Use the `dplyr` functions `arrange()` and `sample_n()`, they have
# similar syntax to other dplyr functions.
