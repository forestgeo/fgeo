
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

## [Quick search](https://forestgeo.github.io/fgeo/articles/fgeo.html#quick-search)

## Installation

    # install.packages("remotes")
    remotes::install_github("forestgeo/fgeo")

[How to install packages from GitHub?](https://goo.gl/dQKEeg)

## Example

[Skip and get
started](https://forestgeo.github.io/fgeo/articles/fgeo.html#get-started)

Load all **fgeo** packages in one step.

``` r
library(fgeo)
#> -- Attaching packages --------------------------------------------- fgeo 0.0.0.9000 --
#> v bciex           0.0.0.9000     v fgeo.demography 0.0.0.9000
#> v fgeo.abundance  0.0.0.9004     v fgeo.habitat    0.0.0.9006
#> v fgeo.base       0.0.0.9001     v fgeo.map        0.0.0.9204
#> v fgeo.data       0.0.0.9002     v fgeo.tool       0.0.0.9003
#> 
```

### Search

``` r
fgeo_help("map")
```

<img src="https://i.imgur.com/51flIFs.png" align="center" height=500 />

-----

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

``` r
head(fgeo_index_functions())
#>   package                 fun
#> 2    fgeo      fgeo_conflicts
#> 3    fgeo           fgeo_core
#> 4    fgeo           fgeo_help
#> 5    fgeo        fgeo_imports
#> 6    fgeo          fgeo_index
#> 7    fgeo fgeo_index_datasets
```

``` r
subset(fgeo_index_datasets(), package == "fgeo.data")
#>      package                   dataset
#> 25 fgeo.data           data_dictionary
#> 26 fgeo.data        luquillo_elevation
#> 27 fgeo.data          luquillo_habitat
#> 28 fgeo.data          luquillo_species
#> 29 fgeo.data         luquillo_stem_1ha
#> 30 fgeo.data      luquillo_stem_random
#> 31 fgeo.data luquillo_stem_random_tiny
#> 32 fgeo.data        luquillo_stem6_1ha
#> 33 fgeo.data     luquillo_stem6_random
#> 34 fgeo.data             luquillo_taxa
#> 35 fgeo.data        luquillo_tree6_1ha
#> 36 fgeo.data     luquillo_tree6_random
#> 37 fgeo.data        luquillo_vft_4quad
```

Try also:

``` r
View(fgeo_index_datasets())
```

<img src="https://i.imgur.com/Jt9xH9d.png" align="center" height=500 />

-----

### Update

    fgeo_update()

[Get
started](https://forestgeo.github.io/fgeo/articles/fgeo.html#get-started)

## Related projects

(Not maintained by ForestGEO)

  - [CTFS-R Package](http://ctfs.si.edu/Public/CTFSRPackage/): The
    original package of CTFS functions. No longer supported by
    ForestGEO.

  - [**BIOMASS**](https://CRAN.R-project.org/package=BIOMASS): An R
    package to estimate above-ground biomass in tropical
        forests.
    
      - [Description](https://CRAN.R-project.org/package=BIOMASS)
      - [Manual](https://cran.r-project.org/web/packages/BIOMASS/BIOMASS.pdf)
      - [Vignette](https://cran.r-project.org/web/packages/BIOMASS/vignettes/VignetteBiomass.html)

## Code/data of publications by ForestGEO partners

Data have been made available as required by the journal to enable
reproduction of the results presented in the paper. Please do not share
these data without permission of the ForestGEO plot Principal
Investigators. If you wish to publish papers based on these data you are
also required to get permission from the PIs of the corresponding
ForestGEO plots.

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
