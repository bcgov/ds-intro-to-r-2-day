---
title: "Seeking Help in R"
teaching: 10
exercises: 10
questions:
- "How can I get help in R?"
objectives:
- "To be able read R help files for functions and special operators."
- "To be able to use CRAN task views to identify packages to solve a problem."
keypoints:
- "Use `help()` to get online help in R."
source: Rmd
---



# Seeking Help in R

## Reading Help files

R, and every package, provides help files for functions. The general syntax to search for help on any
function, "function_name", from a specific function that is in a package loaded into your
namespace (your interactive R session):


```r
?function_name
help(function_name)
```

This will load up a help page in RStudio (or as plain text in R by itself).

Each help page is broken down into sections:

 - Description: An extended description of what the function does.
 - Usage: The arguments of the function and their default values.
 - Arguments: An explanation of the data each argument is expecting.
 - Details: Any important details to be aware of.
 - Value: The type of data the function returns.
 - See Also: Any related functions you might find useful.
 - Examples: Some examples for how to use the function.

Different functions might have different sections, but these are the main ones you should be aware of.

::: {.rmdtip}
**Tip: Running Examples**

From within the function help page, you can highlight code in the 
Examples and hit <kbd>Ctrl</kbd>+<kbd>Return</kbd> to run it in 
RStudio console. This is gives you a quick way to get a feel for
how a function works.

**Tip: Reading help files**

One of the most daunting aspects of R is the large number of functions
available. It would be prohibitive, if not impossible to remember the
correct usage for every function you use. Luckily, the help files
mean you don't have to!
:::

## Special Operators

To seek help on special operators, use quotes:


```r
?"<-"
```

## Getting help on packages

Many packages come with "vignettes": tutorials and extended example documentation.
Without any arguments, `vignette()` will list all vignettes for all installed packages;
`vignette(package="package-name")` will list all available vignettes for
`package-name`, and `vignette("vignette-name")` will open the specified vignette.

If a package doesn't have any vignettes, you can usually find help by typing
`help("package-name")`.

Many packages also have a web presence. Google is your friend here. For example here is the package website for the ggplot2 package: https://ggplot2.tidyverse.org/

## Finding help for functions in packages

If you are looking for help on a function that is within a package, there are several ways to find it:

- If you have loaded the package (via `library(pkg_name)`) and know the package name you can simply use `?function_name`
- If you haven't loaded the package, you can use the following syntax: `?package_name::function_name` or `help("function_name", package = "package_name")`
- Often the easiest way is to load the function index for a package with `help(package = "package_name")` and click on the link for the function for which you are seeking help

## When you kind of remember the function

If you're not sure what package a function is in, or how it's specifically spelled you can do a fuzzy search:


```r
??function_name
```

## When you have no idea where to begin

If you don't know what function or package you need to use
[CRAN Task Views](http://cran.at.r-project.org/web/views)
is a specially maintained list of packages grouped into
fields. This can be a good starting point.

### Challenge 1

> Look at the help for the `sum()` function. What are two ways you can pass numbers 
> into the function so the are added together?
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
> ?sum
> sum(1, 2, 3, 4, 5)
> x <- c(1, 2, 3)
> sum(x)
> ```
> 
> </details>


## Challenges (10 minutes)

### Challenge 2

> Look at the help for the `paste()` function. You'll need to use this later.
> What is the difference between the `sep` and `collapse` arguments?
> 
> 
> <details>
> 
> <summary>
> Solution to challenge 2
> </summary>
> 
> <br />
> 
> To look at the help for the `paste()` function, use:
> 
> ```r
> help("paste")
> ?paste
> ```
> The difference between `sep` and `collapse` is a little
> tricky. The `paste` function accepts any number of arguments, each of which
> can be a vector of any length. The `sep` argument specifies the string
> used between concatenated terms — by default, a space. The result is a
> vector as long as the longest argument supplied to `paste`. In contrast,
> `collapse` specifies that after concatenation the elements are *collapsed*
> together using the given separator, the result being a single string.
> e.g. 
> 
> ```r
> paste(c("a","b"), "c")
> ```
> 
> ```
> [1] "a c" "b c"
> ```
> 
> ```r
> paste(c("a","b"), "c", sep = ",")
> ```
> 
> ```
> [1] "a,c" "b,c"
> ```
> 
> ```r
> paste(c("a","b"), "c", collapse = "|")
> ```
> 
> ```
> [1] "a c|b c"
> ```
> 
> ```r
> paste(c("a","b"), "c", sep = ",", collapse = "|")
> ```
> 
> ```
> [1] "a,c|b,c"
> ```
> (For more information,
> scroll to the bottom of the `?paste` help page and look at the
> examples, or try `example('paste')`.)
> 
> </details>




### Challenge 3
> Use help to find a function (and its associated parameters) that you could
> use to load data from a csv file in which columns are delimited with "\t"
> (tab) and the decimal point is a "." (period). This check for decimal
> separator is important, especially if you are working with international
> colleagues, because different countries have different conventions for the
> decimal point (i.e. comma vs period).
> hint: use `??csv` to lookup csv related functions.
> 
> 
> <details>
> 
> <summary>
> Solution to challenge 3
> </summary>
> 
> <br />
> 
> The standard R function for reading tab-delimited files with a period
> decimal separator is read.delim(). You can also do this with
> `read.table(file, sep="\t")` (the period is the *default* decimal
> separator for `read.table()`, although you may have to change
> the `comment.char` argument as well if your data file contains
> hash (#) characters
> 
> </details>


### Challenge 4

> Find the help for the `mutate` function in the `dplyr` package. What is its purpose? What do you notice different about this help page?
> 
> <details>
> 
> <summary>
> Solution to challenge 4
> </summary>
> 
> <br />
> 
> 
> ```r
> ?dplyr::mutate
> # OR
> library(dplyr)
> ?mutate
> # OR
> help("mutate", package = "dplyr")
> # OR
> help(package = "dplyr") # and click on the 'mutate' link
> ```
> `mutate()` adds new variables and preserves existing ones.
> The help page for mutate also documents the function `transmute()`
> 
> </details>

