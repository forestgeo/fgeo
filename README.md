
<!-- README.md is generated from README.Rmd. Please edit that file -->

# <img src="https://i.imgur.com/m8FNhQR.png" align="right" height=88 /> Analyze forest diversity and dynamics

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
| <a href=https://forestgeo.github.io/fgeo>fgeo</a>                       | Easily Install and Load Multiple Packages       |
| <a href=https://forestgeo.github.io/fgeo.abundance>fgeo.abundance</a>   | Calculate Abundance, Basal Area and Diversity   |
| <a href=https://forestgeo.github.io/fgeo.base>fgeo.base</a>             | ForestGEO Functions With No External Dependency |
| <a href=https://forestgeo.github.io/fgeo.demography>fgeo.demography</a> | Calculate Mortality, Recruitment and Growth     |
| <a href=https://forestgeo.github.io/fgeo.habitat>fgeo.habitat</a>       | Analize Soils and Tree-Habitat Data             |
| <a href=https://forestgeo.github.io/fgeo.map>fgeo.map</a>               | Map Species, Trees and Topography               |
| <a href=https://forestgeo.github.io/fgeo.tool>fgeo.tool</a>             | Functions for General Purposes                  |

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
#> 2            fgeo       Easily Install and Load Multiple Packages
#> 3  fgeo.abundance   Calculate Abundance, Basal Area and Diversity
#> 4       fgeo.base ForestGEO Functions With No External Dependency
#> 5 fgeo.demography     Calculate Mortality, Recruitment and Growth
#> 6    fgeo.habitat             Analize Soils and Tree-Habitat Data
#> 7        fgeo.map               Map Species, Trees and Topography
#> 8       fgeo.tool                  Functions for General Purposes
```

Table and explore functions.

``` r
library(dplyr)
funs <- fgeo_index_functions()
sample_n(funs, 10)
#>          package                    fun
#> 131    fgeo.tool      row_filter_status
#> 73      fgeo.map               map_elev
#> 134    fgeo.tool                row_top
#> 75      fgeo.map         map_gx_gy_elev
#> 92     fgeo.tool               add_lxly
#> 56  fgeo.habitat       extract_gridsize
#> 6           fgeo    fgeo_index_datasets
#> 80      fgeo.map          maply_sp_elev
#> 79      fgeo.map             maply_quad
#> 130    fgeo.tool row_discard_twice_dead
```

## Related projects

Maintained by ForestGEO

  - [**fgeo.template**](https://forestgeo.github.io/fgeo.template/): An
    R package containing templates used to develop **fgeo** packages.

Not maintained by ForestGEO

  - [CTFS-R Package](http://ctfs.si.edu/Public/CTFSRPackage/): The
    original package of CTFS functions. No longer supported by
    ForestGEO.

  - [**BIOMASS**](https://CRAN.R-project.org/package=BIOMASS): An R
    package to estimate above-ground biomass in tropical
        forests.
    
      - [Description](https://CRAN.R-project.org/package=BIOMASS)
      - [Manual](https://cran.r-project.org/web/packages/BIOMASS/BIOMASS.pdf)
      - [Vignette](https://cran.r-project.org/web/packages/BIOMASS/vignettes/VignetteBiomass.html)

Code of publications by ForestGEO partners

  - [Soil drivers of local-scale tree growth in a lowland tropical
    forest (Zemunik et
    al., 2018).](https://github.com/SoilLabAtSTRI/Soil-drivers-of-tree-growth)

## Information

  - [Getting help](SUPPORT.md).
  - [Contributing](CONTRIBUTING.md).
  - [Contributor Code of Conduct](CODE_OF_CONDUCT.md).

## Acknowledgements

Thanks to all partners of ForestGEO, for sharing their ideas and code.
