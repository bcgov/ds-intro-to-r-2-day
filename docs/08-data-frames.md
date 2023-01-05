---
title: "Subsetting Data Frames"
teaching: 20
exercises: 10
questions: "How can I manipulate a data frame?"
objectives:
- "Add and remove rows or columns"
- "Or access a single row or column"
- "Remove rows with `NA` values"
- "Subset a data frame by character value"
keypoints:
- "Understand the basics of subsetting data frames using `[]` and `$`"
- "Read in a csv file using `readr::read_csv()`."
source: Rmd
---




# Subsetting Data Frames 

Earlier in the course, you saw the basics of manipulating data frames with our gapminder data;
now let's add to those skills and learn to subset data frames using row and column positions. Let's read in the
gapminder dataset that we downloaded previously and assign it to a data frame called gapminder:


```r
 library(readr)
 gapminder <- read_csv("data/gapminder_data.csv")
```

```
Rows: 1704 Columns: 6
── Column specification ────────────────────────────────────────────────────────
Delimiter: ","
chr (2): country, continent
dbl (4): year, pop, lifeExp, gdpPercap

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

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

### Challenge 2 (5 minutes)
>
> It's good practice to also check the last few lines of your data and some in the middle. How would you do this?
>
>
> <details>
> 
> <summary>
> Solution to challenge 2
> </summary>
> 
> Use your knowledge of the dataset to choose some rows in the middle and at the end. 
>
>```r
>nrow(gapminder)
>```
>
>```
>[1] 1704
>```
>
>```r
>gapminder[c(700, 750, 800),]
>```
>
>```
># A tibble: 3 × 6
>  country  year       pop continent lifeExp gdpPercap
>  <chr>   <dbl>     <dbl> <chr>       <dbl>     <dbl>
>1 India    1967 506000000 Asia         47.2      701.
>2 Ireland  1977   3271900 Europe       72.0    11151.
>3 Japan    1987 122091325 Asia         78.7    22376.
>```
>
>```r
>gapminder[1700:1704,]
>```
>
>```
># A tibble: 5 × 6
>  country   year      pop continent lifeExp gdpPercap
>  <chr>    <dbl>    <dbl> <chr>       <dbl>     <dbl>
>1 Zimbabwe  1987  9216418 Africa       62.4      706.
>2 Zimbabwe  1992 10704340 Africa       60.4      693.
>3 Zimbabwe  1997 11404948 Africa       46.8      792.
>4 Zimbabwe  2002 11926563 Africa       40.0      672.
>5 Zimbabwe  2007 12311143 Africa       43.5      470.
>```
>
>
> <br />
>To check the last few lines it's relatively simple as R already has a function for this:
>
>
>```r
>tail(gapminder)
>```
>
>```
># A tibble: 6 × 6
>  country   year      pop continent lifeExp gdpPercap
>  <chr>    <dbl>    <dbl> <chr>       <dbl>     <dbl>
>1 Zimbabwe  1982  7636524 Africa       60.4      789.
>2 Zimbabwe  1987  9216418 Africa       62.4      706.
>3 Zimbabwe  1992 10704340 Africa       60.4      693.
>4 Zimbabwe  1997 11404948 Africa       46.8      792.
>5 Zimbabwe  2002 11926563 Africa       40.0      672.
>6 Zimbabwe  2007 12311143 Africa       43.5      470.
>```
>
>```r
>tail(gapminder, n = 15)
>```
>
>```
># A tibble: 15 × 6
>   country   year      pop continent lifeExp gdpPercap
>   <chr>    <dbl>    <dbl> <chr>       <dbl>     <dbl>
> 1 Zambia    1997  9417789 Africa       40.2     1071.
> 2 Zambia    2002 10595811 Africa       39.2     1072.
> 3 Zambia    2007 11746035 Africa       42.4     1271.
> 4 Zimbabwe  1952  3080907 Africa       48.5      407.
> 5 Zimbabwe  1957  3646340 Africa       50.5      519.
> 6 Zimbabwe  1962  4277736 Africa       52.4      527.
> 7 Zimbabwe  1967  4995432 Africa       54.0      570.
> 8 Zimbabwe  1972  5861135 Africa       55.6      799.
> 9 Zimbabwe  1977  6642107 Africa       57.7      686.
>10 Zimbabwe  1982  7636524 Africa       60.4      789.
>11 Zimbabwe  1987  9216418 Africa       62.4      706.
>12 Zimbabwe  1992 10704340 Africa       60.4      693.
>13 Zimbabwe  1997 11404948 Africa       46.8      792.
>14 Zimbabwe  2002 11926563 Africa       40.0      672.
>15 Zimbabwe  2007 12311143 Africa       43.5      470.
>```
></details>

Searching for ones specifically in the middle isn't too hard but we could simply ask for a few lines at random. How would you code this?

::: {.rmdtip}

**Tip: There are several ways to achieve this.**
The solution here presents one form of using nested functions, i.e. a function passed as an argument to another function. This might sound like a new ept, but you are already using it!

Remember `my_dataframe[rows, cols]` will print to screen your data frame with the number of rows and columns you asked for (although you might have d for a range or named columns for example). How would you get the last row if you don't know how many rows your data frame has? R has a function for . What about getting a (pseudorandom) sample? R also has a function for this.

~~~
gapminder[sample(nrow(gapminder), 5), ]
~~~

:::

It's unlikely that you'll select rows directly though, you'll usually want 
to use some criteria. Say we just wanted the rows from Asia:


```r
asia <- gapminder[gapminder$continent == "Asia", ]
asia
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


