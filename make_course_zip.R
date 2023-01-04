local({
  course <- "intro-to-r-course-notes"

  file.copy(list.files("data", full.names = TRUE),
            file.path(course, "data"), overwrite = TRUE)

  orig_wd <- setwd(course)
  on.exit(setwd(orig_wd))

  rmarkdown::render("README.Rmd")

  files <- setdiff(list.files(recursive = TRUE, include.dirs = TRUE), "README.Rmd")

  zipfile <- file.path(orig_wd, paste0(course, ".zip"))
  if (file.exists(zipfile)) unlink(zipfile)
  zip(zipfile, files)
})
