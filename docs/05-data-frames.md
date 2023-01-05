---
title: "Exploring Data Frames"
teaching: 20
exercises: 10
questions: "How can I manipulate a data frame?"
objectives:
- "Display basic properties of data frames including size and class of the columns, names, and first few rows."
keypoints:
- "Use `str()`, `summary()`, `nrow()`, `ncol()`, `dim()`, `colnames()`, `rownames()`, `head()`, and `typeof()` to understand the structure of a data frame."
- "Read in a csv file using `readr::read_csv()`."
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
spc_tbl_ [3 × 3] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
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
`gapminder` dataset that we downloaded previously and assign it to a data frame called `gapminder`:

 
 ```r
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

### Challenge 1 (5 minutes)
>
> How many rows and columns does `gapminder` have?
>
> What kind of data is in the `pop` and `continent` columns?
>
> <details>
> 
> <summary>
> Solution to challenge 1
> </summary>
> 
> <br />
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
> ```r
> str(gapminder)
> ```
> 
> ```
> spc_tbl_ [1,704 × 6] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
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
> </details>

The first thing we should always do is check out what the data looks like with
`str()` or `summary()`:


```r
str(gapminder)
```

```
spc_tbl_ [1,704 × 6] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
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

::: {.rmdtip}

**Miscellaneous Tips**

* Files can also be downloaded directly from the Internet into a local
folder of your choice onto your computer using the `download.file` function.
The `read_csv` function can then be executed to read the downloaded file from the download location, for example,

```r
download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder_data.csv", destfile = "data/gapminder_data.csv")
gapminder <- read_csv("data/gapminder_data.csv")
```

* Alternatively, you can also read in files directly into R from the Internet by replacing the file paths with a web address in `read_csv`. One should note that in doing this no local copy of the csv file is first saved onto your computer. For example,

```r
gapminder <- read_csv("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder_data.csv")
```

* You can read directly from excel spreadsheets without
converting them to plain text first by using the [readxl](https://cran.r-project.org/package=readxl) package.

:::


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

Another very helpful function for looking at your data is the `unique`()
function, to see the unique values in a particular column:


```r
unique(gapminder$continent)
```

```
[1] "Asia"     "Europe"   "Africa"   "Americas" "Oceania" 
```
