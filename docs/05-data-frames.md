---
title: "Exploring Data Frames"
teaching: 20
exercises: 10
questions:
- "How can I manipulate a data frame?"
objectives:
- "Display basic properties of data frames including size and class of the columns, names, and first few rows."
- "Add and remove rows or columns."
- "Remove rows with `NA` values."
- "Append two data frames."
- "Understand what a `factor` is."
- "Convert a `factor` to a `character` vector and vice versa."
keypoints:
- "Read in a csv file using `readr::read_csv()`."
- "Use `str()`, `summary()`, `nrow()`, `ncol()`, `dim()`, `colnames()`, `rownames()`, `head()`, and `typeof()` to understand the structure of a data frame."
- "Understand the basics of subsetting data frames using `[]` and `$`"
source: Rmd
---

# Exploring Data Frames



At this point, you've seen it all: in the last lesson, we toured all the basic
data types and data structures in R. Everything you do will be a manipulation of
those tools. But most of the time, the star of the show is the data frame—the table that we created by loading information from a csv file. In this lesson, we'll learn a few more things
about working with data frames.


```r
library(readr)
cats <- read_csv("data/feline-data.csv")
```

```
Rows: 3 Columns: 3
── Column specification ────────────────────────────────────────────────────────
Delimiter: ","
chr (1): coat
dbl (2): weight, likes_string

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

We can find the size and various other attributes of our data with a few handy functions:


```r
nrow(cats)
```

```
[1] 3
```

```r
ncol(cats)
```

```
[1] 3
```

```r
dim(cats)
```

```
[1] 3 3
```


```r
names(cats)
```

```
[1] "coat"         "weight"       "likes_string"
```

```r
str(cats)
```

```
spec_tbl_df [3 × 3] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
 $ coat        : chr [1:3] "calico" "black" "tabby"
 $ weight      : num [1:3] 2.1 5 3.2
 $ likes_string: num [1:3] 1 0 1
 - attr(*, "spec")=
  .. cols(
  ..   coat = col_character(),
  ..   weight = col_double(),
  ..   likes_string = col_double()
  .. )
 - attr(*, "problems")=<externalptr> 
```

A way to get a nice overall view of a data frame is to use the `summary` function. This function can be used on various objects in R. For data frames, `summary` yields a numeric, tabular, or descriptive summary of each column. Factor columns are summarized by the number of items in each level, numeric or integer columns by the descriptive statistics (quartiles and mean), and character columns by its length, class, and mode.  


```r
summary(cats)
```

```
     coat               weight       likes_string   
 Length:3           Min.   :2.100   Min.   :0.0000  
 Class :character   1st Qu.:2.650   1st Qu.:0.5000  
 Mode  :character   Median :3.200   Median :1.0000  
                    Mean   :3.433   Mean   :0.6667  
                    3rd Qu.:4.100   3rd Qu.:1.0000  
                    Max.   :5.000   Max.   :1.0000  
