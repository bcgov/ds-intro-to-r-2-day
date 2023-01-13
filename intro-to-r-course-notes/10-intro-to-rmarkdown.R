#########  Data analysis reports #########
## Literate programming
## --------------------------------------------------------------------- 




## Example of Using R Markdown in the BC Government
## --------------------------------------------------------------------- 




### Documentation
## --------------------------------------------------------------------- 




### Teaching
## --------------------------------------------------------------------- 




### Presentation
## --------------------------------------------------------------------- 




# ## Challenge 1 (5 minutes)
#
# Take a few minutes to discuss in your groups the typical ways in which
# you share results. What you do you do in the scenario where the data changes
# but the analysis needs to be the same?
#
## Creating an R Markdown file
## --------------------------------------------------------------------- 




## Basic components of R Markdown
## --------------------------------------------------------------------- 




## Markdown
## --------------------------------------------------------------------- 




# Title
## Main section
## --------------------------------------------------------------------- 




### Sub-section
## --------------------------------------------------------------------- 




#### Sub-sub section
## --------------------------------------------------------------------- 




# ## Challenge 2
#
# Create a new R Markdown document. Delete all of the R code chunks
# and write a bit of Markdown (some sections, some italicized
# text, and an itemized list).
#
# Convert the document to a webpage.
#
# > ## Solution to Challenge 2
# >
# > In RStudio, select File > New file > R Markdown... 
# > 
# > Delete the placeholder text and add the following:
# > 
# > ```
# > # Introduction
# > 
# > ## Background on Data
# > 
# > This report uses the *gapminder* dataset, which has columns that include:
# > 
# > * country
# > * continent
# > * year
# > * lifeExp
# > * pop
# > * gdpPercap
# > 
# > ## Background on Methods
# > 
# > ```
# > 
# > Then click the 'Knit' button on the toolbar to generate an html document (webpage).
### A bit more Markdown
## --------------------------------------------------------------------- 




### R code chunks
## --------------------------------------------------------------------- 




## How R Markdown gets compiled
## --------------------------------------------------------------------- 




## Chunk options
## --------------------------------------------------------------------- 




# Tips: Finding help with chunk options
# You can review all of the `R` chunk options by navigating to
# the "R Markdown Cheat Sheet" under the "Cheatsheets" section 
# of the "Help" field in the toolbar at the top of RStudio.
#
### Global options
## --------------------------------------------------------------------- 




### Formatting figures 
## --------------------------------------------------------------------- 




# ## Challenge 4
#
# Generate a plot using the **gapminder** dataset and `ggplot2` package. Use the chunk options to control the size and alignment of the figure.
# > ## Solution to Challenge 4
# > 
# > <pre>
# > &#96;&#96;&#96;{r pretty_plot, eval = TRUE, echo = FALSE, fig.cap= "Pretty Plot", fig.width = 5, fig.height = 5, fig.align = 'centre'}
# > ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
# > &#96;&#96;&#96;
# > </pre>
# > 
# > ```{r pretty_plot, eval = TRUE, echo = FALSE, fig.cap= "Pretty Plot", fig.width = 5,fig.height = 5, fig.align = 'centre'}
# > ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
# > ```
# > 
## Inline R code
## --------------------------------------------------------------------- 




# ## Challenge 5
#
# Try out a bit of in-line R code using a simple addition eg: 2+2. 
# > ## Solution to Challenge 5
# > 
# > Here's some inline code to determine that 2 + 2 = `` `r 2+2` ``.
# > 
## Other outputs: Word, PDF and more...
## --------------------------------------------------------------------- 




### A note about Rmd outputs
## --------------------------------------------------------------------- 




# ## Tips: Creating PDF documents
#
# Markdown documents can be compiled to PDF, however it will likely you will require additional 
# software called LaTex. This software can be tricky to install and it is reccommended to use  
# [tinytex](https://yihui.org/tinytex/) as an alternative. This R package is a lightweight 
# version of LaTex is designed for r users. You can install using the following commands: 
#
#```{r install tinytex, eval = FALSE}
# tinytex::install_tinytex()
#```
# There is lots of information and help available - see [tinytex FQA page](https://yihui.org/tinytex/faq/)
#
## Resources
## --------------------------------------------------------------------- 




