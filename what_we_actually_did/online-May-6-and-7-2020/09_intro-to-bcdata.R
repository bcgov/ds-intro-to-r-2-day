#################### Introduction to bcdata ################################


## Getting started ---------------------------------------------------------
# install.packages("bcdata") #if not already installed

#load library
library(bcdata)
# library("bcdata") #this works too however


## Searching the B.C. Data Catalogue ---------------------------------------


#search the B.C. Data Catalogue for words public & libraries 
bcdc_search("public libraries")


## Importing data from the B.C. Data Catalogue -----------------------------

#can use human-readable name of ther ecord; this will work interactively
bcdc_get_data("bc-public-libraries-systems-branches-and-locations")


#using the unique ID and specifying which data reosource to load
lib_raw <- bcdc_get_data('3d2318d4-8f5d-4208-88f5-995420d7c58f',
              resource = 'ed17f111-fb39-46b3-89aa-5375592fbb01')


## Challenge 1 --------------------------------------------------------------

# Take a few minutes to search the B.C. Data Catalogue for data sets for a
# different topic. Identify and import one tabular data set into your R session
# (e.g. a CSV or XLS resource).



## Practice manipulating data with dplyr  -----------------------------------

#load dplyr library
library(dplyr)


#check column names
names(lib_raw)


#select columns we want
lib_tidy <- lib_raw %>% 
  select(`Library System`, Location, `460x Total branch physical materials, volumes held`)


#select columns we want and rename one column
lib_tidy <- lib_raw %>% 
  select(`Library System`, Location, City, num_books = `460x Total branch physical materials, volumes held`)


#summarise number of books by City and Library System
sum_books <- lib_tidy %>% 
  group_by(City, `Library System`) %>% 
  summarise(total_books = sum(num_books))


## Challenge 2 ---------------------------------------------------------------

# Using dplyr, determine the total number of books within each
# Library System in British Columbia.


#solution
sum_books %>% 
 group_by(`Library System`) %>% 
 summarize(totals = sum(total_books))


## Practice plotting data with ggplot2 ---------------------------------------

#load library
library(ggplot2)


#summarize and plot in same code chunk, assign plot to object sum_books
sum_books <- lib_tidy %>% 
  group_by(City, `Library System`) %>% 
  summarise(total_books = sum(num_books)) %>% 
  ggplot(mapping = aes(City, total_books)) +
  geom_col()


#summarize and plot in same code chunk with horizontal columns
lib_tidy %>% 
  group_by(City, `Library System`) %>% 
  summarise(total_books = sum(num_books)) %>% 
  ggplot(mapping = aes(total_books, City)) +
  geom_col()


#same but only for Cities with > 100000 books
lib_tidy %>% 
  group_by(City, `Library System`) %>% 
  summarise(total_books = sum(num_books)) %>% 
  filter(total_books > 100000) %>% 
  ggplot(mapping = aes(total_books, City)) + 
  geom_col()


## Challenge 3 ---------------------------------------------------------------

# Iterate the above plot to include information on the number of books
# by Library Service. Add a title to the plot. Try other design changes
# to make the plot more readable.


#summarize data
sum_books <- lib_tidy %>% 
  group_by(City, `Library System`) %>% 
  summarise(total_books = sum(num_books))


#bar chart
sum_books %>% 
  filter(total_books > 100000) %>% 
  ggplot(aes(total_books, City)) +
  geom_col()


#bar chart with bars coloured by Library System
sum_books %>% 
  filter(total_books > 100000) %>% 
  ggplot(aes(total_books, City, fill = `Library System`)) +
  geom_col()


#bar chart with small panels by Library System
sum_books %>% 
  filter(total_books > 100000) %>% 
  ggplot(aes(total_books, City,)) +
  geom_col() +
  facet_wrap(facets = vars(`Library System`))


####   DEMO  #####
## Using `bcdata` with spatial data in the B.C. Data Catalogue ----------------

library(bcdata) # import data
library(dplyr) # tidy data
library(ggplot2) # plot data


#load & tidy tabular data from BCDC 
lib_tab <- bcdc_get_data('3d2318d4-8f5d-4208-88f5-995420d7c58f',
              resource = 'ed17f111-fb39-46b3-89aa-5375592fbb01') %>% 
  select(`Library System`, Location, City, num_books = `460x Total branch physical materials, volumes held`)


#load the spatial data from BCDC
lib_spatial <- bcdc_query_geodata("bc-public-libraries-systems-branches-and-locations") %>%
  collect()


#join the spatial & tabular data
lib_all <- lib_spatial %>% 
  left_join(lib_tab,
            by = c("SERVICE_POINT_NAME" = "Location")) %>% 
  select(SERVICE_POINT_NAME, num_books) 


#use the geom_sf() layer to make a ggplot2 plot
lib_all %>% 
  ggplot() +
  geom_sf(aes(size = num_books)) +
  theme_minimal()


#use the mapview R package to make a quick interactive map
#install.packages("mapview")
library(mapview)
mapview(lib_all)



