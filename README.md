
<!-- README.md is generated from README.Rmd. Please edit that file -->

# <img src="https://i.imgur.com/39pvr4n.png" align="right" height=44 /> fgeo: Analyze forest diversity and dynamics

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.org/forestgeo/fgeo.svg?branch=master)](https://travis-ci.org/forestgeo/fgeo)
[![Coverage
status](https://coveralls.io/repos/github/forestgeo/fgeo/badge.svg)](https://coveralls.io/r/forestgeo/fgeo?branch=master)
[![CRAN
status](https://www.r-pkg.org/badges/version/fgeo)](https://cran.r-project.org/package=fgeo)

**fgeo** installs and loads multiple packages, functions and datasets in
a single
step.

## Packages

| package                                                                 | title                                           |
| :---------------------------------------------------------------------- | :---------------------------------------------- |
| <a href=https://forestgeo.github.io/bciex>bciex</a>                     | Forest Dynamics Data from Barro Colorado Island |
| <a href=https://forestgeo.github.io/fgeo>fgeo</a>                       | Easily Install and Load Packages of ForestGEO   |
| <a href=https://forestgeo.github.io/fgeo.abundance>fgeo.abundance</a>   | R packages for the Analysis of Forest Dynamics  |
| <a href=https://forestgeo.github.io/fgeo.demography>fgeo.demography</a> | Demography Tools                                |
| <a href=https://forestgeo.github.io/fgeo.habitat>fgeo.habitat</a>       | Habitat Analyses                                |
| <a href=https://forestgeo.github.io/fgeo.map>fgeo.map</a>               | Map ForestGEO’s Data                            |
| <a href=https://forestgeo.github.io/fgeo.tool>fgeo.tool</a>             | Utility Tools for ForestGEO Packages            |

## Search [functions and datasets](https://forestgeo.github.io/fgeo/articles/fgeo.html)

## Installation

    # install.packages("remotes")
    remotes::install_github("forestgeo/fgeo")

To learn the details about how to install packages from GitHub, read
[this blog post](https://goo.gl/dQKEeg).

## Example

Load all **fgeo** packages in one step.

``` r
library(fgeo)
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
#> 27 fgeo.demography          growth_df
#> 69       fgeo.tool       check_unique
#> 88       fgeo.tool        nms_restore
#> 51        fgeo.map          maply_tag
#> 75       fgeo.tool fieldforms_prepare
#> 38        fgeo.map       contour_elev
#> 96       fgeo.tool  row_filter_status
#> 72       fgeo.tool      exists_in_pkg
#> 30 fgeo.demography        recruitment
#> 74       fgeo.tool  fieldforms_output
```

## Related projects

Maintained by ForestGEO

  - [**fgeo.template**](https://forestgeo.github.io/fgeo.template/): An
    R package containing templates used to develop **fgeo** packages.

Not maintained by ForestGEO

  - [CTFS-R Package](http://ctfs.si.edu/Public/CTFSRPackage/): A
    collection of R functions aimed at analysis of data from CTFS forest
    census plots.

  - [**BIOMASS**](https://CRAN.R-project.org/package=BIOMASS): An R
    package to estimate above-ground biomass in tropical
        forests.
    
      - [Description](https://CRAN.R-project.org/package=BIOMASS)
      - [Manual](https://cran.r-project.org/web/packages/BIOMASS/BIOMASS.pdf)
      - [Vignette](https://cran.r-project.org/web/packages/BIOMASS/vignettes/VignetteBiomass.html)

## Code of conduct

Please note that this project is released with a [Contributor Code of
Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree
to abide by its terms.