```

A really nice feature of RStudio is that it allows us to view our data in a 
very readable and familiar way. Go ahead and click on the name of the `cats`
data frame in the environment pane.

Note that this is a read-only view, it's not editable (which is a good thing!)

## Introducing the Gapminder data

So far, you have seen the basics of manipulating data frames with our cat data;
now let's use those skills to digest a more realistic dataset. Let's read in the
`gapminder` dataset that we downloaded previously:

> ## Challenge 1
>
> Read in the gapminder dataset using read_csv and assign it to a data frame
> called `gapminder`:
>
> 
> ```r
> gapminder <- read_csv("data/gapminder_data.csv")
> ```
> 
> ```
> Rows: 1704 Columns: 6
> ── Column specification ────────────────────────────────────────────────────────
> Delimiter: ","
> chr (2): country, continent
> dbl (4): year, pop, lifeExp, gdpPercap
> 
> ℹ Use `spec()` to retrieve the full column specification for this data.
> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
> ```
>
> Then tell me how many rows and columns `gapminder` has:
> 
> 
> ```r
> dim(gapminder)
> ```
> 
> ```
> [1] 1704    6
> ```
> 
> ```r
> nrow(gapminder)
> ```
> 
> ```
> [1] 1704
> ```
> 
> ```r
> ncol(gapminder)
> ```
> 
> ```
> [1] 6
> ```
> 
> And tell me what kind of data is in the `pop` and `continent` columns
> 
> 
> ```r
> str(gapminder)
> ```
> 
> ```
> spec_tbl_df [1,704 × 6] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
>  $ country  : chr [1:1704] "Afghanistan" "Afghanistan" "Afghanistan" "Afghanistan" ...
>  $ year     : num [1:1704] 1952 1957 1962 1967 1972 ...
>  $ pop      : num [1:1704] 8425333 9240934 10267083 11537966 13079460 ...
>  $ continent: chr [1:1704] "Asia" "Asia" "Asia" "Asia" ...
>  $ lifeExp  : num [1:1704] 28.8 30.3 32 34 36.1 ...
>  $ gdpPercap: num [1:1704] 779 821 853 836 740 ...
>  - attr(*, "spec")=
>   .. cols(
>   ..   country = col_character(),
>   ..   year = col_double(),
>   ..   pop = col_double(),
>   ..   continent = col_character(),
>   ..   lifeExp = col_double(),
>   ..   gdpPercap = col_double()
>   .. )
>  - attr(*, "problems")=<externalptr> 
> ```
> 
> ```r
> summary(gapminder)
> ```
> 
> ```
>    country               year           pop             continent        
>  Length:1704        Min.   :1952   Min.   :6.001e+04   Length:1704       
>  Class :character   1st Qu.:1966   1st Qu.:2.794e+06   Class :character  
>  Mode  :character   Median :1980   Median :7.024e+06   Mode  :character  
>                     Mean   :1980   Mean   :2.960e+07                     
>                     3rd Qu.:1993   3rd Qu.:1.959e+07                     
>                     Max.   :2007   Max.   :1.319e+09                     
>     lifeExp        gdpPercap       
>  Min.   :23.60   Min.   :   241.2  
>  1st Qu.:48.20   1st Qu.:  1202.1  
>  Median :60.71   Median :  3531.8  
>  Mean   :59.47   Mean   :  7215.3  
>  3rd Qu.:70.85   3rd Qu.:  9325.5  
>  Max.   :82.60   Max.   :113523.1  
> ```

The first thing we should always do is check out what the data looks like with
`str` or `summary`:


```r
str(gapminder)
```

```
spec_tbl_df [1,704 × 6] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
 $ country  : chr [1:1704] "Afghanistan" "Afghanistan" "Afghanistan" "Afghanistan" ...
 $ year     : num [1:1704] 1952 1957 1962 1967 1972 ...
 $ pop      : num [1:1704] 8425333 9240934 10267083 11537966 13079460 ...
 $ continent: chr [1:1704] "Asia" "Asia" "Asia" "Asia" ...
 $ lifeExp  : num [1:1704] 28.8 30.3 32 34 36.1 ...
 $ gdpPercap: num [1:1704] 779 821 853 836 740 ...
 - attr(*, "spec")=
  .. cols(
  ..   country = col_character(),
  ..   year = col_double(),
  ..   pop = col_double(),
  ..   continent = col_character(),
  ..   lifeExp = col_double(),
  ..   gdpPercap = col_double()
  .. )
 - attr(*, "problems")=<externalptr> 
```



```r
summary(gapminder$country)
```

```
   Length     Class      Mode 
     1704 character character 
```


> ## Miscellaneous Tips
>
> * Files can also be downloaded directly from the Internet into a local
> folder of your choice onto your computer using the `download.file` function.
> The `read_csv` function can then be executed to read the downloaded file from the download location, for example,
> 
> ```r
> download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder_data.csv", destfile = "data/gapminder_data.csv")
> gapminder <- read_csv("data/gapminder_data.csv")
> ```
>
> * Alternatively, you can also read in files directly into R from the Internet by replacing the file paths with a web address in `read_csv`. One should note that in doing this no local copy of the csv file is first saved onto your computer. For example,
> 
> ```r
> gapminder <- read_csv("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder_data.csv")
> ```
>
> * You can read directly from excel spreadsheets without
> converting them to plain text first by using the [readxl](https://cran.r-project.org/package=readxl) package.

We'll also likely want to know what the titles of all the columns are, so we can
ask for them:


```r
names(gapminder)
```

```
[1] "country"   "year"      "pop"       "continent" "lifeExp"   "gdpPercap"
```

At this stage, it's important to ask ourselves if the structure R is reporting
matches our intuition or expectations; do the basic data types reported for each
column make sense? If not, we need to sort any problems out now before they turn
into bad surprises down the road, using what we've learned about how R
interprets data, and the importance of *strict consistency* in how we record our
data.

Once we're happy that the data types and structures seem reasonable, it's time
to start digging into our data proper. Check out the first few lines:


```r
head(gapminder)
```

```
# A tibble: 6 × 6
  country      year      pop continent lifeExp gdpPercap
  <chr>       <dbl>    <dbl> <chr>       <dbl>     <dbl>
