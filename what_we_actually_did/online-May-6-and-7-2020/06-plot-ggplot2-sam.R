library(bcdata)

bcdc_get_data('3d2318d4-8f5d-4208-88f5-995420d7c58f', 
              resource = 'ed17f111-fb39-46b3-89aa-5375592fbb01')


bcdc_get_data('3d2318d4-8f5d-4208-88f5-995420d7c58f', 
              resource = 'ed17f111-fb39-46b3-89aa-5375592fbb01',
              sheet = "1")


bcdc_browse('3d2318d4-8f5d-4208-88f5-995420d7c58f')

library(bcdata)
library(dplyr)

lib_raw <- bcdc_get_data('3d2318d4-8f5d-4208-88f5-995420d7c58f',
                         resource = 'ed17f111-fb39-46b3-89aa-5375592fbb01')

lib_tidy <- lib_raw %>%
  select(`Library System`, Location, City, num_books = "460x Total branch physical materials, volumes held")


sum_books <- lib_tidy %>% 
  group_by(City, `Library System`) %>% 
  summarize(total_books = sum(num_books))


sum_books <- lib_tidy %>% 
  group_by(City, `Library System`) %>% 
  summarize(total_books = sum(num_books))


library(ggplot2)
library(ggthemes)

sum_books %>% 
  filter(total_books > 100000) %>% 
  ggplot(mapping = aes(x = total_books, y = City, fill = `Library System`)) +
  geom_col() +
  theme_fivethirtyeight() +
  labs(x = NULL,
       y = NULL,
       title = "Total Number of Books by City & Library System in B.C.",
       caption = "Data sourced from the B.C. Data Catalogue")



sum_books %>% 
  filter(total_books > 100000) %>% 
  ggplot(aes(total_books, `Library System`, fill = City)) +
  geom_col(colour = 'black') +
  scale_fill_viridis_d() +
  theme_minimal() +
  labs(x = NULL,
       y = NULL,
       title = "Total Number of Books by City & Library System in B.C.",
       caption = "Data sourced from the B.C. Data Catalogue")



