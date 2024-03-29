---
title: "Further Application of R Markdown"
teaching: 45
exercises: 15
questions:
- "How can I use R Markdown to integrate analysis results in my report?"
objectives:
- "Introduction to regression with lm()"
- "Demonstrate how to add a regression line and statistics to a ggplot"
- "Introduction to the `broom` package for 'tidying' statistical results"
- "Demonstrate how to include statistical results in a reproducible document"
source: Rmd
---



# Applications of R Markdown

Now that we've learned the basics of R and R Markdown, we're going to tie some 
things together by doing a regression on the Gapminder data and displaying our
results in a nicely formatted document.

Working in a new R Markdown document (File -> New File -> R Markdown Document), 
we can load the libraries that we are going to use, and load the data in 
a code chunk:

<pre>
&#96;&#96;&#96;{r load}
library(readr)
library(dplyr)
library(ggplot2)
gapminder <- read_csv("data/gapminder_data.csv")
&#96;&#96;&#96;
</pre>

For now, we are just going to use the data for Canada, so let's insert a code
chunk to filter our data to just Canada:

<pre>
&#96;&#96;&#96;{r filter-can}
canada <- filter(gapminder, country == "Canada")
&#96;&#96;&#96;
</pre>

We want to do a regression investigating the relationship between life
expectancy and per-capita GDP in Canada. 

We can start by inserting another code chunk to do a quick visualization of the
data. We can insert the regression line on the points, but this doesn't give us
the regression coefficients, significance, etc. that we need to really evaluate
the relationship.

<pre>
&#96;&#96;&#96;{r plot-1}
ggplot(canada, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point() + 
  geom_smooth(method = "lm")
&#96;&#96;&#96;
</pre>

We use the `lm()` function to perform a General Linear Model (GLM), of which 
a regression is one form. It is specified by a new syntax, a "formula" syntax:

```r
lm(response ~ predictor(s), data = data, ...)
```

So in our case, we can put in a new code chunk to fit the model: 

<pre>
&#96;&#96;&#96;{r model}
canada_lm <- lm(lifeExp ~ gdpPercap, data = canada)
summary(canada_lm)
&#96;&#96;&#96;
</pre>

The `summary()` function gives us the high level information from our regression 
model: The coefficient estimates, the R-squared, and the p-value.

To this point we have been using *ggplot2* for plotting, but there is also a 
built-in `plot()` function. If we use that function on a model, it gives us 
some basic diagnostic plots:

<pre>
&#96;&#96;&#96;{r diagnostics}
plot(canada_lm)
&#96;&#96;&#96;
</pre>

But these `lm` objects are ungainly - they are fine to look at to inspect the 
important parts of our model, but difficult to extract those pieces that we 
want to use later - such as regression coefficients and P values.

There is another package we can use, called *broom*, that is used to tidy
model results into a format we are familiar with: a `data.frame`. *broom* works 
with many different types of models, today we are going to use it on our `lm`.

You will first need to install the package:

```r
install.packages("broom")
```

Then add a chunk that loads the package, and calls the most commonly-used
functions in *broom*:

<pre>
&#96;&#96;&#96;{r broom}
library(broom)
model_summary <- glance(canada_lm)
model_summary
model_terms <- tidy(canada_lm)
model_terms
model_predict <- augment(canada_lm)
model_predict
&#96;&#96;&#96;
</pre>

- `glance` gives us the model-level summary. The r-squared and adjusted r-squared, 
the F statistic, the P value, etc.
- `tidy` gives us the information for each term in the regression - in our 
case just the intercept and the estimated effect of per-capita GDP on life expectancy.
- `augment` gives us the estimated values of the response variable as predicted
by our model.

Now that these are in a data frame, we can use them more easily. Let's plot our 
regression line onto our plot:

<pre>
&#96;&#96;&#96;{r plot-lm}
ggplot() + 
  geom_point(data = canada, aes(x = gdpPercap, y = lifeExp)) + 
  geom_line(data = model_predict, aes(x = gdpPercap, y = .fitted))
&#96;&#96;&#96;
</pre>

Again, using the data frame containing our predicted values, we can calculate
the 95% confidence limits, and plot them as well:

<pre>
&#96;&#96;&#96;{r plot-ci, echo=FALSE}
model_predict <- model_predict %>% 
  mutate(lower_ci = .fitted - 1.96 * .se.fit, 
         upper_ci = .fitted + 1.96 * .se.fit)

ggplot() + 
  geom_ribbon(data = model_predict, aes(x = gdpPercap, ymin = lower_ci, ymax = upper_ci), alpha = 0.2) + 
  geom_point(data = canada, aes(x = gdpPercap, y = lifeExp)) + 
  geom_line(data = model_predict, aes(x = gdpPercap, y = .fitted))
&#96;&#96;&#96;
</pre>

If we compare this plot to the auto-generated line we added at the beginning of 
the lesson (using `geom_smooth()`), we see they are the same.

We can also pull out some of those model terms and report on them "reproducibly":

In our plot:

<pre>
&#96;&#96;&#96;{r model-stats, echo=FALSE}
r2 <- round(model_summary$adj.r.squared, 2)
sig_0.05 <- ifelse(model_summary$p.value < 0.05, "p < 0.05", "p > 0.05")

ggplot() + 
  geom_ribbon(data = model_predict, aes(x = gdpPercap, ymin = lower_ci, ymax = upper_ci), alpha = 0.2) + 
  geom_point(data = canada, aes(x = gdpPercap, y = lifeExp)) + 
  geom_line(data = model_predict, aes(x = gdpPercap, y = .fitted)) + 
  geom_text(aes(x = 72, y = 30000), label = paste0("R^2 = ", r2, "; ", sig_0.05))
&#96;&#96;&#96;
</pre>

And in text:

<pre>
&#96;&#96;&#96;{r lifeExp-stats, echo=FALSE}
life_exp <- filter(model_terms, term == "gdpPercap")
life_exp_estimate <- round(life_exp$estimate, 1)
life_exp_se <- round(life_exp$std.error, 1)
&#96;&#96;&#96;
</pre>

Then in our document we can type:

```
The predicted effect of per-capita GDP on life expectancy is `r life_exp_estimate` 
(SE: `r life_exp_se`), meaning that for every dollar increase in per-capita GDP
we live longer by approximately `r life_exp_esimate` years.
```

This helps reduce typos, copy-paste errors, and ensures that if our data change, 
so do our results.


> ## Challenge 1
>
> Create a copy of your report for Canada, and do it for the country of your choice.
> 
> > ## Solution to Challenge 1
> > 
> > All you really need to do is change <pre>"Canada"</pre> in your
> > <pre>filter</pre> statement to another country of your choosing.
> 

> ## Challenge 2
>
> Remove or add chunks, and change the chunk options to only show the figures 
> and results so the rendered report looks like a report you would submit.
> 
> > ## Solution to Challenge 2
> > 
> > Possible chunk options to change:
> > <pre>results='hide'</pre>
> > <pre>echo=FALSE</pre>
> > <pre>message=FALSE</pre>
> > <pre>include=FALSE</pre>
> 
