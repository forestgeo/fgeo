
<!-- README.md is generated from README.Rmd. Please edit that file -->
fgeo: Analyze forest dynamics <img src="inst/figures/logo.png" align="right" />
===============================================================================

[![Travis build status](https://travis-ci.org/forestgeo/fgeo.svg?branch=master)](https://travis-ci.org/forestgeo/fgeo)

Overview
--------

**fgeo** installs and loads multiple R packages of [ForestGEO](http://www.forestgeo.si.edu/) in a single step. Together, all packages in **fgeo** provide a wide renge of tools to analyse forest dynamics.

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
#> -- Attaching packages ---------------------------------------------- fgeo 0.0.0.9000 --
#> v fgeo.abundance 0.0.0.9002     v map            0.0.0.9008
#> 
```

You can see conflicts with other packages with `fgeo_conflicts()`.

``` r
abundance <- function() "I conflict with fgeo.abundance::abundance()"
fgeo_conflicts()
#> -- Conflicts ------------------------------------------------------ fgeo_conflicts() --
#> x .GlobalEnv::abundance() masks fgeo.abundance::abundance()
```

**fgeo** installs these packages:

``` r
fgeo_packages()
#> [1] "bciex"          "cli"            "crayon"         "fgeo.abundance"
#> [5] "map"            "purrr"          "rstudioapi"     "fgeo"
```

**fgeo** loads these packages:

``` r
fgeo:::core
#> [1] "fgeo.abundance" "map"
```
