# These settings control the behavior of all chunks in the challenge R materials.
# For more information on available chunk options, see
# http://yihui.name/knitr/options#chunk_options

library("knitr")

opts_chunk$set(tidy = FALSE, results = "markup", comment = NA,
               fig.align = "center",
               fig.width = 4.5, fig.height = 3.5,
               fig.retina = 2)