1 Afghanistan  1952  8425333 Asia         28.8      779.
2 Afghanistan  1957  9240934 Asia         30.3      821.
3 Afghanistan  1962 10267083 Asia         32.0      853.
4 Afghanistan  1967 11537966 Asia         34.0      836.
5 Afghanistan  1972 13079460 Asia         36.1      740.
6 Afghanistan  1977 14880372 Asia         38.4      786.
```

> ## Challenge 2
>
> It's good practice to also check the last few lines of your data and some in the middle. How would you do this?
>
> Searching for ones specifically in the middle isn't too hard but we could simply ask for a few lines at random. How would you code this?
>
> > ## Solution to Challenge 2
> > To check the last few lines it's relatively simple as R already has a function for this:
> > 
> > ~~~
> > tail(gapminder)
> > tail(gapminder, n = 15)
> > ~~~
> > 
> > What about a few arbitrary rows just for sanity (or insanity depending on your view)?
> > ## Tip: There are several ways to achieve this.
> > The solution here presents one form of using nested functions, i.e. a function passed as an argument to another function. This might sound like a new concept, but you are already using it!
> > Remember my_dataframe[rows, cols] will print to screen your data frame with the number of rows and columns you asked for (although you might have asked for a range or named columns for example). How would you get the last row if you don't know how many rows your data frame has? R has a function for this. What about getting a (pseudorandom) sample? R also has a function for this.
> > ~~~
> > gapminder[sample(nrow(gapminder), 5), ]
> > ~~~

Another very helpful function for looking at your data is the `unique` 
function, to see the unique values in a particular column:


```r
unique(gapminder$continent)
```

```
[1] "Asia"     "Europe"   "Africa"   "Americas" "Oceania" 
```


To make sure our analysis is reproducible, we should put the code
into a script file so we can come back to it later.

> ## Challenge 3
>
> Go to file -> new file -> R script, and write an R script
> to load in the gapminder dataset.

## Basic subsetting

Data frames are two dimensions - rows and columns. We can access these using a 
specific notation with square brackets.


```r
my_data_frame[rows, columns]
```

### Selecting rows

We can select rows using the square brackets like so:


```r
gapminder[1, ]
```

```
# A tibble: 1 × 6
  country      year     pop continent lifeExp gdpPercap
  <chr>       <dbl>   <dbl> <chr>       <dbl>     <dbl>
1 Afghanistan  1952 8425333 Asia         28.8      779.
```

```r
gapminder[100:110, ]
```

```
# A tibble: 11 × 6
   country     year       pop continent lifeExp gdpPercap
   <chr>      <dbl>     <dbl> <chr>       <dbl>     <dbl>
 1 Bangladesh  1967  62821884 Asia         43.5      721.
 2 Bangladesh  1972  70759295 Asia         45.3      630.
 3 Bangladesh  1977  80428306 Asia         46.9      660.
 4 Bangladesh  1982  93074406 Asia         50.0      677.
 5 Bangladesh  1987 103764241 Asia         52.8      752.
 6 Bangladesh  1992 113704579 Asia         56.0      838.
 7 Bangladesh  1997 123315288 Asia         59.4      973.
 8 Bangladesh  2002 135656790 Asia         62.0     1136.
 9 Bangladesh  2007 150448339 Asia         64.1     1391.
10 Belgium     1952   8730405 Europe       68       8343.
11 Belgium     1957   8989111 Europe       69.2     9715.
```

```r
gapminder[c(1, 3, 5, 7, 9), ]
```

```
# A tibble: 5 × 6
  country      year      pop continent lifeExp gdpPercap
  <chr>       <dbl>    <dbl> <chr>       <dbl>     <dbl>
