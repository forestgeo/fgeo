
<!-- README.md is generated from README.Rmd. Please edit that file -->

# <img src="https://i.imgur.com/39pvr4n.png" align="right" height=44 /> fgeo: Analyze forest diversity and dynamics

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.org/forestgeo/fgeo.svg?branch=master)](https://travis-ci.org/forestgeo/fgeo)
[![Coverage
status](https://coveralls.io/repos/github/forestgeo/fgeo/badge.svg)](https://coveralls.io/r/forestgeo/fgeo?branch=master)
[![CRAN
status](https://www.r-pkg.org/badges/version/fgeo)](https://cran.r-project.org/package=fgeo)

**fgeo** installs and loads multiple R packages of
[ForestGEO](http://www.forestgeo.si.edu/) in a single step.

Together, all packages of **fgeo** provide a wide range of tools to
analyse forest diversity and dynamics. To learn more about the structure
of ForestgGEO’s software see [this article](https://goo.gl/c5X6qk).

## Installation

    # install.packages("remotes")
    remotes::install_github("forestgeo/fgeo")

To learn the details about how to install packages from GitHub, read
[this blog
post](https://goo.gl/dQKEeg).

## fgeo packages

| package                                                                 | Title                                           |
| :---------------------------------------------------------------------- | :---------------------------------------------- |
| <a href=https://forestgeo.github.io/bciex>bciex</a>                     | Forest Dynamics Data from Barro Colorado Island |
| <a href=https://forestgeo.github.io/fgeo>fgeo</a>                       | Easily Install and Load Packages of ForestGEO   |
| <a href=https://forestgeo.github.io/fgeo.abundance>fgeo.abundance</a>   | R packages for the Analysis of Forest Dynamics  |
| <a href=https://forestgeo.github.io/fgeo.demography>fgeo.demography</a> | Demography Tools                                |
| <a href=https://forestgeo.github.io/fgeo.habitat>fgeo.habitat</a>       | Habitat Analyses                                |
| <a href=https://forestgeo.github.io/fgeo.map>fgeo.map</a>               | Map ForestGEO’s Data                            |
| <a href=https://forestgeo.github.io/fgeo.tool>fgeo.tool</a>             | Utility Tools for ForestGEO Packages            |

For an index of all **fgeo** functions by package see [Get
started](https://forestgeo.github.io/fgeo/articles/fgeo.html).

## Example

Load all **fgeo** packages in one step.

``` r
library(fgeo)
#> -- Attaching packages ---------------------------------------- fgeo 0.0.0.9000 --
#> v bciex           0.0.0.9000     v fgeo.habitat    0.0.0.9001
#> v fgeo.abundance  0.0.0.9002     v fgeo.map        0.0.0.9203
#> v fgeo.demography 0.0.0.9000     v fgeo.tool       0.0.0.9002
#> -- Conflicts ------------------------------------------------ fgeo_conflicts() --
#> x dplyr::filter()    masks stats::filter()
#> x dplyr::intersect() masks base::intersect()
#> x dplyr::lag()       masks stats::lag()
#> x dplyr::setdiff()   masks base::setdiff()
#> x dplyr::setequal()  masks base::setequal()
#> x dplyr::union()     masks base::union()
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
funs <- fgeo_index_functions()
sample_n(funs, 10)
#>            package                fun
#> 51        fgeo.map    suffix_edge_tag
#> 102      fgeo.tool        type_ensure
#> 55        fgeo.map               wrap
#> 14  fgeo.abundance         basal_area
#> 101      fgeo.tool        to_recensus
#> 86       fgeo.tool      nms_lowercase
#> 58       fgeo.tool       add_col_row2
#> 87       fgeo.tool        nms_restore
#> 74       fgeo.tool fieldforms_prepare
#> 42        fgeo.map           map_elev
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
