
<!-- README.md is generated from README.Rmd. Please edit that file -->

# <img src="https://i.imgur.com/vTLlhbp.png" align="right" height=88 /> Analyze forest diversity and dynamics

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.org/forestgeo/fgeo.svg?branch=master)](https://travis-ci.org/forestgeo/fgeo)
[![Coverage
status](https://codecov.io/gh/forestgeo/fgeo/branch/master/graph/badge.svg)](https://codecov.io/github/forestgeo/fgeo?branch=master)
[![CRAN
status](https://www.r-pkg.org/badges/version/fgeo)](https://cran.r-project.org/package=fgeo)

**fgeo** installs and loads multiple R packages, functions, and datasets
to analyze trees abundance, demography, and habitats
(<a href=https://forestgeo.github.io/fgeo.abundance>fgeo.abundance</a>,
<a href=https://forestgeo.github.io/fgeo.demography>fgeo.demography</a>).
It also includes general-purpose functions to simplify the visualization
(<a href=https://forestgeo.github.io/fgeo.map>fgeo.map</a>) and
manipulation
(<a href=https://forestgeo.github.io/fgeo.tool>fgeo.tool</a>) of
ForestGEO datasets (e.g. <a href=https://forestgeo.github.io/></a>).

  - [Contact me](https://github.com/forestgeo/fgeo/issues/new) to ask
    Questions, report bugs, or propose features.

  - [Quick search – click here to search by package, function, dataset,
    or help
    file.](https://forestgeo.github.io/fgeo/articles/siteonly/quick-search.html)

## Before you install **fgeo**

Before you install **fgeo**, you may try it at
<https://bit.ly/fgeo-demo> (you will need to create a free rstudio.cloud
account).

## Installation

  - Try this if you have installed packages from GitHub before.

<!-- end list -->

``` r
# install.packages(devtools)
devtools::install_github("forestgeo/fgeo")
```

  - Try [installing fgeo from its source
    code](https://github.com/forestgeo/fgeo-build#install-fgeo) if you
    exceeded GitHub’s rate-limit (to increase your rate-limit follow the
    link in the next point).

  - Read the [detailed
    instructions](https://forestgeo.github.io/fgeo/articles/siteonly/questions-and-answers.html#how-can-i-troubleshoot-the-installation-from-github)
    if you need more help. For more details on how to install packages
    from GitHub, see [this article](https://goo.gl/dQKEeg).

You can remove **fgeo** with `remove.packages("fgeo")`.

## Example

Load all **fgeo** packages in one step.

``` r
library(fgeo)
#> -- Attaching packages ------------------------------------------- fgeo 0.0.0.9002 --
#> v fgeo.abundance  0.0.0.9006     v fgeo.tool       0.0.0.9004
#> v fgeo.demography 0.0.0.9103     v fgeo.x          0.0.0.9000
#> v fgeo.map        0.0.0.9402
#> 
```

Need help? Use `fgeo_help()` to search every help file in the **fgeo**
package.

``` r
fgeo_help()
```

![](https://i.imgur.com/k4wz4Ah.png)

You can narrow down your search by using a keyword.

``` r
fgeo_help("datasets")
```

![](https://i.imgur.com/YlgRljc.png)

``` r
# Short name
stem6 <- download_data("luquillo_stem6_random")
stem6
#> # A tibble: 1,320 x 19
#>    treeID stemID tag   StemTag sp    quadrat    gx    gy MeasureID CensusID
#>     <int>  <int> <chr> <chr>   <chr> <chr>   <dbl> <dbl>     <int>    <int>
#>  1    104    143 10009 10009   DACE~ 113      10.3  245.    582850        6
#>  2    119    158 1001~ 100104  MYRS~ 1021    183.   410.    578696        6
#>  3    180    222 1001~ 100095  CASA~ 921     165.   410.        NA       NA
#>  4    180    223 1001~ 100096  CASA~ 921     165.   410.        NA       NA
#>  5    180    224 1001~ 100171  CASA~ 921     165.   410.    617046        6
#>  6    180    225 1001~ 100174  CASA~ 921     165.   410.    617049        6
#>  7    602    736 1006~ 100649  GUAG~ 821     149.   414.    614253        6
#>  8    631    775 10069 10069   PREM~ 213      38.3  245.    598429        6
#>  9    647    793 1007~ 100708  SCHM~ 821     143.   411.    614211        6
#> 10   1086   1339 10122 10122   DRYG~ 413      68.9  253.    603131        6
#> # ... with 1,310 more rows, and 9 more variables: dbh <dbl>, pom <chr>,
#> #   hom <dbl>, ExactDate <date>, DFstatus <chr>, codes <chr>,
#> #   countPOM <dbl>, status <chr>, date <dbl>
```

Determine the status of each tree based on the status of each stem.

``` r
stem6 <- add_status_tree(stem6, status_a = "A", status_d = "D")
alive_trees <- subset(stem6, status_tree == "A")
alive_trees
#> # A tibble: 1,182 x 20
#>    treeID stemID tag   StemTag sp    quadrat    gx    gy MeasureID CensusID
#>     <int>  <int> <chr> <chr>   <chr> <chr>   <dbl> <dbl>     <int>    <int>
#>  1    104    143 10009 10009   DACE~ 113      10.3  245.    582850        6
#>  2    119    158 1001~ 100104  MYRS~ 1021    183.   410.    578696        6
#>  3    180    222 1001~ 100095  CASA~ 921     165.   410.        NA       NA
#>  4    180    223 1001~ 100096  CASA~ 921     165.   410.        NA       NA
#>  5    180    224 1001~ 100171  CASA~ 921     165.   410.    617046        6
#>  6    180    225 1001~ 100174  CASA~ 921     165.   410.    617049        6
#>  7    602    736 1006~ 100649  GUAG~ 821     149.   414.    614253        6
#>  8    631    775 10069 10069   PREM~ 213      38.3  245.    598429        6
#>  9    647    793 1007~ 100708  SCHM~ 821     143.   411.    614211        6
#> 10   1086   1339 10122 10122   DRYG~ 413      68.9  253.    603131        6
#> # ... with 1,172 more rows, and 10 more variables: dbh <dbl>, pom <chr>,
#> #   hom <dbl>, ExactDate <date>, DFstatus <chr>, codes <chr>,
#> #   countPOM <dbl>, status <chr>, date <dbl>, status_tree <chr>
```

Pick stems of 10 mm or more.

``` r
ten_plus <- pick_dbh_min(alive_trees, 10)
range(ten_plus$dbh, na.rm = TRUE)
#> [1]  10.2 992.0
```

Count distinct values of `stemID` and `treeID`.

``` r
# Drop missing values of `dbh`
non_missing <- filter(ten_plus, !is.na(dbh))

# Stem abundance
abundance(non_missing)
#> Warning: `treeid`: Duplicated values were detected. Do you need to pick
#> main stems?
#> # A tibble: 1 x 1
#>       n
#>   <int>
#> 1   840

# Tree abundance (picking main stems -- with highest `hom` and largest `dbh`)
largest_stem <- fgeo.tool::pick_main_stem(non_missing)
abundance(largest_stem)
#> # A tibble: 1 x 1
#>       n
#>   <int>
#> 1   786
```

Count largest stems (unique `treeID`s) by species.

``` r
by_sp <- group_by(largest_stem, sp)
abundance(by_sp)
#> # A tibble: 65 x 2
#> # Groups:   sp [65]
#>    sp         n
#>    <chr>  <int>
#>  1 ALCFLO     3
#>  2 ANDINE     2
#>  3 ARDGLA     2
#>  4 ARTALT     1
#>  5 BUCTET     7
#>  6 BYRSPI    10
#>  7 CALCAL     1
#>  8 CASARB    66
#>  9 CASSYL    26
#> 10 CECSCH    29
#> # ... with 55 more rows
```

[Get
started](https://forestgeo.github.io/fgeo/articles/fgeo.html#get-started)

[Try **fgeo** on rstudio.cloud](http://bit.ly/fgeo-demo)

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

## R code from recent publications by ForestGEO partners

Data have been made available as required by the journal to enable
reproduction of the results presented in the paper. Please do not share
these data without permission of the ForestGEO plot Principal
Investigators (PIs). If you wish to publish papers based on these data,
you are also required to get permission from the PIs of the
corresponding ForestGEO plots.

  - [Soil drivers of local-scale tree growth in a lowland tropical
    forest (Zemunik et
    al., 2018).](https://github.com/SoilLabAtSTRI/Soil-drivers-of-tree-growth)

  - [Plant diversity increases with the strength of negative density
    dependence at the global scale (LaManna et
    al., 2018)](https://github.com/forestgeo/LaManna_et_al_Science)
    
      - Response \#1: LaManna et al. 2018. Response to Comment on “Plant
        diversity increases with the strength of negative density
        dependence at the global scale” Science Vol. 360, Issue 6391,
        eaar3824. DOI: 10.1126/science.aar3824
    
      - Response \#2: LaManna et al. 2018. Response to Comment on “Plant
        diversity increases with the strength of negative density
        dependence at the global scale”. Science Vol. 360, Issue 6391,
        eaar5245. DOI: 10.1126/science.aar5245

## Information

  - [Getting help](SUPPORT.md).
  - [Contributing](CONTRIBUTING.md).
  - [Contributor Code of Conduct](CODE_OF_CONDUCT.md).

## Acknowledgments

Thanks to all partners of ForestGEO for sharing their ideas and code.
For feedback on **fgeo**, special thanks to Gabriel Arellano, Stuart
Davies, Lauren Krizel, Sean McMahon, and Haley Overstreet. There are
many other people that deserve special acknowledgements; I thank them in
the documentation and home page of each individual package that make up
the **fgeo** development.
