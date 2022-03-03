library(readr) # load the readr library for the read_csv function

# read in our data
cats <- read_csv("data/feline-data.csv")

# My scale was off by -500g
cats$weight <- cats$weight + 0.5

# convert numeric 'likes_string' to logical
cats$likes_string <- as.logical(cats$likes_string)

# write out new file
write_csv(cats, file = "new-cats.csv")
