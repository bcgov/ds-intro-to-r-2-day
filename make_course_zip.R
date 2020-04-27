course <- "intro-r-May2020"

rmarkdown::render(file.path(course, "README.Rmd"))

files <- file.path(
  course, setdiff(list.files(course, recursive = TRUE,
                             include.dirs = TRUE), "README.Rmd")
)

zipfile <- paste0(course, ".zip")
if (file.exists(zipfile)) unlink(zipfile)
zip(zipfile, files)
