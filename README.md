
<!-- README.md is generated from README.Rmd. Please edit that file -->

# <img src="https://i.imgur.com/39pvr4n.png" align="right" height=44 /> fgeo: Analyze forest diversity and dynamics

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.org/forestgeo/fgeo.svg?branch=master)](https://travis-ci.org/forestgeo/fgeo)
[![Coverage
status](https://coveralls.io/repos/github/forestgeo/fgeo/badge.svg)](https://coveralls.io/r/forestgeo/fgeo?branch=master)
[![CRAN
status](https://www.r-pkg.org/badges/version/fgeo)](https://cran.r-project.org/package=fgeo)

**fgeo** installs and loads multiple R packages and functions in a
single
step.

## [Search packages and functions](https://forestgeo.github.io/fgeo.abundance/articles/fgeo.html)

## Installation

    # install.packages("remotes")
    remotes::install_github("forestgeo/fgeo")

To learn the details about how to install packages from GitHub, read
[this blog post](https://goo.gl/dQKEeg).

## Example

Load all **fgeo** packages in one step.

``` r
library(fgeo)
#> -- Attaching packages -------------------------------------------- fgeo 0.0.0.9000 --
#> v bciex           0.0.0.9000     v fgeo.habitat    0.0.0.9001
#> v fgeo.abundance  0.0.0.9002     v fgeo.map        0.0.0.9203
#> v fgeo.demography 0.0.0.9000     v fgeo.tool       0.0.0.9002
#> 
```

Update packages that changed since last installation.

    fgeo_update()

Table packages.

``` r
fgeo_index_packages()
#>           package                                           Title
#> 1           bciex Forest Dynamics Data from Barro Colorado Island
#> 2            fgeo   Easily Install and Load Packages of ForestGEO
#> 3  fgeo.abundance  R packages for the Analysis of Forest Dynamics
#> 4 fgeo.demography                                Demography Tools
#> 5    fgeo.habitat                                Habitat Analyses
#> 6        fgeo.map                            Map ForestGEO's Data
#> 7       fgeo.tool            Utility Tools for ForestGEO Packages
```

Table and explore functions.

``` r
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
funs <- fgeo_index_functions()
sample_n(funs, 10)
#>            package                  fun
#> 43        fgeo.map            map_gx_gy
#> 2             fgeo       fgeo_conflicts
#> 8             fgeo            fgeo_link
#> 74       fgeo.tool   fieldforms_prepare
#> 72       fgeo.tool    fieldforms_header
#> 81       fgeo.tool           nms_detect
#> 45        fgeo.map      map_quad_header
#> 83       fgeo.tool  nms_extract_anycase
#> 79       fgeo.tool ls_list_spreadsheets
#> 29 fgeo.demography          recruitment
```

## Related projects

  - [CTFS-R Package](http://ctfs.si.edu/Public/CTFSRPackage/).

  - [BIOMASS](https://CRAN.R-project.org/package=BIOMASS): An R package
    to estimate above-ground biomass in tropical
        forests.
    
      - [Description](https://CRAN.R-project.org/package=BIOMASS)
      - [Manual](https://cran.r-project.org/web/packages/BIOMASS/BIOMASS.pdf)
      - [Vignette](https://cran.r-project.org/web/packages/BIOMASS/vignettes/VignetteBiomass.html)

-----

Please note that this project is released with a [Contributor Code of
Conduct](.github/CODE_OF_CONDUCT.md). By participating in this project
you agree to abide by its terms.
