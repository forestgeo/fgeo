
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

To install **fgeo** run this code in R:

    if (!requireNamespace("fgeo")) {
      if (!requireNamespace("remotes")) {
        install.packages("remotes")
      }
      remotes::install_github("forestgeo/fgeo")
    }

[How to install packages from GitHub?](https://goo.gl/dQKEeg)

## Example

[Skip and get
started](https://forestgeo.github.io/fgeo/articles/fgeo.html#get-started)

[Try **fgeo** on rstudio.cloud](http://bit.ly/fgeo-demo)

Load all **fgeo** packages in one step.

``` r
library(fgeo)
#> -- Attaching packages ---------------------------------------------------------- fgeo 0.0.0.9000 --
#> v bciex           0.0.0.9000     v fgeo.demography 0.0.0.9000
#> v fgeo.abundance  0.0.0.9004     v fgeo.habitat    0.0.0.9006
#> v fgeo.base       0.0.0.9001     v fgeo.map        0.0.0.9204
#> v fgeo.data       0.0.0.9002     v fgeo.tool       0.0.0.9003
#> 
```

### Search

Find help about anything.

``` r
fgeo_help()
```

![](https://i.imgur.com/up282WS.png)

Find help about some topic.

``` r
fgeo_help("map")
```

![](https://i.imgur.com/ud4qsmC.png)

Each help page has a similar structure.

![](https://i.imgur.com/tKcuKTR.png)
![](https://i.imgur.com/M3TZiLZ.png)
![](https://i.imgur.com/QthgV4B.png)
![](https://i.imgur.com/LHZAlzf.png)

![](https://i.imgur.com/L8XKrqp.png)

Try the examples.

``` r
census <- fgeo.tool::pick_top(bciex::bci12s7mini, sp, 2)
elevation <- bciex::bci_elevation

map_sp_elev(census)
map_sp_elev(census, elevation)
```

Same (because **fgeo** already loaded **fgeo.tool** and **bciex** for
you):

``` r
census <- pick_top(bci12s7mini, sp, 2)
elevation <- bci_elevation

map_sp_elev(census)
map_sp_elev(census, elevation)
```

![](https://i.imgur.com/7ojjZxA.png)
![](https://i.imgur.com/zgeFo5s.png)

From any help pages you may want to **See also** other related
topics.

![](https://i.imgur.com/eHdgdy5.png)

## [Try **fgeo** on rstudio.cloud](http://bit.ly/fgeo-demo)

## [Get started](https://forestgeo.github.io/fgeo/articles/fgeo.html#get-started)

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
