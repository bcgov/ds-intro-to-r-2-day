[![img](https://img.shields.io/badge/Lifecycle-Stable-97ca00)](https://github.com/bcgov/repomountie/blob/master/doc/lifecycle-badges.md)


# Introduction to Data Science Using R

A repository to house materials for a 4 session course introducing participants to data science using [R](https://www.r-project.org/).


This workshop will be delivered over four half-day sessions. The goal of the workshop is to teach _new-to-programming_ data professionals to import data, clean up and summarize a data set, and make some static data visualizations using the program R. R is a popular statistical computing language, commonly used in many scientific disciplines for statistical analysis, generating production-quality graphics, and automating data workflow tasks. The workshop content will follow best practices for using R for data analysis, giving attendees a foundation in the fundamentals of R and scientific computing.


## Workshop Schedule

### Daily schedule
| Activity   | Start Time | End time |
|------------|------------|----------|
| Session #1 | 9:00       | 10:30    |
| Break      | 10:30      | 10:45    |
| Session #2 | 10:45      | 12:00    |


**Course Notes**: https://bcgov.github.io/ds-intro-to-r-2-day/  

**Download Course Materials**:  
```
install.packages("usethis")
usethis::use_course("https://github.com/bcgov/ds-intro-to-r-2-day/raw/master/intro-r-May2020.zip")
```  

**Confirm or Find Location of Your R Library**:  
```
.libPaths()
```  

### Day 1

- Introduction to Virtual Meeting Tool (30 minutes) <!-- Dominique -->
- Virtual Help Desk: Getting setup with R & RStudio (60 minutes) <!-- All -->
- BREAK ☕
- Introduction to R & RStudio (50 minutes) 
- Seeking Help in R (25 minutes) 

### Day 2

- Review (10 minutes)
- Project Management with RStudio (30 minutes)  
- Data Structures (50 minutes)  
- BREAK ☕
- Exploring Data Frames (30 minutes)
- Making Publication Quality Plots with `ggplot2` Pt. 1  (40 minutes)  

### Day 3

- Review (10 minutes)
- Making Publication Quality Plots with `ggplot2` Pt. 2  (60 minutes)  
- BREAK ☕
- Data Manipulation with `dplyr` (60 minutes)  

### Day 4

- Data Manipulation with `tidyr` (45 minutes) 
- Seeking Help from Others with `reprex` (30 minutes)
- BREAK ☕
- Introduce `bcdata` and practice `ggplot2` and `dplyr` (75 minutes) 



Most of the above lesson material is sourced or an adaptation of the [Software Carpentry Foundation](http://software-carpentry.org/) (now The Carpenties) [R for Reproducible Scientific Analysis](http://swcarpentry.github.io/r-novice-gapminder/) lesson material: Thomas Wright and Naupaka Zimmerman (eds): _Software Carpentry: R for
Reproducible Scientific Analysis_.  Version 2016.06, June 2016,
https://github.com/swcarpentry/r-novice-gapminder,
10.5281/zenodo.57520.

The R Markdown sections also draw material from Nicholas Tierney's excellent _R Markdown for Scientists_ course which is available here: https://rmd4sci.njtierney.com/


### Course Offerings


#### Introduction to Data Science in R, Feb 1, 2, 7 & 8, 2022 
- _Instructors_: [Andy Teucher](https://github.com/ateucher), [Sam Albers](https://github.com/boshek) & [Bonnie Robert](https://github.com/BonnieJRobert/)
- _Suggested pre-reading_: [Good Enough Practices for Scientific Computing](https://github.com/swcarpentry/good-enough-practices-in-scientific-computing/blob/gh-pages/good-enough-practices-for-scientific-computing.pdf)
- _Course material_: https://bcgov.github.io/ds-intro-to-r-2-day/


#### Introduction to Data Science in R, May 6-7, 2020 
- _Instructors_: [Sam Albers](https://github.com/boshek), [Stephanie Hazlitt](https://github.com/stephhazlitt), [Genevieve Perkins](https://github.com/gcperk) & [Andy Teucher](https://github.com/ateucher)
- _Suggested pre-reading_: [Good Enough Practices for Scientific Computing](https://github.com/swcarpentry/good-enough-practices-in-scientific-computing/blob/gh-pages/good-enough-practices-for-scientific-computing.pdf)
- _Course material_: https://bcgov.github.io/ds-intro-to-r-2-day/
- _What we actually did on the day_: 



### Getting Help or Reporting an Issue

To report bugs/issues/feature requests, please file an [issue](https://github.com/bcgov/ds-cop-intro-to-r/issues/).


### How to Contribute

If you would like to contribute, please see our [CONTRIBUTING](CONTRIBUTING.md) guidelines.

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.


### License

[![Creative Commons License](https://i.creativecommons.org/l/by/4.0/88x31.png)](http://creativecommons.org/licenses/by/4.0/). 

```
Original Work Copyright © Software Carpentry, content modified by the Province of British Columbia.

This work is licensed under the Creative Commons Attribution 4.0 International License.
To view a copy of this license, visit http://creativecommons.org/licenses/by/4.0/.
```
---
*This project was created using the [bcgovr](https://github.com/bcgov/bcgovr) package.* 
