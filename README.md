
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
| <a href=https://forestgeo.github.io/fgeo.data>fgeo.data</a>             | Open Datasets of ForestGEO                      |
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
#> 5       fgeo.data                      Open Datasets of ForestGEO
#> 6 fgeo.demography     Calculate Mortality, Recruitment and Growth
#> 7    fgeo.habitat             Analize Soils and Tree-Habitat Data
#> 8        fgeo.map               Map Species, Trees and Topography
#> 9       fgeo.tool                  Functions for General Purposes
```

Table functions and datasets.

``` r
tail(fgeo_index_functions())
#>       package             fun
#> 157 fgeo.tool        xl_to_df
#> 158 fgeo.tool       xl_to_dfs
#> 159 fgeo.tool     xlff_to_csv
#> 160 fgeo.tool     xlff_to_dfs
#> 161 fgeo.tool      xlff_to_xl
#> 162 fgeo.tool xlsheets_to_dfs

tail(fgeo_index_datasets())
#>         package               dataset
#> 41 fgeo.habitat      luquillo_top3_sp
#> 42 fgeo.habitat luquillo_tree6_random
#> 43 fgeo.habitat             soil_fake
#> 44 fgeo.habitat           soil_random
#> 45     fgeo.map             vft_1quad
#> 46     fgeo.map             vft_4quad
```

More tools for searching documentation.

    # See the functions' index of a specific package
    help(package = "fgeo.abundance")
    
    # Use a keyword to serach all help files of a specific package
    help.search("basal area", package = "fgeo.abundance")

## Related projects

### Maintained by ForestGEO

  - [**fgeo.template**](https://forestgeo.github.io/fgeo.template/): An
    R package containing templates used to develop **fgeo** packages.

### Not maintained by ForestGEO

  - [CTFS-R Package](http://ctfs.si.edu/Public/CTFSRPackage/): The
    original package of CTFS functions. No longer supported by
    ForestGEO.

  - [**BIOMASS**](https://CRAN.R-project.org/package=BIOMASS): An R
    package to estimate above-ground biomass in tropical
        forests.
    
      - [Description](https://CRAN.R-project.org/package=BIOMASS)
      - [Manual](https://cran.r-project.org/web/packages/BIOMASS/BIOMASS.pdf)
      - [Vignette](https://cran.r-project.org/web/packages/BIOMASS/vignettes/VignetteBiomass.html)

### Code/data of publications by ForestGEO partners

Data may be made available as required by the journals to enable
reproduction of the results. If you wish to publish based on these data
you are required to get permission from the Principal Investigators of
the corresponding ForestGEO site.

  - [Soil drivers of local-scale tree growth in a lowland tropical
    forest (Zemunik et
    al., 2018).](https://github.com/SoilLabAtSTRI/Soil-drivers-of-tree-growth)

  - [Plant diversity increases with the strength of negative density
    dependence at the global scale (LaManna et
    al., 2018)](https://github.com/forestgeo/LaManna_et_al_Science)

## Information

  - [Getting help](SUPPORT.md).
  - [Contributing](CONTRIBUTING.md).
  - [Contributor Code of Conduct](CODE_OF_CONDUCT.md).

## Acknowledgments

Thanks to all partners of ForestGEO, for sharing their ideas and code.
