
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
#>             package                 fun
#> 39         fgeo.map    hide_axis_labels
#> 70        fgeo.tool check_unique_vector
#> 15   fgeo.abundance          basal_area
#> 6              fgeo fgeo_index_datasets
#> 42         fgeo.map         limit_gx_gy
#> 48         fgeo.map      map_tag_header
#> 62        fgeo.tool            add_lxly
#> 31  fgeo.demography      recruitment_df
#> 59        fgeo.tool        add_col_row2
#> 100       fgeo.tool   str_as_tidy_names
```

## Related projects

  - [CTFS-R Package](http://ctfs.si.edu/Public/CTFSRPackage/).

  - [BIOMASS](https://CRAN.R-project.org/package=BIOMASS): An R package
    to estimate above-ground biomass in tropical
        forests.
    
      - [Description](https://CRAN.R-project.org/package=BIOMASS)
      - [Manual](https://cran.r-project.org/web/packages/BIOMASS/BIOMASS.pdf)
      - [Vignette](https://cran.r-project.org/web/packages/BIOMASS/vignettes/VignetteBiomass.html)

## Code of conduct

Please note that this project is released with a [Contributor Code of
Conduct](.github/CODE_OF_CONDUCT.md). By participating in this project
you agree to abide by its terms.
