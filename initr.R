## first update currently installed packages
update.packages(ask = FALSE)

## next install CRAN packages
install_if_not_already_cran <- function(package_list) {
  installed <-
    suppressMessages(
      suppressWarnings(
        sapply(package_list, require, quietly = TRUE,
               warn.conflicts = FALSE, character.only = TRUE)))
  
  to_install <- package_list[!installed]
  sapply(to_install, install.packages)
  invisible()
}

install_if_not_already_cran(c(
  'devtools',
  'doParallel',
  'dplyr',
  'rjags',
  'ggplot2',
  'ggthemes',
  'grid',
  'gridExtra',
  'Hmisc',
  'lme4',
  'MASS',
  'mixtools',
  'stringr',
  'tidyr'
))

## last, use devtools for github packages
devtools::install_github(c(
  'kbicknell/lmer.slimr',
  'langcomp/ggintervals'
))
