
<!-- README.md is generated from README.Rmd. Please edit that file -->
fgeo DEMO <img src="inst/figures/logo.png" align="right" />
===========================================================

[![Travis build status](https://travis-ci.org/forestgeo/fgeo.svg?branch=master)](https://travis-ci.org/forestgeo/fgeo)

### Overview

THIS IS A DEMO.

The **fgeo** package is a collection of R packages curated by [ForestGEO](http://www.forestgeo.si.edu/). **fgeo** installs and loads multiple R packages in a single step. Each individual package is a self-contained module that provides tools for a particular type of analyses. The modular structure of **fgeo** makes it easy to maintain and expand ForestGEO's software. Together, all packages in **fgeo** provide a wide renge of tools to analyse forest dynamics. Learn more about the **fgeo** package at <http://forestgeo.github.io/fgeo>.

### Installation

    # To install from a private repo, use auth_token with a token
    # from https://github.com/settings/tokens. You only need the
    # repo scope. Best practice is to save your PAT in env var called
    # GITHUB_PAT.
    # install.packages("remotes")
    remotes::install_github("forestgeo/fgeo", auth_token = "abc")

### Usage

`library(fgeo)` will load the core **fgeo** packages. If **fgeo** conflicts with other packages you have loaded, you'll get summary.

``` r
library(fgeo)
#> -- Attaching packages ----------------------------------------- fgeo 0.0.0.9000 --
#> v bciex   0.0.0.9000     v forestr 0.0.0.9000
#> v bciex   0.0.0.9000     v try     0.0.0.9004
#> 
```

You can see conflicts created later with `fgeo_conflicts()`.

``` r
fgeo_conflicts()
```

### Packages

As well as the core packages, installing **fgeo** also installs a selection of other packages that you're likely to use frequently, but probably not in every analysis.

[See all packages](https://forestgeo.github.io/fgeo/reference/index.html)
