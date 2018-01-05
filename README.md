
<!-- README.md is generated from README.Rmd. Please edit that file -->
fgeo: Analyze forest diversity and dynamics <img src="https://i.imgur.com/39pvr4n.png" align="right" height=44 />
=================================================================================================================

[![Travis build status](https://travis-ci.org/forestgeo/fgeo.svg?branch=master)](https://travis-ci.org/forestgeo/fgeo)

Overview
--------

**fgeo** installs and loads multiple R packages of [ForestGEO](http://www.forestgeo.si.edu/) in a single step. Together, all packages in **fgeo** provide a wide renge of tools to analyse forest diversity and dynamics.

[See all packages](https://forestgeo.github.io/fgeo/reference/index.html)

Installation
------------

    # To install from a private repo, see auth_token at https://goo.gl/re1LFe
    # install.packages("remotes")
    remotes::install_github("forestgeo/fgeo")

Usage
-----

`library(fgeo)` will load the core **fgeo** packages.

``` r
library(fgeo)
#> -- Attaching packages ------------------------------------------------- fgeo 0.0.0.9000 --
#> v fgeo.abundance 0.0.0.9002     v fgeo.utils     0.0.0.9000
#> v fgeo.abundance 0.0.0.9002     v map            0.0.0.9009
#> 
```

You can see conflicts with other packages with `fgeo_conflicts()`.

``` r
# Intentionally creating a conflict to show it
abundance <- function() "I conflict with fgeo.abundance::abundance()"
fgeo_conflicts()
#> -- Conflicts --------------------------------------------------------- fgeo_conflicts() --
#> x .GlobalEnv::abundance() masks fgeo.abundance::abundance()
```

**fgeo** installs these packages:

``` r
fgeo_packages()
#> [1] "bciex"          "cli"            "crayon"         "fgeo.abundance"
#> [5] "fgeo.utils"     "map"            "purrr"          "rstudioapi"    
#> [9] "fgeo"
```

**fgeo** loads these packages:

``` r
fgeo:::core
#> [1] "fgeo.abundance" "fgeo.utils"     "map"
```
