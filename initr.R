## update currently installed packages
update.packages(ask = FALSE)

## optimize building packages from source
makeflag <- paste0("-j", parallel::detectCores()/2)
Sys.setenv(MAKEFLAGS = makeflag)

## install CRAN packages
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

## use devtools for github packages
devtools::install_github(c(
  'kbicknell/lmer.slimr',
  'langcomp/ggintervals'
))

## stan
source('http://mc-stan.org/rstan/install.R', echo = TRUE, max.deparse.length = 2000)
install_rstan()
