
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
<a href=https://forestgeo.github.io/fgeo.demography>fgeo.demography</a>,
<a href=https://forestgeo.github.io/fgeo.habitat>fgeo.habitat</a>). It
also includes general-purpose functions to simplify the visualization
(<a href=https://forestgeo.github.io/fgeo.map>fgeo.map</a>) and
manipulation
(<a href=https://forestgeo.github.io/fgeo.base>fgeo.base</a>,
<a href=https://forestgeo.github.io/fgeo.tool>fgeo.tool</a>) of
ForestGEO datasets (e.g.
<a href=https://forestgeo.github.io/fgeo.data>fgeo.data</a>).

[Quick search – click here to search by package, function, dataset, or
help
file.](https://forestgeo.github.io/fgeo/articles/siteonly/quick-search.html)

[Questions and Answers – click here to find answers to frequently asked
questions about
fgeo.](https://forestgeo.github.io/fgeo/articles/siteonly/questions-and-answers.html)

## Installation

Install the pre-release version of **fgeo**:

    # install.packages("devtools")
    devtools::install_github("forestgeo/fgeo@pre-release")

Or install the development version of **fgeo**:

    # install.packages("devtools")
    devtools::install_github("forestgeo/fgeo")

Or [install all **fgeo** packages in one
step](https://forestgeo.github.io/fgeo/index.html#installation).

For details on how to install packages from GitHub, see [this
article](https://goo.gl/dQKEeg).

## Example

Load all **fgeo** packages in one step.

``` r
library(fgeo)
#> -- Attaching packages ---------------------------------------------- fgeo 0.0.0.9000 --
#> v fgeo.abundance  0.0.0.9005     v fgeo.habitat    0.0.0.9006
#> v fgeo.base       0.0.0.9001     v fgeo.map        0.0.0.9402
#> v fgeo.data       0.0.0.9005     v fgeo.tool       0.0.0.9003
#> v fgeo.demography 0.0.0.9102
#> 
```

Need help? Use `fgeo_help()` to search every help file in the fgeo
package.

``` r
fgeo_help()
```

![](https://i.imgur.com/MmbmeZd.png)

You can narrow down your search by using a keyword.

``` r
fgeo_help("datasets")
```

![](https://i.imgur.com/4AdTD3G.png)

``` r
# Short name
stem <- luquillo_stem_1ha
# This dataset comes with multiple censuses.
unique(stem$CensusID)
#> [1] 1 2 3 4 5 6
stem
#> # A tibble: 72,582 x 19
#>    treeID stemID tag   StemTag sp    quadrat    gx    gy MeasureID CensusID
#>     <int>  <int> <chr> <chr>   <chr> <chr>   <dbl> <dbl>     <int>    <int>
#>  1     46     46 1000~ 100001  PSYB~ 921      164.  416.        46        1
#>  2     47     47 1000~ 100002  PSYB~ 921      165.  416         47        1
#>  3     47     48 1000~ 100003  PSYB~ 921      165.  416         48        1
#>  4     47     49 1000~ 100004  PSYB~ 921      165.  416         49        1
#>  5     47     50 1000~ 100005  PSYB~ 921      165.  416         50        1
#>  6     47     51 1000~ 100006  PSYB~ 921      165.  416         51        1
#>  7     47     52 1000~ 100007  PSYB~ 921      165.  416         52        1
#>  8     47     53 1000~ 100008  PSYB~ 921      165.  416         53        1
#>  9     47     54 1000~ 100009  PSYB~ 921      165.  416         54        1
#> 10     47     55 1000~ 100010  PSYB~ 921      165.  416         55        1
#> # ... with 72,572 more rows, and 9 more variables: dbh <dbl>, pom <chr>,
#> #   hom <dbl>, ExactDate <date>, DFstatus <chr>, codes <chr>,
#> #   countPOM <dbl>, status <chr>, date <dbl>
```

Pick one census from the bottom (n \< 0) rank of `CensusID`.

``` r
stem6 <- pick_top(stem, var = CensusID, n = -1)
unique(stem6$CensusID)
#> [1] 6
```

Determine the status of each tree based on the status of each stem.

``` r
stem6 <- add_status_tree(stem6, status_a = "A", status_d = "D")
alive_trees <- subset(stem6, status_tree == "A")

# Note that alive trees may have some missing, gone or dead stems
some_cols <- c( "treeID", "status_tree", "stemID", "status")
example_tree <- 46
subset(alive_trees, treeID == example_tree, some_cols)
#> # A tibble: 2 x 4
#>   treeID status_tree stemID status
#>    <int> <chr>        <int> <chr> 
#> 1     46 A               46 D     
#> 2     46 A           114033 G
```

Pick stems of 10 mm or more.

``` r
ten_plus <- pick_dbh_min(alive_trees, 10)
range(ten_plus$dbh, na.rm = TRUE)
#> [1]   10 1405
```

Drop missing values of `dbh` with an informative warning.

``` r
non_missing <- drop_if_na(ten_plus, "dbh")
#> Warning: Dropping 5255 rows with missing `dbh` values.
```

Count distinct values of `stemID` and `treeID`.

``` r
# Stem abundance
abundance(non_missing)
#> Warning: `treeid`: Duplicated values were detected. Do you need to pick
#> main stems?
#> # A tibble: 1 x 1
#>       n
#>   <int>
#> 1  2564

# Tree abundance (picking main stems -- with highest `hom` and largest `dbh`)
largest_stem <- fgeo.tool::pick_main_stem(non_missing)
abundance(largest_stem)
#> # A tibble: 1 x 1
#>       n
#>   <int>
#> 1  2319
```

Count largest stems (unique `treeID`s) by species.

``` r
by_sp <- group_by(largest_stem, sp)
abundance(by_sp)
#> # A tibble: 70 x 2
#> # Groups:   sp [70]
#>    sp         n
#>    <chr>  <int>
#>  1 ALCFLO    11
#>  2 ALCLAT    15
#>  3 ANDINE     1
#>  4 ANTOBT     1
#>  5 ARDGLA     1
#>  6 BUCTET    11
#>  7 BYRSPI    25
#>  8 CALCAL     2
#>  9 CASARB   489
#> 10 CASSYL    58
#> # ... with 60 more rows
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