1 Afghanistan  1952  8425333 Asia         28.8      779.
2 Afghanistan  1962 10267083 Asia         32.0      853.
3 Afghanistan  1972 13079460 Asia         36.1      740.
4 Afghanistan  1982 12881816 Asia         39.9      978.
5 Afghanistan  1992 16317921 Asia         41.7      649.
```

It's unlikely that you'll often do this directly though, you'll usually want 
to use some criteria. Say we just wanted the rows from Asia:


```r
romania <- gapminder[gapminder$continent == "Asia", ]
romania
```

```
# A tibble: 396 × 6
   country      year      pop continent lifeExp gdpPercap
   <chr>       <dbl>    <dbl> <chr>       <dbl>     <dbl>
 1 Afghanistan  1952  8425333 Asia         28.8      779.
 2 Afghanistan  1957  9240934 Asia         30.3      821.
 3 Afghanistan  1962 10267083 Asia         32.0      853.
 4 Afghanistan  1967 11537966 Asia         34.0      836.
 5 Afghanistan  1972 13079460 Asia         36.1      740.
 6 Afghanistan  1977 14880372 Asia         38.4      786.
 7 Afghanistan  1982 12881816 Asia         39.9      978.
 8 Afghanistan  1987 13867957 Asia         40.8      852.
 9 Afghanistan  1992 16317921 Asia         41.7      649.
10 Afghanistan  1997 22227415 Asia         41.8      635.
# … with 386 more rows
```

This works because subsetting can take either numerical positions like we showed
above, OR a vector of `TRUE` and `FALSE`, returning the rows that are `TRUE`.
`gapminder$contintent == "Asia"` generates a vector of `TRUE` and `FALSE`
values:


```r
gapminder$continent == "Asia"
```

```
  [1]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [13] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [25] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [37] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [49] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [61] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [73] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [85]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
 [97]  TRUE  TRUE  TRUE  TRUE
 [ reached getOption("max.print") -- omitted 1604 entries ]