### Challenge 3 (5 minutes)
> Select all the rows in `gapminder` with data from 1975 and earlier
>
> <details>
> 
> <summary>
> Solution to challenge 3
> </summary>
> 
> <br />
> 
> ```r
> gapminder[gapminder$year <= 1975, ]
> ```
> 
> ```
> # A tibble: 710 × 6
>    country      year      pop continent lifeExp gdpPercap
>    <chr>       <dbl>    <dbl> <chr>       <dbl>     <dbl>
>  1 Afghanistan  1952  8425333 Asia         28.8      779.
>  2 Afghanistan  1957  9240934 Asia         30.3      821.
>  3 Afghanistan  1962 10267083 Asia         32.0      853.
>  4 Afghanistan  1967 11537966 Asia         34.0      836.
>  5 Afghanistan  1972 13079460 Asia         36.1      740.
>  6 Albania      1952  1282697 Europe       55.2     1601.
>  7 Albania      1957  1476505 Europe       59.3     1942.
>  8 Albania      1962  1728137 Europe       64.8     2313.
>  9 Albania      1967  1984060 Europe       66.2     2760.
> 10 Albania      1972  2263554 Europe       67.7     3313.
> # … with 700 more rows
> ```
> </details>


### Challenge 4 (5 minutes)

> Select all the rows in `gapminder` with data from Canada, and just the columns
> year, pop, and gdpPercap

> <details>
> 
> <summary>
> Solution to challenge 4
> </summary>
> 
> <br />
> 
> ```r
> gapminder[gapminder$country == "Canada", c("year", "pop", "gdpPercap")]
> ```
> 
> ```
> # A tibble: 12 × 3
>     year      pop gdpPercap
>    <dbl>    <dbl>     <dbl>
>  1  1952 14785584    11367.
>  2  1957 17010154    12490.
>  3  1962 18985849    13462.
>  4  1967 20819767    16077.
>  5  1972 22284500    18971.
>  6  1977 23796400    22091.
>  7  1982 25201900    22899.
>  8  1987 26549700    26627.
>  9  1992 28523502    26343.
> 10  1997 30305843    28955.
> 11  2002 31902268    33329.
> 12  2007 33390141    36319.
> ```
> </details>
>

