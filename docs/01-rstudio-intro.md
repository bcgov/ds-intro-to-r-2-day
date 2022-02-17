---
title: "Introduction to R and RStudio"
teaching: 45
exercises: 10
questions:
- "How to find your way around RStudio?"
- "How to interact with R?"
- "How to manage your environment?"
- "How to install packages?"
objectives:
- "Describe the purpose and use of each pane in the RStudio IDE"
- "Locate buttons and options in the RStudio IDE"
- "Define a variable"
- "Assign data to a variable"
- "Manage a workspace in an interactive R session"
- "Use mathematical and comparison operators"
- "Call functions"
- "Manage packages"
keypoints:
- "Use RStudio to write and run R programs."
- "R has the usual arithmetic operators and mathematical functions."
- "Use `<-` to assign values to variables."
- "Use `ls()` to list the variables in a program."
- "Use `rm()` to delete objects in a program."
- "Use `install.packages()` to install packages (libraries)."
source: Rmd
---



# Introduction to R and RStudio

## Motivation

Science is a multi-step process: once you've designed an experiment and
collected data, the real fun begins! This lesson will teach you how to start
this process using R and RStudio. We will begin with raw data, perform
exploratory analyses, and learn how to plot results graphically. This course
starts with a dataset from [gapminder.org](https://www.gapminder.org) containing
population information for many countries through time. We will also access open
data from the [B.C. Data Catalogue](https://catalogue.data.gov.bc.ca/). 

 - Can you read the data into R?
 - Can you plot the population for Senegal? 
 - Can you calculate the average income for countries on the continent of Asia? 
 - Can you read data from the B.C. Data Catalogue into R? 

By the end of these lessons you will be able to do things like plot the
populations for all of these countries in under a minute!

## Before Starting The Workshop

Please ensure you have the latest version of R and RStudio installed on your machine. This is important, as some packages used in the workshop may not install correctly (or at all) if R is not up to date.

**If you have administrative rights on your computer: **

[Download and install the latest version of R here](https://www.r-project.org/)

[Download and install RStudio here](https://www.rstudio.com/)

There is one bit of customization we need to do to make R play nicely on
a bcgov computer: 

Open command prompt (Open Start Menu then type `cmd` and press <kbd>Enter</kbd>). Make sure your command prompt opens at the C directory e.g. ```C:\>```. If it opens in another directory you can change this by typing ```C:```.  

Type the following line into the command prompt window exactly as shown:

```
setx HOME "%USERPROFILE%"
```

Press <kbd>Enter</kbd>, you should see **SUCCESS: Specified value was saved**.
Quit command prompt by typing `exit` then pressing <kbd>Enter</kbd>

**If you do not have administrative rights on your computer:**

Download R and RStudio from the BC Government Software Centre:

- Install RTools (Rtools 4.0 Gen PO) - this will install RStudio
- Install R (RforWindowsX64 4.0.5 Gen P0)



## Introduction to RStudio


Throughout this lesson, we're going to teach you some of the fundamentals of
the R language as well as some best practices for organizing code for
scientific projects that will make your life easier.

We'll be using RStudio: a free, open source R integrated development
environment. It provides a built in editor, works on all platforms (including
on servers) and provides many advantages such as integration with version
control and project management.

::: {.rmdtip}

**Tip: Key RStudio Setting**

By default RStudio will automatically save your session variables in your
porject directory in a file called `.RData`. These are saved when you exit a
project and restored when you open it up again. We _highly_ recommend turning
this feature off. As you will learn in this course, all outputs will be created
from code. Typically you do not need to save intermediate steps. If you don't
plan to use this feature you can toggle it in the Project Options -> General
tab.

:::

**Basic layout**

When you first open RStudio, you will be greeted by three panels:

  * The interactive R console (entire left)
  * Environment/History (tabbed in upper right)
  * Files/Plots/Packages/Help/Viewer (tabbed in lower right)

![RStudio layout](fig/rmd-01-rstudio.png){width=100%}

Once you open files, such as R scripts, an editor panel will also open
in the top left.

![RStudio layout with .R file open](fig/rmd-01-rstudio-script.png){width=100%}


## Work flow within RStudio
There are two main ways one can work within RStudio.

1. Test and play within the interactive R console then copy code into
a .R file to run later.
   *  This works well when doing small tests and initially starting off.
   *  It quickly becomes laborious
2. Start writing in an .R file and use RStudio's short cut keys for the Run command
to push the current line, selected lines or modified lines to the
interactive R console.
   * This is a great way to start; all your code is saved for later
   * You will be able to run the file you create from within RStudio
   or using R's `source()`  function.

::: {.rmdtip}
**Tip: Running segments of your code**

RStudio offers you great flexibility in running code from within the editor
window. There are buttons, menu choices, and keyboard shortcuts. To run the
current line, you can 
1. click on the `Run` button above the editor panel, or 
2. select "Run Lines" from the "Code" menu, or 
3. hit <kbd>Ctrl</kbd>+<kbd>Return</kbd> in Windows or Linux 
or <kbd>&#8984;</kbd>+<kbd>Return</kbd> on OS X.
(This shortcut can also be seen by hovering
the mouse over the button). To run a block of code, select it and then `Run`.
If you have modified a line of code within a block of code you have just run,
there is no need to reselect the section and `Run`, you can use the next button
along, `Re-run the previous region`. This will run the previous code block
including the modifications you have made.
:::

## Introduction to R

Much of your time in R will be spent in the R interactive console. This is where
you can run your code line-by-line, and can be a useful environment to try out
ideas before adding them to an R script file. This console in RStudio is the
same as the one you would get if you typed in `R` in your command-line
environment.
The first thing you will see in the R interactive session is a bunch of
information, followed by a ">" and a blinking cursor. It operates on a "Read,
evaluate, print loop": you type in commands, R tries to execute them, and then
returns a result.

### Before we dive in...
We are first going set up a workspace, called an RStudio Project, where we can work through
the course materials and save our work.
In the console, type: 

If you are on Windows:

```r
use_course("https://github.com/bcgov/ds-intro-to-r-2-day/raw/master/intro-r-Feb2022.zip", destdir = Sys.getenv("USERPROFILE"))
```

If you are on a Mac:

```r
use_course("https://github.com/bcgov/ds-intro-to-r-2-day/raw/master/intro-r-Feb2022.zip", destdir = Sys.getenv("HOME"))
```

... and press <kbd>Enter</kbd>.

This will create a new R project folder in your user directory (`C:/Users/[your_user_name]/intro-r-Feb2022/` on Windows, 
and `/Users/[your_user_name]/intro-r-Feb2022/` on a Mac), and open that project in RStudio. 


## Using R as a calculator

The simplest thing you could do with R is do arithmetic:


```r
1 + 100
```

```
[1] 101
```

And R will print out the answer, with a preceding "[1]". Don't worry about this
for now, we'll explain that later. For now think of it as indicating output.

If you type in an incomplete command, R will wait for you to
complete it:

~~~
> 1 +
~~~

~~~
+
~~~

Any time you hit return and the R session shows a "+" instead of a ">", it
means it's waiting for you to complete the command. If you want to cancel
a command you can simply hit "Esc" and RStudio will give you back the ">"
prompt.

::: {.rmdtip}
**Tip: Cancelling commands**

Cancelling a command isn't only useful for killing incomplete commands:
you can also use it to tell R to stop running code (for example if it's
taking much longer than you expect), or to get rid of the code you're
currently writing.
:::

When using R as a calculator, the order of operations is the same as you
would have learned back in school.

From highest to lowest precedence:

 * Parentheses: `(`, `)`
 * Exponents: `^` or `**`
 * Divide: `/`
 * Multiply: `*`
 * Add: `+`
 * Subtract: `-`


```r
3 + 5 * 2
```

```
[1] 13
```

Use parentheses to group operations in order to force the order of
evaluation if it differs from the default, or to make clear what you
intend.


```r
(3 + 5) * 2
```

```
[1] 16
```

This can get unwieldy when not needed, but  clarifies your intentions.
Remember that others may later read your code.


```r
(3 + (5 * (2 ^ 2))) # hard to read
3 + 5 * 2 ^ 2       # clear, if you remember the rules
3 + 5 * (2 ^ 2)     # if you forget some rules, this might help
```


The text after each line of code is called a
"comment". Anything that follows after the hash (or octothorpe) symbol
`#` is ignored by R when it executes code.

Really small or large numbers get a scientific notation:


```r
2/10000
```

```
[1] 2e-04
```

Which is shorthand for "multiplied by `10^XX`". So `2e-4`
is shorthand for `2 * 10^(-4)`.

You can write numbers in scientific notation too:


```r
5e3  # Note the lack of minus here
```

```
[1] 5000
```

## Mathematical functions

R has many built in mathematical functions. To call a function,
we simply type its name, followed by open and closing parentheses.
Anything we type inside the parentheses is called the function's
arguments:


```r
sum(1, 2, 3, 4, 5)
```

```
[1] 15
```



```r
sin(1)  # trigonometry functions
```

```
[1] 0.841471
```


```r
log(1)  # natural logarithm
```

```
[1] 0
```


```r
log10(10) # base-10 logarithm
```

```
[1] 1
```


```r
exp(0.5) # e^(1/2)
```

```
[1] 1.648721
```

Don't worry about trying to remember every function in R. You
can simply look them up on Google, or if you can remember the
start of the function's name, use the tab completion in RStudio.

This is one advantage that RStudio has over R on its own, it
has auto-completion abilities that allow you to more easily
look up functions, their arguments, and the values that they
take.

Typing a `?` before the name of a command will open the help page
for that command. As well as providing a detailed description of
the command and how it works, scrolling to the bottom of the
help page will usually show a collection of code examples which
illustrate command usage. We'll go through an example later.

## Comparing things

We can also do comparison in R:


```r
1 == 1  # equality (note two equals signs, read as "is equal to")
```

```
[1] TRUE
```


```r
1 != 2  # inequality (read as "is not equal to")
```

```
[1] TRUE
```


```r
1 < 2  # less than
```

```
[1] TRUE
```


```r
1 <= 1  # less than or equal to
```

```
[1] TRUE
```


```r
1 > 0  # greater than
```

```
[1] TRUE
```


```r
1 >= -9 # greater than or equal to
```

```
[1] TRUE
```

::: {.rmdtip}
**Tip: Comparing Numbers**

A word of warning about comparing numbers: you should
never use `==` to compare two numbers unless they are
integers (a data type which can specifically represent
only whole numbers).
:::

Computers may only represent decimal numbers with a
certain degree of precision, so two numbers which look
the same when printed out by R, may actually have
different underlying representations and therefore be
different by a small margin of error (called Machine
numeric tolerance).

Instead you should use the `all.equal()` function.

Further reading: [http://floating-point-gui.de/](http://floating-point-gui.de/)


## Variables and assignment

We can store values in variables using the assignment operator `<-`, like this:


```r
x <- 5
```

Notice that assignment does not print a value. Instead, we stored it for later
in something called a **variable**. `x` now contains the **value** `5`:


```r
x
```

```
[1] 5
```

More precisely, the stored value is a *decimal approximation* of
this fraction called a [floating point number](http://en.wikipedia.org/wiki/Floating_point).

Look for the `Environment` tab in one of the panes of RStudio, and you will see that `x` and its value
have appeared. Our variable `x` can be used in place of a number in any calculation that expects a number:


```r
log(x)
```

```
[1] 1.609438
```

Notice also that variables can be reassigned:


```r
x <- 100
```

`x` used to contain the value 5 and and now it has the value 100.

Assignment values can contain the variable being assigned to:


```r
x <- x + 1 #notice how RStudio updates its description of x on the top right tab
y <- x * 2
```

The right hand side of the assignment can be any valid R expression.
The right hand side is *fully evaluated* before the assignment occurs.

Variable names can contain letters, numbers, underscores and periods. They
cannot start with a number nor contain spaces at all. Different people use
different conventions for long variable names, these include

  * periods.between.words
  * underscores\_between_words
  * camelCaseToSeparateWords

What you use is up to you, but **be consistent**.

It is also possible to use the `=` operator for assignment:


```r
x = 1/40
```

But this is much less common among R users.  The most important thing is to
**be consistent** with the operator you use. There are occasionally places
where it is less confusing to use `<-` than `=`, and it is the most common
symbol used in the community. So the recommendation is to use `<-`.

### Challenge 1
> Which of the following are valid R variable names?
> 
> ```r
> min_height
> max.height
> _age
> .mass
> MaxLength
> min-length
> 2widths
> celsius2kelvin
> ```
> 
> <details>
> 
> <summary>
> Solution to challenge 1
> </summary>
>
> The following can be used as R variables:
> 
> ```r
> min_height
> max.height
> MaxLength
> celsius2kelvin
> ```
> 
> The following creates a hidden variable:
> 
> ```r
> .mass
> ```
> 
> The following will not be able to be used to create a variable
> 
> ```r
> _age
> min-length
> 2widths
> ```
> 
> <br />
> </details>


### Challenge 2
> What will be the value of each  variable  after each
> statement in the following program?
> 
> ```r
> mass <- 47.5
> age <- 122
> mass <- mass * 2.3
> age <- age - 20
> ```
> 
> <details>
> 
> <summary>
> Solution to challenge 2
> </summary>
> 
> <br />
> 
> 
> ```r
> mass <- 47.5
> ```
> This will give a value of 47.5 for the variable mass
> 
> ```r
> age <- 122
> ```
> This will give a value of 122 for the variable age
> 
> ```r
> mass <- mass * 2.3
> ```
> This will multiply the existing value of 47.5 by 2.3 to give a new value of
> 109.25 to the variable mass.
> 
> ```r
> age <- age - 20
> ```
> This will subtract 20 from the existing value of 122 to give a new value
> of 102 to the variable age.
> 
> </details>






### Challenge 3

> Run the code from the previous challenge, and write a command to
> compare mass to age. Is mass larger than age?
> 
> <details>
> 
> <summary>
> Solution to challenge 3
> </summary>
> 
> <br />
> 
> One way of answering this question in R is to use the `>` to set up the following:`
> 
> ```r
> mass > age
> ```
> 
> ```
> [1] TRUE
> ```
> 
> This should yield a boolean value of TRUE since 109.25 is greater than 102.
> 
> </details>






## Vectorization

One final thing to be aware of is that R is *vectorized*, meaning that
variables and functions can have vectors as values. In contrast to physics and
mathematics, a vector in R describes a set of values in a certain order of the 
same data type. For example


```r
1:5
```

```
[1] 1 2 3 4 5
```

```r
2 * (1:5)
```

```
[1]  2  4  6  8 10
```

```r
x <- 1:5
2 * x
```

```
[1]  2  4  6  8 10
```

```r
y <- c(1, 3, 5, 7, 9)
y
```

```
[1] 1 3 5 7 9
```

This is incredibly powerful; we will discuss this further in an
upcoming lesson.


## Managing your environment

There are a few useful commands you can use to interact with the R session.

`ls` will list all of the variables and functions stored in the global environment
(your working R session):


```r
ls()
```

```
[1] "age"            "fix_fig_path"   "knitr_fig_path" "mass"          
[5] "x"              "y"             
```

::: {.rmdtip}
**Tip: hidden objects**

Like in the shell, `ls` will hide any variables or functions starting
with a "." by default. To list all objects, type `ls(all.names=TRUE)`
instead
:::


Note here that we didn't give any arguments to `ls`, but we still
needed to give the parentheses to tell R to call the function.

If we type `ls` by itself, R will print out the source code for that function!


```r
ls
```

```
function (name, pos = -1L, envir = as.environment(pos), all.names = FALSE, 
    pattern, sorted = TRUE) 
{
    if (!missing(name)) {
        pos <- tryCatch(name, error = function(e) e)
        if (inherits(pos, "error")) {
            name <- substitute(name)
            if (!is.character(name)) 
                name <- deparse(name)
            warning(gettextf("%s converted to character string", 
                sQuote(name)), domain = NA)
            pos <- name
        }
    }
    all.names <- .Internal(ls(envir, all.names, sorted))
    if (!missing(pattern)) {
        if ((ll <- length(grep("[", pattern, fixed = TRUE))) && 
            ll != length(grep("]", pattern, fixed = TRUE))) {
            if (pattern == "[") {
                pattern <- "\\["
                warning("replaced regular expression pattern '[' by  '\\\\['")
            }
            else if (length(grep("[^\\\\]\\[<-", pattern))) {
                pattern <- sub("\\[<-", "\\\\\\[<-", pattern)
                warning("replaced '[<-' by '\\\\[<-' in regular expression pattern")
            }
        }
        grep(pattern, all.names, value = TRUE)
    }
    else all.names
}
<bytecode: 0x7fc3edf3e1f8>
<environment: namespace:base>
```

You can use `rm` to delete objects you no longer need:


```r
rm(x)
```

If you have lots of things in your environment and want to delete all of them,
you can pass the results of `ls` to the `rm` function:


```r
rm(list = ls())
```


::: {.rmdtip}
**Tip: Warnings vs. Errors**

Pay attention when R does something unexpected! Errors, like above,
are thrown when R cannot proceed with a calculation. Warnings on the
other hand usually mean that the function has run, but it probably
hasn't worked as expected.

In both cases, the message that R prints out usually give you clues
how to fix a problem.

:::

### Challenge 4

> Clean up your working environment by deleting the mass and age
> variables.
> 
> <details>
> 
> <summary>
> Solution to challenge 4
> </summary>
> 
> <br />
> 
> We can use the `rm` command to accomplish this task
> 
> ```r
> rm(age, mass)
> ```
> 
> </details>



## R Packages

Think of packages like apps on your smart phone. Your phone can do a lot of
things right out of the box, but you can get apps to make some existing
functionality better (like a better timer), or allow you to do new and amazing
things with your phone (like play Cwazy Cupcakes).

Similarly, R comes with many functions built in, but it is possible to add
functions to R by obtaining a package written by someone else. As of this
writing, there are over 10,000 packages available on CRAN (the comprehensive R
archive network).

R and RStudio have functionality for managing packages:

* You can see what packages are installed by typing
  `installed.packages()`
* You can install packages by typing `install.packages("packagename")`,
  where `packagename` is the package name, in quotes.
* You can update installed packages by typing `update.packages()`
* You can remove a package with `remove.packages("packagename")`
* You can make a package available for use with `library(packagename)`



### Challenge 5

> Install the following packages: `ggplot2`, `dplyr`.
> 
> <details>
> 
> <summary>
> Solution to challenge 5
> </summary>
> 
> <br />
> 
> 
> We can use the `install.packages()` command to install the required packages.
> 
> ```r
> install.packages("ggplot2")
> install.packages("dplyr")
> ```
> </details>