```

and inserting that vector into the first position of the square brackets
gives us just the rows where the `contintent` column is `"Asia"`.

Another very useful operator in this context is the `%in%` operator - it can 
tell you if a value is _one of_ a set of values:

Say we wanted to select just Canada and Mexico:


```r
gapminder$country %in% c("Canada", "Mexico")
```

```
  [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [13] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [25] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [37] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [49] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [61] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [73] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [85] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [97] FALSE FALSE FALSE FALSE
 [ reached getOption("max.print") -- omitted 1604 entries ]
```

Now we can insert this into the first position of the square brackets:


```r
can_mex <- gapminder$country %in% c("Canada", "Mexico")
gapminder[can_mex, ]
```

```
# A tibble: 24 × 6
   country  year      pop continent lifeExp gdpPercap
   <chr>   <dbl>    <dbl> <chr>       <dbl>     <dbl>
 1 Canada   1952 14785584 Americas     68.8    11367.
 2 Canada   1957 17010154 Americas     70.0    12490.
 3 Canada   1962 18985849 Americas     71.3    13462.
 4 Canada   1967 20819767 Americas     72.1    16077.
 5 Canada   1972 22284500 Americas     72.9    18971.
 6 Canada   1977 23796400 Americas     74.2    22091.
 7 Canada   1982 25201900 Americas     75.8    22899.
 8 Canada   1987 26549700 Americas     76.9    26627.
 9 Canada   1992 28523502 Americas     78.0    26343.
10 Canada   1997 30305843 Americas     78.6    28955.
# … with 14 more rows
```

> ## Challenge 4
> Select all the rows in `gapminder` with data from 1975 and earlier
>
> > Solution to Challenge 4
> > 
> > ```r
> > gapminder[gapminder$year <= 1975, ]
> > ```
> > 
> > ```
> > # A tibble: 710 × 6
> >    country      year      pop continent lifeExp gdpPercap
> >    <chr>       <dbl>    <dbl> <chr>       <dbl>     <dbl>
> >  1 Afghanistan  1952  8425333 Asia         28.8      779.
> >  2 Afghanistan  1957  9240934 Asia         30.3      821.
> >  3 Afghanistan  1962 10267083 Asia         32.0      853.
> >  4 Afghanistan  1967 11537966 Asia         34.0      836.
> >  5 Afghanistan  1972 13079460 Asia         36.1      740.
> >  6 Albania      1952  1282697 Europe       55.2     1601.
> >  7 Albania      1957  1476505 Europe       59.3     1942.
> >  8 Albania      1962  1728137 Europe       64.8     2313.
> >  9 Albania      1967  1984060 Europe       66.2     2760.
> > 10 Albania      1972  2263554 Europe       67.7     3313.
> > # … with 700 more rows
> > ```

We saw previously how we can select a single column using the dollar sign `$`:


```r
gapminder$country
```

```
  [1] "Afghanistan" "Afghanistan" "Afghanistan" "Afghanistan" "Afghanistan"
  [6] "Afghanistan" "Afghanistan" "Afghanistan" "Afghanistan" "Afghanistan"
 [11] "Afghanistan" "Afghanistan" "Albania"     "Albania"     "Albania"    
 [16] "Albania"     "Albania"     "Albania"     "Albania"     "Albania"    
 [21] "Albania"     "Albania"     "Albania"     "Albania"     "Algeria"    
 [26] "Algeria"     "Algeria"     "Algeria"     "Algeria"     "Algeria"    
 [31] "Algeria"     "Algeria"     "Algeria"     "Algeria"     "Algeria"    
 [36] "Algeria"     "Angola"      "Angola"      "Angola"      "Angola"     
 [41] "Angola"      "Angola"      "Angola"      "Angola"      "Angola"     
 [46] "Angola"      "Angola"      "Angola"      "Argentina"   "Argentina"  
 [51] "Argentina"   "Argentina"   "Argentina"   "Argentina"   "Argentina"  
 [56] "Argentina"   "Argentina"   "Argentina"   "Argentina"   "Argentina"  
 [61] "Australia"   "Australia"   "Australia"   "Australia"   "Australia"  
 [66] "Australia"   "Australia"   "Australia"   "Australia"   "Australia"  
 [71] "Australia"   "Australia"   "Austria"     "Austria"     "Austria"    
 [76] "Austria"     "Austria"     "Austria"     "Austria"     "Austria"    
 [81] "Austria"     "Austria"     "Austria"     "Austria"     "Bahrain"    
 [86] "Bahrain"     "Bahrain"     "Bahrain"     "Bahrain"     "Bahrain"    
 [91] "Bahrain"     "Bahrain"     "Bahrain"     "Bahrain"     "Bahrain"    
 [96] "Bahrain"     "Bangladesh"  "Bangladesh"  "Bangladesh"  "Bangladesh" 
 [ reached getOption("max.print") -- omitted 1604 entries ]
```

If we wanted to select a subset of columns, we can specify that in the second 
position using a character vector of column names:


```r
gapminder[ , c("country", "year", "lifeExp")]
```

```
# A tibble: 1,704 × 3
   country      year lifeExp
   <chr>       <dbl>   <dbl>
 1 Afghanistan  1952    28.8
 2 Afghanistan  1957    30.3
 3 Afghanistan  1962    32.0
 4 Afghanistan  1967    34.0
 5 Afghanistan  1972    36.1
 6 Afghanistan  1977    38.4
 7 Afghanistan  1982    39.9
 8 Afghanistan  1987    40.8
 9 Afghanistan  1992    41.7
10 Afghanistan  1997    41.8
# … with 1,694 more rows
```

> ## Challenge 5
> Select all the rows in `gapminder` with data from Canada, and just the columns
> year, pop, and gdpPercap
>
> > Solution to Challenge 5
> > 
> > ```r
> > gapminder[gapminder$country == "Canada", c("year", "pop", "gdpPercap")]
> > ```
> > 
> > ```
> > # A tibble: 12 × 3
> >     year      pop gdpPercap
> >    <dbl>    <dbl>     <dbl>
> >  1  1952 14785584    11367.
> >  2  1957 17010154    12490.
> >  3  1962 18985849    13462.
> >  4  1967 20819767    16077.
> >  5  1972 22284500    18971.
> >  6  1977 23796400    22091.
> >  7  1982 25201900    22899.
> >  8  1987 26549700    26627.
> >  9  1992 28523502    26343.
> > 10  1997 30305843    28955.
> > 11  2002 31902268    33329.
> > 12  2007 33390141    36319.
> > ```
