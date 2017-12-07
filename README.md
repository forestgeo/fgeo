
<!-- README.md is generated from README.Rmd. Please edit that file -->
fgeo <img src="inst/figures/logo.png" align="right" />
======================================================

[![Travis build status](https://travis-ci.org/forestgeo/fgeo.svg?branch=master)](https://travis-ci.org/forestgeo/fgeo)

Overview
--------

The **fgeo** package is a collection of R packages curated by [ForestGEO](http://www.forestgeo.si.edu/). **fgeo** installs and loads multiple R packages in a single step. Each individual package is a self-contained module that provides tools for a particular type of analyses. The modular structure of **fgeo** makes it easy to maintain and expand ForestGEO's software. Together, all packages in **fgeo** provide a wide renge of tools to analyse forest dynamics. Learn more about the **fgeo** package at <http://forestgeo.github.io/fgeo>.

Installation
------------

    # install.packages("remotes")
    remotes::install_github("forestgeo/fgeo")

Usage
-----

`library(fgeo)` will load the core **fgeo** packages:

-   [**bciex**](https://forestgeo.github.io/bciex/), to access data for examples.
-   [**try**](https://forestgeo.github.io/try/), to experiment with "beta" code.
-   ...

You also get a condensed summary of conflicts with other packages you have loaded:

``` r
library(fgeo)
#> -- Attaching packages ---------------------------------------------------- fgeo 0.0.0.9000 --
#> v try   0.0.0.9004     v bciex 0.0.0.9000
#> 
```

You can see conflicts created later with `fgeo_conflicts()`:

``` r
fgeo_conflicts()
```

Packages
--------

As well as the core packages, installing **fgeo** also installs a selection of other packages that you're likely to use frequently, but probably not in every analysis. This includes packages for:

-   Analyse soil data:

    -   [**soilkrig**](https://forestgeo.github.io/soilkrig/), to krig soil data as per John et al. (2007).
    -   ...

-   Topic 2:

    -   ...
    -   ...
