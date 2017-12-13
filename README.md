
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
#> -- Attaching packages ----------------------------------------- fgeo 0.0.0.9000 --
#> v forestr    0.0.0.9000     v bciex      0.0.0.9000
#> v map        0.0.0.9007     v demography 0.0.0.9000
#> 
```

You can see conflicts with other packages with `fgeo_conflicts()`.

``` r
library(ctfs)
#> 
#> Attaching package: 'ctfs'
#> The following objects are masked from 'package:demography':
#> 
#>     growth, mortality, recruitment
#> The following object is masked from 'package:forestr':
#> 
#>     abundance

fgeo_conflicts()
#> -- Conflicts ------------------------------------------------- fgeo_conflicts() --
#> x ctfs::abundance()   masks forestr::abundance()
#> x ctfs::growth()      masks demography::growth()
#> x ctfs::mortality()   masks demography::mortality()
#> x ctfs::recruitment() masks demography::recruitment()
```

**fgeo** installs these packages:

``` r
fgeo_packages()
#> [1] "bciex"      "cli"        "crayon"     "demography" "forestr"   
#> [6] "map"        "purrr"      "rstudioapi" "fgeo"
```

**fgeo** loads these packages:

``` r
fgeo:::core
#> [1] "forestr"    "map"        "bciex"      "demography"
```
