
<!-- README.md is generated from README.Rmd. Please edit that file -->
NOT RELEASED
============

fgeo: Analyze forest diversity and dynamics <img src="https://i.imgur.com/39pvr4n.png" align="right" height=44 />
=================================================================================================================

[![Travis build status](https://travis-ci.org/forestgeo/fgeo.svg?branch=master)](https://travis-ci.org/forestgeo/fgeo)

**fgeo** installs and loads multiple R packages of [ForestGEO](http://www.forestgeo.si.edu/) in a single step. Together, all packages of **fgeo** provide a wide renge of tools to analyse forest diversity and dynamics. To learn more about the structure of ForestgGEO's software see [this article](https://goo.gl/c5X6qk).

[See all packages](https://forestgeo.github.io/fgeo/reference/index.html)

Installation
------------

    # install.packages("remotes")
    remotes::install_github("forestgeo/fgeo")

Usage
-----

`library(fgeo)` will load the core **fgeo** packages.

``` r
library(fgeo)
#> -- Attaching packages ----------------------------------------------------- fgeo 0.0.0.9000 --
#> v bciex           0.0.0.9000     v fgeo.habitat    0.0.0.9001
#> v fgeo.abundance  0.0.0.9002     v fgeo.map        0.0.0.9202
#> v fgeo.demography 0.0.0.9000     v fgeo.tool       0.0.0.9002
#> 
#> 
#> Attaching package: 'fgeo'
#> The following object is masked _by_ 'package:fgeo.tool':
#> 
#>     fgeo_package_deps
```

You can see conflicts with other packages with `fgeo_conflicts()`.

``` r
# Intentionally creating a conflict to show it
abundance <- function() "I conflict with fgeo.abundance::abundance()"
fgeo_conflicts()
```
