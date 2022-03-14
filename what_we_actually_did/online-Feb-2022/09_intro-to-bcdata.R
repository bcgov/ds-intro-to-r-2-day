#################### Introduction to bcdata ################################


## Getting started ---------------------------------------------------------

## install.packages("bcdata")

library(bcdata)
library(dplyr)
library(ggplot2)

## Searching the B.C. Data Catalogue ---------------------------------------

bcdc_search("public libraries")

## Get information on a record

bcdc_get_record("bc-public-libraries-systems-branches-and-locations")

## Importing data from the B.C. Data Catalogue -----------------------------

bcdc_get_data("bc-public-libraries-systems-branches-and-locations")

lib_raw <- bcdc_get_data(record = '3d2318d4-8f5d-4208-88f5-995420d7c58f', 
                         resource = 'ed17f111-fb39-46b3-89aa-5375592fbb01')

## Challenge 1 --------------------------------------------------------------

# Take a few minutes to search the B.C. Data Catalogue for data sets for a
# different topic. Identify and import one tabular data set into your R session
# (e.g. a CSV or XLS resource). Entering bcdc_browse() into the R console will
# open the catalogue page in your default web browser.

## this open a browser
bcdc_browse()

## how about wineries?
bcdc_get_data("bc-winery-locations")

## Practice manipulating data with dplyr  -----------------------------------

## Checkout the structure of the data
str(lib_raw)

## Which libraries are between (inclusive) 51 and 53 degrees latitude?
lib_tidy <- lib_raw %>% 
  filter(Latitude <= 53, Latitude >= 51) %>% 
  select(`Library System`, Location, City, num_books = `460x Total branch physical materials, volumes held`)

## Total number of books by City and Library System between 51N and 53N degree latitude
sum_books <- lib_tidy %>% 
  group_by(City, `Library System`) %>% 
  summarise(total_books = sum(num_books))


## Challenge 2 ---------------------------------------------------------------

# Using dplyr, determine the total number of books within each Library System
# between 51 and 53 degrees latitude in British Columbia.


sum_books %>% 
  group_by(`Library System`) %>% 
  summarise(totals = sum(total_books))

## Practice plotting data with ggplot2 ---------------------------------------

sum_books

## Basic plot
ggplot(sum_books, mapping = aes(x = total_books, y = City)) +
  geom_col()

## Using colour aesthetic
ggplot(sum_books, mapping = aes(x = total_books, y = City, colour = `Library System`)) +
  geom_col() +
  labs(x = "Total Books", y = "City of Interest", title = "Total Number of Books by City & Library System")

## Using fill aesthetic
ggplot(sum_books, mapping = aes(x = total_books, y = total_books, fill = `Library System`)) +
  geom_col() +
  labs(x = "Total Books", y = "City of Interest", title = "Total Number of Books by CIty & Library System")

## Challenge 3 ---------------------------------------------------------------

# Iterate the above plot to include information on the number of books
# by Library Service. Add a title to the plot. Try other design changes
# to make the plot more readable.

library(ggplot2)

sum_books %>% 
  ggplot(aes(x = total_books, y = City, fill = `Library System`)) +
  geom_col() +
  theme_minimal() +
  labs(x = NULL,
       y = NULL,
       title = "Total Number of Books by City & Library System in B.C.",
       caption = "Data sourced from the B.C. Data Catalogue")

## To order the y-axis by another variable we can use the forcats package: 
library(forcats)

sum_books %>% 
  ggplot(aes(x = total_books, y = fct_reorder(City, total_books), fill = `Library System`)) +
  geom_col() +
  theme_minimal() +
  labs(x = NULL,
       y = NULL,
       title = "Total Number of Books by City & Library System in B.C.",
       caption = "Data sourced from the B.C. Data Catalogue")



# Importing data from the B.C. Data Catalogue - Another Example -----------


# Challenge 4 -------------------------------------------------------------


seafood_prod <- bcdc_get_data(record = 'e591a756-6b99-4986-b8ce-f341bd47228f', 
                              resource = '9cc32dc4-bd9a-4baf-8210-770ac62d7985')

seafood_total <- seafood_prod %>% 
  filter(Year == 2020) %>% 
  group_by(`Species/Product`) %>% 
  summarise(value = sum(`Wholesale Value ($ million)`))

ggplot(seafood_total, mapping = aes(y = `Species/Product`, x = value, fill = `Species/Product`)) +
  geom_col()
