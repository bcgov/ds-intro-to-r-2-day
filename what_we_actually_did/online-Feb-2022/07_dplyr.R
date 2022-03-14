# Dataframe Manipulation with dplyr

# Load readr to read in the data
library(readr)
gapminder <- read_csv("data/gapminder_data.csv")

mean(gapminder$gdpPercap)

## The `dplyr` package

# install.packages("dplyr")
library(dplyr)





## Using select()

year_country_gdp <- select(gapminder, year, country, gdpPercap)





## Using filter()

filter(gapminder, continent == "Europe")
filter(gapminder, pop > 1000000)





## Using filter() with pipes

gapminder %>% 
  filter(continent == "Europe") %>% 
  select(year, country, gdpPercap) 




## Challenge 1
## Write a single command (which can span multiple lines and includes pipes)
## that will produce a dataframe that has the African values for lifeExp,
## country and year, but not for other Continents. How many rows does your
## dataframe have and why?
gapminder %>% 
  filter(continent == "Africa") %>% 
  select(year, life_exp = lifeExp, country)

# You can also combine more than one criteria in a filter call:
gapminder %>% 
  filter(continent == "Africa", 
         lifeExp >= 50, 
         year < 1990, 
         grepl("^A", country)) %>% 
  select(year, life_exp = lifeExp, country)






## Using group_by() and summarize()

gapminder %>% 
  filter(continent %in% c("Africa", "Europe")) %>% 
  group_by(continent, year) %>% 
  summarise(mean_gdp_per_cap = mean(gdpPercap), .groups = "drop")





## Using summarize()

gapminder %>% 
  group_by(continent, year) %>% 
  summarize(mean_gdp_percap = mean(gdpPercap), .groups = "drop")





## Challenge 2
## Calculate the average life expectancy per country. Which has the longest average life
## expectancy and which has the shortest average life expectancy?

# A data frame of mean life expectancy per country
gap_mean_lifeexp_per_country <- gapminder %>% 
  group_by(country) %>% 
  summarise(mean_life_exp = mean(lifeExp)) %>% 
  arrange(mean_life_exp) # sort data by lifeExp


head(gap_mean_lifeexp_per_country) # use head to see first 6 rows (lowest mean lifeExp)
tail(gap_mean_lifeexp_per_country) # use tail to see last 6 rows (highest mean lifeExp)

# summarize further to get max  and min lifeExp
gapminder %>% 
  group_by(country) %>% 
  summarise(mean_life_exp = mean(lifeExp)) %>% 
  summarise(max_mean_life_exp = max(mean_life_exp), 
            min_mean_life_exp = min(mean_life_exp))

# Use filter to find the rows where mean life exp is equal to the maximum OR 
# the minimum. Use the | symbol for OR
gapminder %>% 
  group_by(country) %>% 
  summarise(mean_life_exp = mean(lifeExp)) %>% 
  filter(mean_life_exp == max(mean_life_exp) | mean_life_exp == min(mean_life_exp))


# ?format # use to format numbers for presentation


## Combine multiple statements in summarize

# calculate mean and sd for gdp per-capita and population
gap_by_continent_year <- gapminder %>% 
  group_by(continent, year) %>% 
  summarize(mean_gdp_per_cap = mean(gdpPercap), 
            sd_gdp_per_cap = sd(gdpPercap), 
            mean_pop = mean(pop), 
            sd_pop = sd(pop))


## Using count()

gapminder %>% 
  filter(year == 2002) %>% 
  count(continent, sort = TRUE)

contint_by_year_count <- gapminder %>% 
  count(continent, year)

# ?n_distinct for counting unqiue observations or combinations of observations
# in a data.frame



## Using mutate()

# Calculate total gdp in billions of dollars 

gdp_by_continent_year <- gapminder %>% 
  mutate(gdp_billion = (gdpPercap * pop) / 10e9) %>% 
  group_by(continent, year) %>% 
  summarise(mean_gdp_billion = mean(gdp_billion), 
            sd_gdp_billion = sd(gdp_billion))


### Challenge 3
## Calculate the total GDP per country and year. Which country, and in what year,
## had the highest total GDP?

gdp_country_year <- gapminder %>% 
  mutate(total_gdp = pop * gdpPercap) %>% 
  filter(total_gdp == max(total_gdp))

gapminder %>% 
  mutate(total_gdp = pop * gdpPercap) %>% 
  group_by(country, year) %>% 
  summarise(total_gdp = sum(total_gdp)) %>% 
  filter(total_gdp == max(total_gdp)) %>% 
  ungroup()


# Use mutate after group_by to perform row-level calculations within each group, 
# for example comparing a countries gdp to the mean gdp of the continent 
# in which that country occurs
gap_max_country_gdp_continent_year <- gapminder %>% 
  group_by(continent, year) %>% 
  mutate(gdp_billions = gdpPercap * pop / 10e9, 
         is_gdp_max = gdp_billions == max(gdp_billions)) %>% 
  filter(is_gdp_max)






## Connect mutate with logical groupings: ifelse

# (See course website)







## Combining `dplyr` and `ggplot2`

library(ggplot2)

oceania_countries <- gapminder %>% 
  filter(continent == "Oceania")

ggplot(oceania_countries, mapping = aes(x = year, y = lifeExp, color = country)) +
  geom_line() + 
  facet_wrap(vars(country))

# ?scale_y_continuous to format the y scale (breaks, labels, limits etc.)


# ## Advanced Challenge
#
# Calculate the average life expectancy in 2002 of 2 randomly selected countries
# for each continent. Then arrange the continent names in reverse order.
# **Hint:** Use the `dplyr` functions `arrange()` and `sample_n()`, they have
# similar syntax to other dplyr functions.

gapminder %>% 
  filter(year == 2002) %>% 
  group_by(continent) %>% 
  sample_n(2) %>% 
  arrange(desc(continent))
