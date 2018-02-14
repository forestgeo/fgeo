
<!-- README.md is generated from README.Rmd. Please edit that file -->
NOT RELEASED
============

fgeo: Analyze forest diversity and dynamics <img src="https://i.imgur.com/39pvr4n.png" align="right" height=44 />
=================================================================================================================

[![Travis build status](https://travis-ci.org/forestgeo/fgeo.svg?branch=master)](https://travis-ci.org/forestgeo/fgeo)

**fgeo** installs and loads multiple R packages of [ForestGEO](http://www.forestgeo.si.edu/) in a single step. Together, all packages of **fgeo** provide a wide range of tools to analyse forest diversity and dynamics. To learn more about the structure of ForestgGEO's software see [this article](https://goo.gl/c5X6qk).

[See all packages](https://forestgeo.github.io/fgeo/reference/index.html)

Installation
------------

To install **fgeo** run the following code in R:

    missing_remotes <- !require(remotes)
    if (missing_remotes) {
      install.packages("remotes")
    }

    remotes::install_github("forestgeo/fgeo")

To learn the details about how to install packages from GitHub, read [this blog post](https://goo.gl/dQKEeg).

Usage
-----

Load the core **fgeo** packages in one step.

``` r
library(fgeo)
#> -- Attaching packages -------------------------------------------- fgeo 0.0.0.9000 --
#> v bciex           0.0.0.9000     v fgeo.habitat    0.0.0.9001
#> v fgeo.abundance  0.0.0.9002     v fgeo.map        0.0.0.9203
#> v fgeo.demography 0.0.0.9000     v fgeo.tool       0.0.0.9002
#> 
```

Check conflicts with other packages with `fgeo_conflicts()`.

``` r
# Intentionally creating a conflict to show it
abundance <- function() {
  "An intentianal conflic to demonstrate `fgeo_conflicts()`"
}

fgeo_conflicts()
```

Run this to update **fgeo**. This will re-install only the packages that have changed since the last installation -- so it will take a fraction of what it took the first time you installed **fgeo**.

    fgeo_update()
